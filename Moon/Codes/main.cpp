#define LGFX_AUTODETECT // Autodetect board
#define LGFX_USE_V1

#include <lvgl.h>
#include "lv_conf.h"
#include "ui.h"
#include <WiFi.h>

#include <LovyanGFX.hpp> // main library
static LGFX lcd;         // declare display variable

SemaphoreHandle_t wifi_mutex;
SemaphoreHandle_t sema_01;



/*Change to your screen resolution*/
static const uint16_t screenWidth = 480;
static const uint16_t screenHeight = 320;

static lv_disp_draw_buf_t draw_buf;
static lv_color_t buf[screenWidth * screenHeight / 10];

unsigned long networkTimeout = 10 * 1000;

#if LV_USE_LOG != 0
/* Serial debugging */
void my_print(const char *buf)
{
    Serial.printf(buf);
    Serial.flush();
}
#endif

// Variables for touch x,y
#ifdef DRAW_ON_SCREEN
static int32_t x, y;
#endif

/*TASK 선언 */
void Task1(void *pvParameters);
void Task2(void *pvParameters);

/* Function declaration */
void display_flush(lv_disp_drv_t *disp, const lv_area_t *area, lv_color_t *color_p);
void touchpad_read(lv_indev_drv_t *indev_driver, lv_indev_data_t *data);

void do_scan();

static lv_obj_t *list1;
void setup()
{
    Serial.begin(115200); /* prepare for possible serial debug */
    WiFi.mode(WIFI_STA);
    WiFi.disconnect();

    
	wifi_mutex = xSemaphoreCreateMutex();
    sema_01 = xSemaphoreCreateBinary();

	if (wifi_mutex == NULL) {
		Serial.println("Mutex can not be created");
	}

    xTaskCreatePinnedToCore(
        Task1, "Task1", 1024, NULL, 1 // 
        ,
        NULL, ARDUINO_RUNNING_CORE);

    xTaskCreatePinnedToCore(
        Task2, "Task2", 1024 // Stack size
        ,
        NULL, 1 // 높을수록 먼저 처리
        ,
        NULL, ARDUINO_RUNNING_CORE);

    lv_init();

#if LV_USE_LOG != 0
    lv_log_register_print_cb(my_print); /* register print function for debugging */
#endif

    lcd.init(); // Initialize LovyanGFX
    lv_init();  // Initialize lvgl

    // Setting display to landscape
    if (lcd.width() < lcd.height())
        lcd.setRotation(lcd.getRotation() ^ 1);

    /* LVGL : Setting up buffer to use for display */
    lv_disp_draw_buf_init(&draw_buf, buf, NULL, screenWidth * 10);

    /* LVGL : Setup & Initialize the display device driver */
    static lv_disp_drv_t disp_drv;
    lv_disp_drv_init(&disp_drv);
    disp_drv.hor_res = screenWidth;
    disp_drv.ver_res = screenHeight;
    disp_drv.flush_cb = display_flush;
    disp_drv.draw_buf = &draw_buf;
    lv_disp_drv_register(&disp_drv);

    /* LVGL : Setup & Initialize the input device driver */
    static lv_indev_drv_t indev_drv;
    lv_indev_drv_init(&indev_drv);
    indev_drv.type = LV_INDEV_TYPE_POINTER;
    indev_drv.read_cb = touchpad_read;
    lv_indev_drv_register(&indev_drv);
    ui_init();
    Serial.println("Completely Load!");

    list1 = lv_list_create(ui_SettingSceen);
    lv_obj_set_size(list1, 300, 200);
    // lv_obj_center(list1);
    lv_obj_align(list1, LV_ALIGN_CENTER, 67, -31);
    /*Create a list*/
}

void loop()
{
    lv_timer_handler(); /* let the GUI do its work */
    delay(5);
}

void ui_event_Button4()
{

    unsigned long startingTime = millis();
    WiFi.mode(WIFI_STA);
    WiFi.disconnect();

    WiFi.begin(lv_textarea_get_text(ui_TextArea3), lv_textarea_get_text(ui_TextArea4));
    while (WiFi.status() != WL_CONNECTED && (millis() - startingTime) < networkTimeout)
    {
        delay(500);
    }

    if (WiFi.status() == WL_CONNECTED)
    {

        lv_textarea_set_text(ui_TextArea3, WiFi.localIP().toString().c_str());
        lv_scr_load_anim(ui_Screen3, LV_SCR_LOAD_ANIM_MOVE_LEFT, 500, 0, false);
    }
    else
    {
        _ui_flag_modify(ui_Keyboard3, LV_OBJ_FLAG_HIDDEN, _UI_MODIFY_FLAG_TOGGLE);
        _ui_flag_modify(ui_WifiCall, LV_OBJ_FLAG_HIDDEN, _UI_MODIFY_FLAG_TOGGLE);
        _ui_flag_modify(ui_TextArea3, LV_OBJ_FLAG_HIDDEN, _UI_MODIFY_FLAG_TOGGLE);
        _ui_flag_modify(ui_TextArea4, LV_OBJ_FLAG_HIDDEN, _UI_MODIFY_FLAG_TOGGLE);
        // _ui_flag_modify(ui_Keyboard3, LV_OBJ_FLAG_HIDDEN, _UI_MODIFY_FLAG_TOGGLE);
        _ui_flag_modify(list1, LV_OBJ_FLAG_HIDDEN, _UI_MODIFY_FLAG_TOGGLE);
    }
}

