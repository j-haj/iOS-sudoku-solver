//
//  AppDelegate.m
//  SudokuSolver
//
//  Created by Jeff Hajewski on 11/21/14.
//  Copyright (c) 2014 Monarch Labs. All rights reserved.
//

#import "AppDelegate.h"
#import "MCLSudokuPuzzle.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSMutableArray *puzzle = [[NSMutableArray alloc] initWithArray:@[ @5,@8,@0,@0,@0,@7,@0,@0,@1,
                                                                      @0,@1,@0,@0,@2,@0,@4,@8,@0,
                                                                      @4,@7,@0,@0,@0,@0,@0,@9,@3,
                                                                      @3,@4,@0,@0,@5,@0,@0,@0,@0,
                                                                      @0,@5,@8,@6,@0,@9,@3,@1,@0,
                                                                      @0,@0,@0,@0,@7,@0,@0,@5,@4,
                                                                      @1,@6,@0,@0,@0,@0,@0,@3,@8,
                                                                      @0,@2,@7,@0,@8,@0,@0,@4,@0,
                                                                       @8,@0,@0,@5,@0,@0,@0,@7,@6]] ;
    
    NSArray *puzzleSolution = @[@5,@8,@9,@4,@3,@7,@6,@2,@1,
                           @6,@1,@3,@9,@2,@5,@4,@8,@7,
                           @4,@7,@2,@8,@6,@1,@5,@9,@3,
                           @3,@4,@1,@2,@5,@8,@7,@6,@9,
                           @7,@5,@8,@6,@4,@9,@3,@1,@2,
                           @2,@9,@6,@1,@7,@3,@8,@5,@4,
                           @1,@6,@5,@7,@9,@4,@2,@3,@8,
                           @9,@2,@7,@3,@8,@6,@1,@4,@5,
                           @8,@3,@4,@5,@1,@2,@9,@7,@6];
    
    MCLSudokuPuzzle *actualPuzzle = [[MCLSudokuPuzzle alloc] initWithPuzzle: puzzle];
    
    [actualPuzzle solvePuzzle];
    
    NSLog(@"Puzzle to solve is: %@\n",actualPuzzle);
    NSLog(@"Attempted solution is: %@\n", actualPuzzle);
    NSLog(@"Acutal solution is: %@\n", puzzleSolution);
    
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

@end
