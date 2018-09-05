//
//  YTReaderBookModel.h
//  PageViewController
//
//  Created by 水晶岛 on 2018/9/1.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTReaderBookModel : NSObject

// 章节内容
@property (nonatomic, strong) NSString *chapterContent;
// 获取书籍的章节
- (YTReaderBookModel *)openBookWithChapter:(NSInteger)chapter;

@end
