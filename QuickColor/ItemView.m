//
//  ItemView.m
//  QuickColor
//
//  Created by Thanh Nguyen on 3/22/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

#import "ItemView.h"

@implementation ItemView
@synthesize isTrue;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) setColor: (UIColor*) color {
    [self setBackgroundColor:color];
    self.adjustsImageWhenHighlighted = NO;
}

@end
