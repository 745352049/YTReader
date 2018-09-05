//
//  NSAttributedString+YTReaderPage.m
//  PageViewController
//
//  Created by 水晶岛 on 2018/9/4.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import "NSAttributedString+YTReaderPage.h"

@implementation NSAttributedString (YTReaderPage)

//根据指定的大小,对字符串进行分页,计算出每页显示的字符串区间(NSRange)
- (NSArray *)pageRangeArrayWithConstrainedToSize:(CGSize)size {
    NSAttributedString *attributedString = self;
    NSMutableArray * resultRange = [NSMutableArray array];
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    NSInteger rangeIndex = 0;
    do {
        NSUInteger length = MIN(600, attributedString.length - rangeIndex);
        NSAttributedString * childString = [attributedString attributedSubstringFromRange:NSMakeRange(rangeIndex, length)];
        CTFramesetterRef childFramesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef) childString);
        UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRect:rect];
        CTFrameRef frame = CTFramesetterCreateFrame(childFramesetter, CFRangeMake(0, 0), bezierPath.CGPath, NULL);
        
        CFRange range = CTFrameGetVisibleStringRange(frame);
        NSRange r = {rangeIndex, range.length};
        if (r.length > 0) {
            [resultRange addObject:[NSValue valueWithRange:r]];
        }
        rangeIndex += r.length;
        CFRelease(frame);
        CFRelease(childFramesetter);
    } while (rangeIndex < attributedString.length && attributedString.length > 0);
    
    return resultRange;
}

@end
