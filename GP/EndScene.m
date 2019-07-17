//
//  EndScene.m
//  GP
//
//  Created by Vladimir Vinnik on 14.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import "EndScene.h"

@implementation EndScene

- (void)didMoveToView:(SKView *)view {
    //iAd
//    if (ES_SHOW_IAD) [[NSNotificationCenter defaultCenter] postNotificationName:@"showAd" object:nil];
//    else [[NSNotificationCenter defaultCenter] postNotificationName:@"hideAd" object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showInter" object:nil];

    //Setting
    [self initSound];
    [self getRandomColorTheme];
    
    NSString *currentBGImage;
    if (currentColorTheme == 0) currentBGImage = ES_IMG_NAME_BACKGROUND_1;
    else if (currentColorTheme == 1) currentBGImage = ES_IMG_NAME_BACKGROUND_2;
    else currentBGImage = ES_IMG_NAME_BACKGROUND_3;
    
    //Find best score
    setNewBestScore = false;
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"nowScore"] > [[NSUserDefaults standardUserDefaults] integerForKey:@"bestScore"]) { [[NSUserDefaults standardUserDefaults] setInteger:[[NSUserDefaults standardUserDefaults] integerForKey:@"nowScore"] forKey:@"bestScore"];
        setNewBestScore = true;
    }
    
    //Add nodes
    _background = [[SimpleNode alloc] initWithImageName:currentBGImage size:ES_SIZE_BACKGROUND position:ES_POSITION_BACKGROUND andZPosition:ES_ZPOSITION_BACKGROUND];
    _logo = [[SimpleNode alloc] initWithImageName:ES_IMG_NAME_LOGO size:ES_SIZE_LOGO position:ES_POSITION_LOGO andZPosition:ES_ZPOSITION_LOGO];
    _buttonMenu = [[ButtonNode alloc] initWithSimpleImageName:ES_IMG_NAME_BUTTON_MENU_SIMPLE andPressedImage:ES_IMG_NAME_BUTTON_MENU_PRESSED size:ES_SIZE_BUTTON_MENU position:ES_POSITION_BUTTON_MENU andZPosition:ES_ZPOSITION_BUTTON_MENU];
    _buttonRestart = [[ButtonNode alloc] initWithSimpleImageName:ES_IMG_NAME_BUTTON_RESTART_SIMPLE andPressedImage:ES_IMG_NAME_BUTTON_RESTART_PRESSED size:ES_SIZE_BUTTON_RESTART position:ES_POSITION_BUTTON_RESTART andZPosition:ES_ZPOSITION_BUTTON_RESTART];
    _buttonShare = [[ButtonNode alloc] initWithSimpleImageName:ES_IMG_NAME_BUTTON_SHARE_SIMPLE andPressedImage:ES_IMG_NAME_BUTTON_SHARE_PRESSED size:ES_SIZE_BUTTON_SHARE position:ES_POSITION_BUTTON_SHARE andZPosition:ES_ZPOSITION_BUTTON_SHARE];
    _buttonGameCenter = [[ButtonNode alloc] initWithSimpleImageName:ES_IMG_NAME_BUTTON_GAME_CENTER_SIMPLE andPressedImage:ES_IMG_NAME_BUTTON_GAME_CENTER_PRESSED size:ES_SIZE_BUTTON_GAME_CENTER position:ES_POSITION_BUTTON_GAME_CENTER andZPosition:ES_ZPOSITION_BUTTON_GAME_CENTER];
    
    _labelScoreNow = [[SimpleLabel alloc] initWithText:[NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"nowScore"]] fontSize:ES_FONT_SIZE_LABEL_SCORE_NOW position:ES_POSITION_LABEL_SCORE_NOW colorByHEX:ES_FONT_COLOR_LABEL_SCORE_NOW andZPosition:ES_ZPOSITION_LABEL_SCORE_NOW];
    _labelScoreNowText = [[SimpleLabel alloc] initWithText:ES_TEXT_LABEL_SCORE_NOW_TEXT fontSize:ES_FONT_SIZE_LABEL_SCORE_NOW_TEXT position:ES_POSITION_LABEL_SCORE_NOW_TEXT colorByHEX:ES_FONT_COLOR_LABEL_SCORE_NOW_TEXT andZPosition:ES_ZPOSITION_LABEL_SCORE_NOW_TEXT];
    _labelScoreBest = [[SimpleLabel alloc] initWithText:[NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"bestScore"]] fontSize:ES_FONT_SIZE_LABEL_SCORE_BEST position:ES_POSITION_LABEL_SCORE_BEST colorByHEX:ES_FONT_COLOR_LABEL_SCORE_BEST andZPosition:ES_ZPOSITION_LABEL_SCORE_BEST];
    _labelScoreBestText = [[SimpleLabel alloc] initWithText:ES_TEXT_LABEL_SCORE_BEST_TEXT fontSize:ES_FONT_SIZE_LABEL_SCORE_BEST_TEXT position:ES_POSITION_LABEL_SCORE_BEST_TEXT colorByHEX:ES_FONT_COLOR_LABEL_SCORE_BEST_TEXT andZPosition:ES_ZPOSITION_LABEL_SCORE_BEST_TEXT];
    
    [self addChild:_background];
    [self addChild:_logo];
    [self addChild:_buttonMenu];
    [self addChild:_buttonRestart];
    [self addChild:_buttonShare];
    [self addChild:_buttonGameCenter];
    
    [self addChild:_labelScoreBest];
    [self addChild:_labelScoreBestText];
    [self addChild:_labelScoreNow];
    [self addChild:_labelScoreNowText];
}

#pragma mark --- Actions ---

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if ([_buttonMenu containsPoint:location]) [_buttonMenu changeButtonStatePressed];
        if ([_buttonRestart containsPoint:location]) [_buttonRestart changeButtonStatePressed];
        if ([_buttonShare containsPoint:location]) [_buttonShare changeButtonStatePressed];
        if ([_buttonGameCenter containsPoint:location]) [_buttonGameCenter changeButtonStatePressed];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [_buttonMenu changeButtonStateSimple];
    [_buttonRestart changeButtonStateSimple];
    [_buttonShare changeButtonStateSimple];
    [_buttonGameCenter changeButtonStateSimple];
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if ([_buttonMenu containsPoint:location]) {
            [self changeSceneToSceneName:@"MenuScene" andAnimationName:@"Nil"];
            [sound playSoundByName:@"buttonClick"];
        }
        if ([_buttonRestart containsPoint:location]) {
            [self changeSceneToSceneName:@"GameScene" andAnimationName:@"Nil"];
            [sound playSoundByName:@"buttonClick"];
        }
        if ([_buttonShare containsPoint:location]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"shareToSocial" object:nil];
            [sound playSoundByName:@"buttonClick"];
        }
        if ([_buttonGameCenter containsPoint:location]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"showLeaderboard" object:nil];
            [sound playSoundByName:@"buttonClick"];
        }
    }
}

@end
