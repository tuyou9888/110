//
//  ButtonNode.m
//  GP
//
//  Created by Vladimir Vinnik on 14.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import "ButtonNode.h"

@implementation ButtonNode

- (id)initWithSimpleImageName:(NSString *)simpleImageName andPressedImage:(NSString *)pressedImageName size:(CGSize)size position:(CGPoint)position andZPosition:(int)zPosition {
    if (self = [super init]) {
        if (FILTERED_IMAGE_IN_ALL_PROGECT) self = [ButtonNode spriteNodeWithTexture:[self getUnfilteredTextureFromName:simpleImageName]];
        else self = [ButtonNode spriteNodeWithImageNamed:simpleImageName];
        self.size = size;
        self.position = position;
        self.zPosition = zPosition;
        
        imageNameSimple = simpleImageName;
        imageNamePressed = pressedImageName;
    }
    return self;
}

- (void)changeButtonStateSimple {
    if (FILTERED_IMAGE_IN_ALL_PROGECT) self.texture = [SKTexture textureWithImageNamed:imageNameSimple];
    else self.texture = [self getUnfilteredTextureFromName:imageNameSimple];
}

- (void)changeButtonStatePressed {
    if (FILTERED_IMAGE_IN_ALL_PROGECT) self.texture = [SKTexture textureWithImageNamed:imageNamePressed];
    else self.texture = [self getUnfilteredTextureFromName:imageNamePressed];
}

@end
