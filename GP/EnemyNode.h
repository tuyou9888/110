//
//  EnemyNode.h
//  GP
//
//  Created by Vladimir Vinnik on 17.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#import "SKSpriteNode+NodePlus.h"
#import "GameSceneSettings.h"

@interface EnemyNode : SKSpriteNode

- (id)initWithImageName:(NSString *)imageName size:(CGSize)size position:(CGPoint)position andZPosition:(int)zPosition;

@end
