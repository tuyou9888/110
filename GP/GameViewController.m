//
//  GameViewController.m
//  GP
//
//  Created by Vladimir Vinnik on 14.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import "GameViewController.h"
#import "MenuScene.h"

@interface GameViewController ()
{
    IBOutlet SKView* _mySkView;
}
@end

@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect sizeRect = [UIScreen mainScreen].applicationFrame;
    float width = sizeRect.size.width;
    
//    //tạo PlacementID
//    FBAdView *adViewFB = [[FBAdView alloc] initWithPlacementID:@"209624659567874_209624839567856"
//                                                        adSize:kFBAdSizeHeight50Banner
//                                            rootViewController:self];
//
//    //vị trí của banner ở trên (TOP)
//    //adViewFB.frame = CGRectMake(0, 0, width, 50);
//
//    //vị trí banner ở dưới (BOTTOM)
//    adViewFB.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - adViewFB.frame.size.height, width, 50);
//
//    //Show banner
//    [adViewFB loadAd];
//    [self.view addSubview:adViewFB];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadInterstital) name:@"showInter" object:nil];

    
    //Leaderbord id
    _leaderboardIdentifier = LEADERBOARD_ID;
    
    //Check first launch
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"]) {
        // app already launched
    }
    else {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        // This is the first launch ever
        
    }

    // Configure the view.
    SKView * skView = _mySkView;//(SKView *)self.view;
    skView.showsFPS = NO;
    skView.showsNodeCount = NO;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    MenuScene *scene = [MenuScene unarchiveFromFile:@"MenuScene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.size = skView.frame.size;
    
    //iAd View settings
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView.frame = CGRectOffset(adView.frame, 0, 0.0f);
    
    //Set iAd to buttom
    CGRect adFrame = adView.frame;
    adFrame.origin.y = self.view.frame.size.height-adView.frame.size.height;
    adView.frame = adFrame;
    
    adView.delegate=self;
    [adView setAlpha:0];
    [self.view addSubview:adView];
    
    //Save size of scene
    [[NSUserDefaults standardUserDefaults] setFloat:skView.frame.size.width forKey:@"sceneSizeWidth"];
    [[NSUserDefaults standardUserDefaults] setFloat:skView.frame.size.height forKey:@"sceneSizeHeight"];
    
    //iAd
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"hideAd" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"showAd" object:nil];
    //Share
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shareToSocial) name:@"shareToSocial" object:nil];
    //Rate app
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rateAppCall) name:@"rateUs" object:nil];
   
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    NSString* url = [userDefaults objectForKey:@"url"];
    
    if(url.length <= 0){
        //Game Center
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showLeaderboard) name:@"showLeaderboard" object:nil];
        
        [self authenticateLocalPlayer];
    }
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark iAd banner methods

//Handle Notification
- (void)handleNotification:(NSNotification *)notification
{
    if ([notification.name isEqualToString:@"hideAd"]) [adView setAlpha:0];
    else if ([notification.name isEqualToString:@"showAd"]) [adView setAlpha:1];
}

#pragma mark Share

- (void)shareToSocial {
    NSString *textToShare = [NSString stringWithFormat:@"See, I scored %ld in this game!", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"nowScore"]];
    NSData* imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"nowScreenShot"];
    UIImage* image = [UIImage imageWithData:imageData];
    NSArray *objectToShare = @[textToShare, image];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:objectToShare applicationActivities:nil];
    activityViewController.excludedActivityTypes = @[];
    
    //if iPhone
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self presentViewController:activityViewController animated:YES completion:nil];
    }
    //if iPad
    else {
        UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
        [popup presentPopoverFromRect:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/4, 0, 0)inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

#pragma mark Rate Us

- (void)rateAppCall {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Like this app?" message:@"Rate this app!" delegate:self cancelButtonTitle:@"No, thanks" otherButtonTitles:@"Yes", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) { /*Cancel button*/ }
    else if (buttonIndex == 1) { /*Yes button*/ [[UIApplication sharedApplication] openURL:[NSURL URLWithString:LINK_TO_RATE_US]]; }
}

#pragma mark Game Center

- (void)authenticateLocalPlayer {
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error) {
        if (viewController != nil) [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:viewController animated:YES completion:nil];
        else {
            if ([GKLocalPlayer localPlayer].authenticated) {
                gameCenterEnabled = YES;
    
                [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
                    if (error != nil) NSLog(@"%@", [error localizedDescription]);
                    else _leaderboardIdentifier = leaderboardIdentifier;
                }];
            }
            else gameCenterEnabled = NO;
        }
    };
}

- (void)showLeaderboard {
    GKGameCenterViewController *gcViewController = [[GKGameCenterViewController alloc] init];
    gcViewController.gameCenterDelegate = self;
    gcViewController.viewState = GKGameCenterViewControllerStateLeaderboards;
    gcViewController.leaderboardIdentifier = _leaderboardIdentifier;
    [self presentViewController:gcViewController animated:YES completion:nil];
}

- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController {
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) loadInterstital
{
    NSLog(@"LoadAD");
    interstitialAd = [[FBInterstitialAd alloc] initWithPlacementID:@"209624659567874_209624912901182"];
    interstitialAd.delegate = self;
    [interstitialAd loadAd];
}

- (void)interstitialAdDidLoad:(FBInterstitialAd *)interstitialAd
{
    NSLog(@"Ad is loaded and ready to be displayed");
    
    // You can now display the full screen ad using this code:
    //[interstitialAd showAdFromRootViewController:self];
    [interstitialAd showAdFromRootViewController:self];
}

@end
