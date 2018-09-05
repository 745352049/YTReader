//
//  YTReaderPager.h
//  PageViewController
//
//  Created by 水晶岛 on 2018/9/1.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTReaderPager : NSObject

// 本页属性文本
@property (nonatomic, strong) NSAttributedString *attString;
// 本页范围
@property (nonatomic, assign) NSRange pageRange;
// 本页下标
@property (nonatomic, assign) NSInteger pageIndex;

@end
