//
//  GameSceneSettings.h
//  GP
//
//  Created by Vladimir Vinnik on 14.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#ifndef GP_GameSceneSettings_h
#define GP_GameSceneSettings_h

#import "GlobalSettings.h"

#pragma mark Times
#define GS_TIME_TO_CHANGE_SCENE 1

#pragma mark Image names
#define GS_IMG_NAME_BACKGROUND_1 @"bg1"
#define GS_IMG_NAME_BACKGROUND_2 @"bg2"
#define GS_IMG_NAME_BACKGROUND_3 @"bg3"
#define GS_IMG_NAME_PLAYER @"player"
#define GS_IMG_NAME_ENEMY_1 @"enemy1"
#define GS_IMG_NAME_ENEMY_2 @"enemy2"
#define GS_IMG_NAME_ENEMY_3 @"enemy3"
#define GS_IMG_NAME_COIN @"coin"

#define GS_FONT_COLOR_LABEL_SCORE @"#f3f3f3"

#pragma mark Font Size
#define GS_FONT_SIZE_LABEL_SCORE 65

#pragma mark Sizes
#define GS_SIZE_BACKGROUND getCGSizeFromPersent(100, 100)
#define GS_SIZE_PLAYER getCGSizeFromPersentScaled(9, 9)
#define GS_SIZE_COIN getCGSizeFromPersentScaled(8.4, 8.4)
#define GS_SIZE_ENEMY getCGSizeFromPersentScaled(24, 6.5)

#pragma mark Positions
#define GS_POSITION_BACKGROUND getCGPointFromPersent(50, 50)

#define GS_POSITION_LABEL_SCORE getCGPointFromPersent(50, 80)

#define GS_POSITION_PLAYER getCGPointFromPersent(50, 18)
#define GS_POSITION_ENEMYS getCGPointFromPersent(50, 110)

#define GS_POSITION_LINE_1 30
#define GS_POSITION_LINE_2 50
#define GS_POSITION_LINE_3 70

#pragma mark zPosition
#define GS_ZPOSITION_BACKGROUND 0

#define GS_ZPOSITION_LABEL_SCORE 1

#define GS_ZPOSITION_PLAYER 2
#define GS_ZPOSITION_COIN 3
#define GS_ZPOSITION_ENEMY 3

#endif
