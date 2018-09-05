//
//  YTReaderChapterModel.h
//  PageViewController
//
//  Created by 水晶岛 on 2018/9/1.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTReaderPager.h"

@interface YTReaderChapterModel : NSObject

// 章节内容
@property (nonatomic, strong)  NSString *chapterContent;
// 章节标题
@property (nonatomic, strong)  NSString *chapterTitle;
// 每页范围
@property (nonatomic, strong, readonly) NSArray *pageRangeArray;
// 总页数
@property (nonatomic, assign, readonly) NSInteger totalPage;

@end
