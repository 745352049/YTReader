//
//  YTReaderChapterModel.h
//  PageViewController
//
//  Created by 水晶岛 on 2018/9/1.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "YTReaderPagerModel.h"

@interface YTReaderChapterModel : NSObject

// 章节内容
@property (nonatomic, strong)  NSString *chapterContent;
// 章节下标
@property (nonatomic, assign)  NSInteger chapterIndex;
// 章节标题
@property (nonatomic, strong)  NSString *chapterTitle;
// 每页范围
@property (nonatomic, strong, readonly) NSArray *pageRangeArray;
// 总页数
@property (nonatomic, assign, readonly) NSInteger totalPage;

// 解析章节文本
- (void)parseChapter;
// 解析章节内容
- (void)parseChapterWithRenderSize:(CGSize)renderSize;
// 获取章节页
- (YTReaderPagerModel *)chapterPagerWithIndex:(NSInteger)pageIndex;
// 根据offset获取页下标
- (NSInteger)pageIndexWithChapterOffset:(NSInteger)offset;

@end
