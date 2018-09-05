//
//  NSAttributedString+YTReaderPage.h
//  PageViewController
//
//  Created by 水晶岛 on 2018/9/4.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface NSAttributedString (YTReaderPage)

- (NSArray *)pageRangeArrayWithConstrainedToSize:(CGSize)size;

@end
