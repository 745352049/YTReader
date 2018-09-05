//
//  YTReaderBookModel.h
//  PageViewController
//
//  Created by 水晶岛 on 2018/9/1.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTReaderChapterModel.h"

@interface YTReaderBookModel : NSObject

// 书本id
@property (nonatomic, assign) NSInteger bookId;
// 书本名
@property (nonatomic, strong) NSString *bookName;
// 书本章节
@property (nonatomic, assign) NSInteger totalChapter;
// 当前章节
@property (nonatomic, assign) NSInteger curChpaterIndex;

// 是否有下章节
- (BOOL)haveNextChapter;
// 是否有上章节
- (BOOL)havePreChapter;
// 重置章节
- (void)resetChapter:(YTReaderChapterModel *)chapter;
// 获取书籍的章节
- (YTReaderChapterModel *)openBookWithChapter:(NSInteger)chapter;

- (YTReaderChapterModel *)openBookNextChapter;

- (YTReaderChapterModel *)openBookPreChapter;

@end
