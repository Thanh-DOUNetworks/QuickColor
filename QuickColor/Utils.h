//
//  Utils.h
//  QuickColor
//
//  Created by Thanh Nguyen on 3/22/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (int) getSizeOfLevel: (int) level;

+ (float) getItemSizeOfLevel: (int) level withWidth: (float) width withHeight: (float) height;

+ (int) getBeginWidthOfLevel: (int) level;

+ (int) getBeginHeightOfLevel: (int) level;

+ (float) getAlphaOfLevel: (int) level;

@end
