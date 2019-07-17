//
//  CoinNode.m
//  GP
//
//  Created by Vladimir Vinnik on 22.10.15.
//  Copyright © 2015 Vladimir Vinnik. All rights reserved.
//

#import "CoinNode.h"

@implementation CoinNode

- (id)initWithImageName:(NSString *)imageName size:(CGSize)size position:(CGPoint)position andZPosition:(int)zPosition {
    if (self = [super init]) {
        if (FILTERED_IMAGE_IN_ALL_PROGECT) self = [CoinNode spriteNodeWithTexture:[self getUnfilteredTextureFromName:imageName]];
        else self = [CoinNode spriteNodeWithImageNamed:imageName];
        self.size = size;
        self.position = position;
        self.zPosition = zPosition;
        
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
        self.physicsBody.affectedByGravity = false;
        self.physicsBody.categoryBitMask = coinCategory;
        self.physicsBody.collisionBitMask = playerCategory;
        self.physicsBody.contactTestBitMask = playerCategory;
        
        //Move down
        [self runAction:[SKAction sequence:@[[SKAction moveToY:0 duration:SPEED_OF_GAME], [SKAction removeFromParent]]]];
        
        //Change scale
        [self runAction:[SKAction repeatActionForever:[SKAction sequence:@[[SKAction scaleTo:COIM_SCALE_BIG duration:SPEED_OF_CHANGE_COIN], [SKAction scaleTo:COIN_SCALE_NORMAL duration:SPEED_OF_CHANGE_COIN]]]]];
    }
    return self;
}

@end
