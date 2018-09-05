//
//  YTReaderChapterModel.m
//  PageViewController
//
//  Created by 水晶岛 on 2018/9/1.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import "YTReaderChapterModel.h"

@interface YTReaderChapterModel ()

@property (nonatomic, strong) NSAttributedString *attString;
@property (nonatomic, strong) NSArray *pageRangeArray;
@property (nonatomic, assign) CGSize renderSize;

@end

@implementation YTReaderChapterModel

- (void)parseChapterWithRenderSize:(CGSize)renderSize {
    _renderSize = renderSize;
    [self parseChapter];
}
- (void)parseChapter {
    
}

@end
