//
//  AppDelegate.m
//  simpleButton
//
//  Created by Tomer on 22/1/15.
//  Copyright (c) 2015 elasticode. All rights reserved.
//

#import "AppDelegate.h"
#import <ElastiCode/ElastiCode.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // ------ Remove before production ----------------------
    [ElastiCode devModeWithLogging:elastiCodeLogLevelDetailed];
    // ------------------------------------------------------
    
    [ElastiCode startSession:@"pfxtbt5ixmkvpiue6akdp2ee"];
    // Register (listen) to local notification when session started
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(sessionStartedNotification)
                                                 name: ELASTICODE_SESSION_STARTED
                                               object: nil];
    // Register (listen) to local notification when session restarted
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(sessionRestartedNotification)
                                                 name: ELASTICODE_SESSION_RESTARTED
                                               object: nil];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void) sessionStartedNotification
{
    // Add code here for defining cases / dynamic objects
    // and continue with the app flow
    // Lets define a case with 3 options:
    [ElastiCode defineCase: @"First Button" withNumOfStates: 3];
    
    // And a dynamic object with string value and a default value of "Ok"
    [ElastiCode defineDynamicObject:@"Button text" type:(ElastiCodeDObjType_string) defaultValue:@"Ok"];
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"finishedSync"
     object:self];
    // now you can use this value
}

-(void) sessionRestartedNotification
{
    // ElastiCode was updated, may want to refresh the screen UI
}

@end
