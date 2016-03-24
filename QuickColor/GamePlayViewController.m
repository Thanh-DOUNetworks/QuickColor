//
//  GamePlayViewController.m
//  QuickColor
//
//  Created by Thanh Nguyen on 3/22/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

#import "GamePlayViewController.h"
#import "Utils.h"
#import "ItemView.h"
#import "Constant.h"

@interface GamePlayViewController ()

@end

@implementation GamePlayViewController
@synthesize level;
@synthesize slider;
@synthesize timer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background2.jpg"]];
    level = 0;
    [self initSlider];
    [self updateLayout];
}

- (void) initSlider {
    slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 20, (SCREEN_WIDTH - 100), 30)];
    slider.minimumValue = 0.0;
    slider.maximumValue = 100.0;
    slider.value = slider.maximumValue;
    
    timer=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(decrementValue) userInfo:nil repeats:YES];
    [self.view addSubview:slider];
}

-(void)decrementValue
{
    slider.value -= 1;
    if (slider.value < 1) {
        //game over
        [self gameOver];
        [timer invalidate];
        self.timer = nil;
    }
}

- (void) gameOver {
    //goto game over view
    printf("goto game over");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) removeAllItem {
    for (UIView *subView in self.view.subviews)
    {
        if ([subView isKindOfClass:[ItemView class]])
        {
            [subView removeFromSuperview];
        }
    }
}

- (void) updateLayout {
    if (level < 13) {
        //xoa nhung item cu
        [self removeAllItem];
        //khoi tao lai tu dau
        int column = [Utils getSizeOfLevel:level];
        int row = column;
        if (row > 15) {
            row = 15;
        }
        int randomIndex = [self randomNumberBetween:0 maxNumber:(column-1)*(row-1) - 1];
        NSArray* arrayColor = [self randomColor:[Utils getAlphaOfLevel:level]];
        UIColor* firstColor = [arrayColor objectAtIndex:0];
        UIColor* secondColor = [arrayColor objectAtIndex:1];
        float itemHeight = [Utils getItemSizeOfLevel:level withWidth:SCREEN_WIDTH withHeight:SCREEN_HEIGH];
        float beginX = SCREEN_WIDTH - column * itemHeight - (column - 2)*MARGIN_ITEM;
        float beginY = SCREEN_HEIGH - row * itemHeight - MARGIN_ITEM*(row - 2) + BEGIN_TOP;
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < column; j++) {
                //khoi tao item
                ItemView* item = [[ItemView alloc] initWithFrame:CGRectMake(beginX/2 + j*(itemHeight + MARGIN_ITEM), beginY/2 + i*(itemHeight + MARGIN_ITEM), itemHeight, itemHeight)];
                int index = j + i*column;
                item.tag = index;
                if (index == randomIndex) {
                    [item setColor:secondColor];
                    item.isTrue = true;
                } else {
                    [item setColor:firstColor];
                    item.isTrue = false;
                }
                [item addTarget:self action:@selector(clickOnItem:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:item];
            }
        }
        
        
    } else {
        //chi cap nhat mau va gan lai thoi gian cho nhanh hon
        int column = [Utils getSizeOfLevel:level];
        int row = column;
        if (row > 15) {
            row = 15;
        }
        int randomIndex = [self randomNumberBetween:0 maxNumber:(column-1)*(row-1) - 1];
        NSArray* arrayColor = [self randomColor:[Utils getAlphaOfLevel:level]];
        UIColor* firstColor = [arrayColor objectAtIndex:0];
        UIColor* secondColor = [arrayColor objectAtIndex:1];
        for (UIView *subView in self.view.subviews)
        {
            if ([subView isKindOfClass:[ItemView class]])
            {
                ItemView* item = (ItemView*) subView;
                if (item.tag == randomIndex) {
                    [item setColor:secondColor];
                    item.layer.borderColor = [UIColor redColor].CGColor;
                    item.layer.borderWidth = 2;
                    item.isTrue = true;
                } else {
                    [item setColor:firstColor];
                    item.layer.borderWidth = 0;
                    item.isTrue = false;
                }
            }
        }
    }
}

- (void) clickOnItem: (ItemView*) sender {
    if (sender.isTrue == true) {
        //goto next level
        level++;
        [self updateLayout];
        slider.value = slider.maximumValue;
    }
}

- (int)randomNumberBetween:(int)min maxNumber:(int)max
{
    return min + arc4random_uniform(max - min + 1);
}

- (NSArray*) randomColor: (float) alpha{
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    if (r == g && g == b) {
        r = 100;
        g = 200;
        b = 145;
    }
    UIColor* firstColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
    UIColor* secondeColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
    return [NSArray arrayWithObjects:firstColor, secondeColor, nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
