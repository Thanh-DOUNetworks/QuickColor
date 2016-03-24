//
//  Utils.m
//  QuickColor
//
//  Created by Thanh Nguyen on 3/22/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

#import "Utils.h"
#import "Constant.h"

@implementation Utils

+ (int) getSizeOfLevel: (int) level {
    int result = 4;
    switch (level) {
        case 0:
            result = 4;
            break;
        case 1:
            result = 5;
            break;
        case 2:
            result = 6;
            break;
        case 3:
            result = 7;
            break;
        case 4:
            result = 8;
            break;
        case 5:
            result = 9;
            break;
        case 6:
            result = 10;
            break;
        case 7:
            result = 11;
            break;
        case 8:
            result = 12;
            break;
        case 9:
            result = 13;
            break;
        case 10:
            result = 14;
            break;
        case 11:
            result = 15;
            break;
        case 12:
            result = 16;
            break;
        default:
            result = 17;
            break;
    }
    
    return result;
}

+ (float) getItemSizeOfLevel: (int) level withWidth: (float) width withHeight: (float) height {
    int minLevel = [Utils getSizeOfLevel:level];
    if (minLevel > 14) {
        minLevel = 14;
    }
    float min = (float)(height - MARGIN_ITEM*3 - BEGIN_TOP*3)/minLevel;
    float max = (float)(width - MARGIN_ITEM*3 - BEGIN_TOP*3)/[Utils getSizeOfLevel:level];
    float result = MIN(min, max);
    return result;
}

+ (int) getBeginWidthOfLevel: (int) level {
    int result = 4;
    switch (level) {
        case 0:
            result = 4;
            break;
        case 1:
            result = 5;
            break;
        case 2:
            result = 6;
            break;
        case 3:
            result = 7;
            break;
        case 4:
            result = 8;
            break;
        case 5:
            result = 9;
            break;
        case 6:
            result = 10;
            break;
        case 7:
            result = 11;
            break;
        case 8:
            result = 12;
            break;
        case 9:
            result = 13;
            break;
        default:
            result = 14;
            break;
    }
    
    return result;
}

+ (int) getBeginHeightOfLevel: (int) level {
    int result = 4;
    switch (level) {
        case 0:
            result = 4;
            break;
        case 1:
            result = 5;
            break;
        case 2:
            result = 6;
            break;
        case 3:
            result = 7;
            break;
        case 4:
            result = 8;
            break;
        case 5:
            result = 9;
            break;
        case 6:
            result = 10;
            break;
        case 7:
            result = 11;
            break;
        case 8:
            result = 12;
            break;
        case 9:
            result = 13;
            break;
        default:
            result = 14;
            break;
    }
    
    return result;
}

+ (float) getAlphaOfLevel: (int) level {
    float result = 0.8;
    if (level < 10) {
        result = 0.7;
    } else if (level < 20) {
        result = 0.8;
    } else if (level < 30) {
        result = 0.9;
    } else if (level < 40) {
        result = 0.92;
    } else if (level < 50) {
        result = 0.95;
    } else {
        result = 0.97;
    }
    return result;
}

@end
