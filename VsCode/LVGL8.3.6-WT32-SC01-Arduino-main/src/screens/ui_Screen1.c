// This file was generated by SquareLine Studio
// SquareLine Studio version: SquareLine Studio 1.4.1
// LVGL version: 8.3.6
// Project name: SquareLine_Project

#include "../ui.h"

void ui_Screen1_screen_init(void)
{
    ui_Screen1 = lv_obj_create(NULL);
    lv_obj_clear_flag(ui_Screen1, LV_OBJ_FLAG_SCROLLABLE);      /// Flags

    ui_Button1 = lv_btn_create(ui_Screen1);
    lv_obj_set_width(ui_Button1, 100);
    lv_obj_set_height(ui_Button1, 50);
    lv_obj_set_x(ui_Button1, 8);
    lv_obj_set_y(ui_Button1, 100);
    lv_obj_set_align(ui_Button1, LV_ALIGN_CENTER);

    ui_Label1 = lv_label_create(ui_Button1);
    lv_obj_set_width(ui_Label1, LV_SIZE_CONTENT);   /// 1
    lv_obj_set_height(ui_Label1, LV_SIZE_CONTENT);    /// 1
    lv_obj_set_align(ui_Label1, LV_ALIGN_CENTER);
    lv_label_set_text(ui_Label1, "버튼");
    lv_obj_set_style_text_font(ui_Label1, &ui_font_hanache, LV_PART_MAIN | LV_STATE_DEFAULT);

    ui_Keyboard1 = lv_keyboard_create(ui_Screen1);
    lv_obj_set_width(ui_Keyboard1, 300);
    lv_obj_set_height(ui_Keyboard1, 120);
    lv_obj_set_x(ui_Keyboard1, 4);
    lv_obj_set_y(ui_Keyboard1, -40);
    lv_obj_set_align(ui_Keyboard1, LV_ALIGN_CENTER);
    lv_obj_set_flex_flow(ui_Keyboard1, LV_FLEX_FLOW_ROW);
    lv_obj_set_flex_align(ui_Keyboard1, LV_FLEX_ALIGN_START, LV_FLEX_ALIGN_START, LV_FLEX_ALIGN_START);

    lv_obj_add_event_cb(ui_Button1, ui_event_Button1, LV_EVENT_ALL, NULL);

}