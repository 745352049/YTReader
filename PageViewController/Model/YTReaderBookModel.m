//
//  YTReaderBookModel.m
//  PageViewController
//
//  Created by 水晶岛 on 2018/9/1.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import "YTReaderBookModel.h"

@implementation YTReaderBookModel

// 是否有下章节
- (BOOL)haveNextChapter {
    return _totalChapter > _curChpaterIndex;
}
// 是否有上章节
- (BOOL)havePreChapter {
    return _curChpaterIndex > 1;
}
// 重置章节
- (void)resetChapter:(YTReaderChapterModel *)chapter {
    _curChpaterIndex = chapter.chapterIndex;
}
- (YTReaderChapterModel *)openBookWithChapter:(NSInteger)chapter {
    YTReaderChapterModel *readerChapter = [[YTReaderChapterModel alloc] init];
    readerChapter.chapterIndex = chapter;
    _curChpaterIndex = chapter;
    NSError *error = nil;
    NSString *chapter_num = [NSString stringWithFormat:@"Chapter%d",(int)chapter];
    NSString *path1 = [[NSBundle mainBundle] pathForResource:chapter_num ofType:@"txt"];
    readerChapter.chapterContent = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"open book chapter error:%@",error);
        return nil;
    }
    return readerChapter;
}
- (YTReaderChapterModel *)openBookNextChapter {
    return [self openBookWithChapter:_curChpaterIndex+1];
}

- (YTReaderChapterModel *)openBookPreChapter {
    return [self openBookWithChapter:_curChpaterIndex-1];
}

@end
