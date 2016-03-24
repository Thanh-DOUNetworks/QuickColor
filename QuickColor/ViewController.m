//
//  ViewController.m
//  QuickColor
//
//  Created by Thanh Nguyen on 3/22/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

#import "ViewController.h"
#import "Constant.h"
#import "GamePlayViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#define BUTTON_SIZE 64

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    loginButton.center = self.view.center;
//    [self.view addSubview:loginButton];
        
    UIButton* bt_learn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - BUTTON_SIZE - 10, SCREEN_HEIGH/2 - BUTTON_SIZE/2, BUTTON_SIZE, BUTTON_SIZE)];
    [bt_learn setBackgroundImage:[UIImage imageNamed:@"icon_learn"] forState:UIControlStateNormal];
    [bt_learn addTarget:self action:@selector(gotoLearnPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt_learn];
    
    UIButton* bt_play = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 + 10, SCREEN_HEIGH/2 - BUTTON_SIZE/2, BUTTON_SIZE, BUTTON_SIZE)];
    [bt_play setBackgroundImage:[UIImage imageNamed:@"icon_play"] forState:UIControlStateNormal];
    [bt_play addTarget:self action:@selector(gotoGamePage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt_play];
}

- (void) gotoLearnPage {
    
}

- (void) gotoGamePage {
    GamePlayViewController* controller = [[GamePlayViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:controller animated:YES completion:nil];
//    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImage *)capture{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil); //if you need to save
    return image;
}

@end
