//
//  PlayerNode.m
//  GP
//
//  Created by Vladimir Vinnik on 17.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import "PlayerNode.h"

@implementation PlayerNode

- (id)initWithImageName:(NSString *)imageName size:(CGSize)size position:(CGPoint)position andZPosition:(int)zPosition {
    if (self = [super init]) {
        if (FILTERED_IMAGE_IN_ALL_PROGECT) self = [PlayerNode spriteNodeWithTexture:[self getUnfilteredTextureFromName:imageName]];
        else self = [PlayerNode spriteNodeWithImageNamed:imageName];
        self.size = size;
        self.position = position;
        self.zPosition = zPosition;
        
        self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.size.width / 2];
        self.physicsBody.affectedByGravity = false;
        self.physicsBody.mass = 9999;
        self.physicsBody.categoryBitMask = playerCategory;
        self.physicsBody.collisionBitMask = enemyCategory | coinCategory;
        self.physicsBody.contactTestBitMask = enemyCategory | coinCategory;
    }
    return self;
}

- (void)setToPosition:(int)position {
    if (position == 1) self.position = CGPointMake(SIZE_WIDTH / 100 * GS_POSITION_LINE_1, self.position.y);
    else if (position == 2) self.position = CGPointMake(SIZE_WIDTH / 100 * GS_POSITION_LINE_2, self.position.y);
    else self.position = CGPointMake(SIZE_WIDTH / 100 * GS_POSITION_LINE_3, self.position.y);
}

@end
