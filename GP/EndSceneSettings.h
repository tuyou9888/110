//
//  EndSceneSettings.h
//  GP
//
//  Created by Vladimir Vinnik on 14.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#ifndef GP_EndSceneSettings_h
#define GP_EndSceneSettings_h

#import "GlobalSettings.h"

#pragma mark Image names
#define ES_IMG_NAME_BACKGROUND_1 @"bg1"
#define ES_IMG_NAME_BACKGROUND_2 @"bg2"
#define ES_IMG_NAME_BACKGROUND_3 @"bg3"
#define ES_IMG_NAME_LOGO @"logo_EndScene"
#define ES_IMG_NAME_BUTTON_MENU_SIMPLE @"buttonMenu_Simple_EndScene"
#define ES_IMG_NAME_BUTTON_MENU_PRESSED @"buttonMenu_Pressed_EndScene"
#define ES_IMG_NAME_BUTTON_RESTART_SIMPLE @"buttonRestart_Simple_EndScene"
#define ES_IMG_NAME_BUTTON_RESTART_PRESSED @"buttonRestart_Pressed_EndScene"
#define ES_IMG_NAME_BUTTON_SHARE_SIMPLE @"buttonShare_Simple_EndScene"
#define ES_IMG_NAME_BUTTON_SHARE_PRESSED @"buttonShare_Pressed_EndScene"
#define ES_IMG_NAME_BUTTON_GAME_CENTER_SIMPLE @"buttonGameCenter_Simple_EndScene"
#define ES_IMG_NAME_BUTTON_GAME_CENTER_PRESSED @"buttonGameCenter_Pressed_EndScene"

#pragma mark Font Size
#define ES_FONT_SIZE_LABEL_SCORE_NOW 30
#define ES_FONT_SIZE_LABEL_SCORE_NOW_TEXT 15
#define ES_FONT_SIZE_LABEL_SCORE_BEST 30
#define ES_FONT_SIZE_LABEL_SCORE_BEST_TEXT 15

#pragma mark Text
#define ES_TEXT_LABEL_SCORE_NOW_TEXT @"NOW"
#define ES_TEXT_LABEL_SCORE_BEST_TEXT @"BEST"

#pragma mark Font Color
#define ES_FONT_COLOR_LABEL_SCORE_NOW @"#f3f3f3"
#define ES_FONT_COLOR_LABEL_SCORE_NOW_TEXT @"#f3f3f3"
#define ES_FONT_COLOR_LABEL_SCORE_BEST @"#f3f3f3"
#define ES_FONT_COLOR_LABEL_SCORE_BEST_TEXT @"#f3f3f3"

#pragma mark Sizes
#define ES_SIZE_BACKGROUND getCGSizeFromPersent(100, 100)
#define ES_SIZE_LOGO getCGSizeFromPersentScaled(56.2, 50.3)
#define ES_SIZE_BUTTON_MENU getCGSizeFromPersentScaled(11.2, 11.2)
#define ES_SIZE_BUTTON_RESTART getCGSizeFromPersentScaled(11.2, 11.2)
#define ES_SIZE_BUTTON_SHARE getCGSizeFromPersentScaled(11.2, 11.2)
#define ES_SIZE_BUTTON_GAME_CENTER getCGSizeFromPersentScaled(11.2, 11.2)

#pragma mark Positions
#define ES_POSITION_BACKGROUND getCGPointFromPersent(50, 50)
#define ES_POSITION_LOGO getCGPointFromPersent(50, 80)
#define ES_POSITION_BUTTON_MENU getCGPointFromPersent(35, 33)
#define ES_POSITION_BUTTON_RESTART getCGPointFromPersent(35, 20)
#define ES_POSITION_BUTTON_SHARE getCGPointFromPersent(65, 33)
#define ES_POSITION_BUTTON_GAME_CENTER getCGPointFromPersent(65, 20)

#define ES_POSITION_LABEL_SCORE_NOW getCGPointFromPersent(32, 50)
#define ES_POSITION_LABEL_SCORE_NOW_TEXT getCGPointFromPersent(32, 45)
#define ES_POSITION_LABEL_SCORE_BEST getCGPointFromPersent(68, 50)
#define ES_POSITION_LABEL_SCORE_BEST_TEXT getCGPointFromPersent(68, 45)

#pragma mark zPosition
#define ES_ZPOSITION_BACKGROUND 0
#define ES_ZPOSITION_LOGO 1
#define ES_ZPOSITION_BUTTON_MENU 2
#define ES_ZPOSITION_BUTTON_RESTART 3
#define ES_ZPOSITION_BUTTON_SHARE 4
#define ES_ZPOSITION_BUTTON_GAME_CENTER 5

#define ES_ZPOSITION_LABEL_SCORE_NOW 6
#define ES_ZPOSITION_LABEL_SCORE_NOW_TEXT 7
#define ES_ZPOSITION_LABEL_SCORE_BEST 8
#define ES_ZPOSITION_LABEL_SCORE_BEST_TEXT 9

#endif
