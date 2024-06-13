#define LGFX_AUTODETECT // Autodetect board
#define LGFX_USE_V1     // set to use new version of library
//#define LV_CONF_INCLUDE_SIMPLE

#include <lvgl.h>
#include "lv_conf.h"
#include "ui.h"

/* Uncomment below line to draw on screen with touch */
//#define DRAW_ON_SCREEN

/*If you want to use the LVGL examples,
  make sure to install the lv_examples Arduino library
  and uncomment the following line.
#include <lv_examples.h>
*/

#include <LovyanGFX.hpp> // main library
static LGFX lcd; // declare display variable

/*Change to your screen resolution*/
static const uint16_t screenWidth  = 480;
static const uint16_t screenHeight = 320;

static lv_disp_draw_buf_t draw_buf;
static lv_color_t buf[ screenWidth * screenHeight / 10 ];

#if LV_USE_LOG != 0
/* Serial debugging */
void my_print(const char * buf)
{
    Serial.printf(buf);
    Serial.flush();
}
#endif

// Variables for touch x,y
#ifdef DRAW_ON_SCREEN
static int32_t x, y;
#endif

/* Function declaration */
void display_flush(lv_disp_drv_t *disp, const lv_area_t *area, lv_color_t *color_p);
void touchpad_read(lv_indev_drv_t *indev_driver, lv_indev_data_t *data);

void setup()
{
    Serial.begin( 115200 ); /* prepare for possible serial debug */

    String LVGL_Arduino = "Hello Arduino! ";
    LVGL_Arduino += String('V') + lv_version_major() + "." + lv_version_minor() + "." + lv_version_patch();

    Serial.println( LVGL_Arduino );
    Serial.println( "I am LVGL_Arduino" );

    lv_init();

	#if LV_USE_LOG != 0
		lv_log_register_print_cb( my_print ); /* register print function for debugging */
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
}

void loop()
{
    lv_timer_handler(); /* let the GUI do its work */
    delay(5);
	
	#ifdef DRAW_ON_SCREEN
	/*** Draw on screen with touch ***/
	if (lcd.getTouch(&x, &y))
	{
		lcd.fillRect(x - 2, y - 2, 5, 5, TFT_RED);
		lcd.setCursor(380, 0);
		lcd.printf("Touch:(%03d,%03d)", x, y);
	}
	#endif
}

/*** Display callback to flush the buffer to screen ***/
void display_flush(lv_disp_drv_t * disp, const lv_area_t *area, lv_color_t *color_p)
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
void touchpad_read(lv_indev_drv_t * indev_driver, lv_indev_data_t * data)
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