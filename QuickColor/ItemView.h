//
//  ItemView.h
//  QuickColor
//
//  Created by Thanh Nguyen on 3/22/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemView : UIButton

@property (nonatomic, assign) bool isTrue;

- (void) setColor: (UIColor*) color;

@end
