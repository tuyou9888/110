//
//  GameScene.h
//  GP
//
//  Created by Vladimir Vinnik on 14.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import "GlobalScene.h"

#import "GameSceneSettings.h"
#import "GameProgressSettings.h"

#import "PlayerNode.h"
#import "EnemyNode.h"
#import "CoinNode.h"

@interface GameScene : GlobalScene <SKPhysicsContactDelegate> {
    int score;
    BOOL gameIsPlay;
    
    NSTimer *timeToGenerateEnemy;
    NSTimer *timeToChangeScene;
}

@property SimpleNode *background;

@property SimpleLabel *labelScore;

@property PlayerNode *player;
@property EnemyNode *enemy;
@property CoinNode *coin;

@property SimpleNode *playerTint;

@end
