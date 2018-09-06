//
//  YTListView.h
//  PageViewController
//
//  Created by 水晶岛 on 2018/9/5.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YTListView;

@protocol YTListViewDelegate <NSObject>

- (void)ytListView:(YTListView *)listView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface YTListView : UIView

@property (nonatomic, strong) NSMutableArray *tableArray;
@property (nonatomic, weak) id<YTListViewDelegate> delegate;

@end
