//
//  SKSpriteNode+NodePlus.m
//  GP
//
//  Created by Vladimir Vinnik on 14.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import "SKSpriteNode+NodePlus.h"

@implementation SKSpriteNode (NodePlus)

- (UIColor *)getColorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (SKTexture *)getUnfilteredTextureFromName:(NSString *)nameOfTexture {
    SKTexture *texture = [SKTexture textureWithImageNamed:nameOfTexture];
    texture.filteringMode = SKTextureFilteringNearest;
    return texture;
}

@end
