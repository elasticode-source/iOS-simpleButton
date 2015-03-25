//
//  ViewController.m
//  simpleButton
//
//  Created by Tomer on 22/1/15.
//  Copyright (c) 2015 elasticode. All rights reserved.
//

#import "ViewController.h"
#import <ElastiCode/ElastiCode.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(finishSyncNotification:)
                                                 name:@"finishedSync"
                                               object:nil];
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) finishSyncNotification:(NSNotification *) notification
{
    NSString* buttonText = (NSString*)[ElastiCode valueForDynamicObject:@"Button text"];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame= CGRectMake(125, 200, 125, 50);
    [btn setTitle:buttonText forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
    switch ([ElastiCode stateIndexForCase:@"First Button"]){
        case 1:
            btn.backgroundColor = [UIColor cyanColor];
            break;
        case 2:
            btn.backgroundColor = [UIColor magentaColor];
            break;
        case 0:
        default:
            btn.backgroundColor = [UIColor yellowColor];
            break;
    }
    
    [ElastiCode takeSnapShot:@"First Button"];
    [ElastiCode takeSnapShot:@"Button text"];
}

-(void) buttonClicked
{
    [ElastiCode goalReached:@"First Button"];
    [ElastiCode dynamicObjectGoalReached:@"Button text"];
}
@end