static void list_click(lv_event_t *e)
{
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t *obj = lv_event_get_target(e);
    if (code == LV_EVENT_CLICKED)
    {
        // LV_LOG_USER("Clicked: %s", lv_list_get_btn_text(list1, obj));
        // list에서 ssid가 클릭되고 ssid가 textarea에 출력된다!
        lv_textarea_set_text(ui_TextArea3, lv_list_get_btn_text(list1, obj));
        // 스크린1에서 스크린2로 전환한다!

        _ui_flag_modify(ui_Keyboard3, LV_OBJ_FLAG_HIDDEN, _UI_MODIFY_FLAG_TOGGLE);
        _ui_flag_modify(ui_WifiCall, LV_OBJ_FLAG_HIDDEN, _UI_MODIFY_FLAG_TOGGLE);
        _ui_flag_modify(ui_TextArea3, LV_OBJ_FLAG_HIDDEN, _UI_MODIFY_FLAG_TOGGLE);
        _ui_flag_modify(ui_TextArea4, LV_OBJ_FLAG_HIDDEN, _UI_MODIFY_FLAG_TOGGLE);
        // _ui_flag_modify(ui_Keyboard3, LV_OBJ_FLAG_HIDDEN, _UI_MODIFY_FLAG_TOGGLE);
        _ui_flag_modify(list1, LV_OBJ_FLAG_HIDDEN, _UI_MODIFY_FLAG_TOGGLE);

        // lv_scr_load_anim(ui_Screen3, LV_SCR_LOAD_ANIM_MOVE_LEFT, 500, 0, false);
    }
}


void do_scan()
{
   

            WiFi.mode(WIFI_STA);
            WiFi.disconnect();
            // n은 검색한 공유기의 갯수
            int n = WiFi.scanNetworks();

            lv_obj_clean(list1);
            if (n == 0)
            {
                Serial.println(F("no networks found"));
            }
            else
            {
                lv_obj_clean(list1);
                lv_obj_t *btn;
                for (int i = 0; i < n; ++i)
                {

                    btn = lv_list_add_btn(list1, LV_SYMBOL_WIFI, WiFi.SSID(i).c_str());
                    lv_obj_add_event_cb(btn, list_click, LV_EVENT_CLICKED, NULL);
                }
            }

            // 검색결과를 메모리에서 삭제한다!
            WiFi.scanDelete();
    
}

void Task1(void *pvParameters)
{
    (void)pvParameters;

    for (;;)
    {
	xSemaphoreTake(wifi_mutex, portMAX_DELAY);
		Serial.println("Task A data");
		xSemaphoreGive(wifi_mutex);
		vTaskDelay(pdMS_TO_TICKS(1000));

    }
}

void Task2(void *pvParameters)
{
    (void)pvParameters;

    for (;;)
    {
        xSemaphoreTake(wifi_mutex, portMAX_DELAY);
		Serial.println("Task B data");
		xSemaphoreGive(wifi_mutex);
		vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

/*** Display callback to flush the buffer to screen ***/
void display_flush(lv_disp_drv_t *disp, const lv_area_t *area, lv_color_t *color_p)
{
    uint32_t w = (area->x2 - area->x1 + 1);
    uint32_t h = (area->y2 - area->y1 + 1);

    lcd.startWrite();
    lcd.setAddrWindow(area->x1, area->y1, w, h);
    lcd.pushColors((uint16_t *)&color_p->full, w * h, true);
    lcd.endWrite();

    lv_disp_flush_ready(disp);
}

/*** Touchpad callback to read the touchpad ***/
void touchpad_read(lv_indev_drv_t *indev_driver, lv_indev_data_t *data)
{
    uint16_t touchX, touchY;
    bool touched = lcd.getTouch(&touchX, &touchY);

    if (!touched)
    {
        data->state = LV_INDEV_STATE_REL;
    }
    else
    {
        data->state = LV_INDEV_STATE_PR;

        /*Set the coordinates*/
        data->point.x = touchX;
        data->point.y = touchY;

        // Serial.printf("Touch (x,y): (%03d,%03d)\n",touchX,touchY );
    }
}