//
//  Animation.h
//  GP
//
//  Created by Vladimir Vinnik on 16.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#import "GlobalSettings.h"

@interface Animation : SKScene {
    SKAction *compliteAnimation;
}

#pragma mark Animation by texture
- (SKAction *)animationWithTexturesByName:(NSString *)animationName durationPerFrame:(NSTimeInterval)duration repeatActionForever:(BOOL)repeat removeObjectAfterAnimation:(BOOL)remove;

#pragma mark Simple
- (SKAction *)animationWithName:(NSString *)name durationOfAnimation:(NSTimeInterval)duration removeObjectAfterAnimation:(BOOL)remove;

#pragma mark Move
- (SKAction *)moveToPoint:(CGPoint)point durationOfAnimation:(NSTimeInterval)duration removeObjectAfterAnimation:(BOOL)remove;
- (SKAction *)moveByX:(CGFloat)moveBy durationOfAnimation:(NSTimeInterval)duration removeObjectAfterAnimation:(BOOL)remove;
- (SKAction *)moveByY:(CGFloat)moveBy durationOfAnimation:(NSTimeInterval)duration removeObjectAfterAnimation:(BOOL)remove;

#pragma mark Border
- (SKAction *)moveToMinXBorderForNodeSize:(CGSize)sizeNode withDuration:(NSTimeInterval)duration includeSize:(BOOL)include removeObjectAfterAnimation:(BOOL)remove;
- (SKAction *)moveToMaxXBorderForNodeSize:(CGSize)sizeNode withDuration:(NSTimeInterval)duration includeSize:(BOOL)include removeObjectAfterAnimation:(BOOL)remove;
- (SKAction *)moveToMinYBorderForNodeSize:(CGSize)sizeNode withDuration:(NSTimeInterval)duration includeSize:(BOOL)include removeObjectAfterAnimation:(BOOL)remove;
- (SKAction *)moveToMaxYBorderForNodeSize:(CGSize)sizeNode withDuration:(NSTimeInterval)duration includeSize:(BOOL)include removeObjectAfterAnimation:(BOOL)remove;

@end
