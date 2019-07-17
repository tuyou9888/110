//
//  AppDelegate.h
//  GP
//
//  Created by Vladimir Vinnik on 14.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *appKey = @"1f7bc42a9fcb3f2364e2ef58";
static NSString *channel = @"FastAirPlane";
static BOOL isProduction = true;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController* navigationController;

@end

