//
//  YYViewController.m
//  YYKeychainTool
//
//  Created by yesdgq@yahoo.com on 07/24/2020.
//  Copyright (c) 2020 yesdgq@yahoo.com. All rights reserved.
//

#import "YYViewController.h"
#import <YYKeychainTool/YYUUIDTool.h>

@interface YYViewController ()

@end

@implementation YYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *uuid = [YYUUIDTool getUUID];
    NSLog(@"uuid: %@", uuid);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
