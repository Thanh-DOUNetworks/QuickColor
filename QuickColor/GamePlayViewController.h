//
//  GamePlayViewController.h
//  QuickColor
//
//  Created by Thanh Nguyen on 3/22/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamePlayViewController : UIViewController

@property (nonatomic, assign) int level;
@property (nonatomic, strong) UISlider* slider;
@property (nonatomic, strong) NSTimer* timer;

@end
