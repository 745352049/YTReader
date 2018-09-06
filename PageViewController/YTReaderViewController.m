//
//  YTReaderViewController.m
//  PageViewController
//
//  Created by 水晶岛 on 2018/8/31.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import "YTReaderViewController.h"

#import "YTReaderContentViewController.h"
#import "NSAttributedString+YTReaderPage.h"
#import "YTListView.h"

@interface YTReaderViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource, YTListViewDelegate>

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) YTReaderContentViewController *contentVC;
@property (nonatomic, strong) NSMutableArray *pageContentArray;
@property (nonatomic, weak) YTListView *listView;

@end

@implementation YTReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:230.0/255.0 blue:174.0/255.0 alpha:1];
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)pageViewControllerWithTap:(UITapGestureRecognizer *)tap {
    if (!_listView) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int i = 0; i < 20; i++) {
            [array addObject: [NSString stringWithFormat:@"第%d章",i]];
        }
        YTListView *listView = [[YTListView alloc] initWithFrame:CGRectMake(-([UIScreen mainScreen].bounds.size.width-60), 0, [UIScreen mainScreen].bounds.size.width-60, [UIScreen mainScreen].bounds.size.height)];
        listView.tableArray = array;
        listView.delegate = self;
        _listView = listView;
        [self.view addSubview:listView];
        [UIView animateWithDuration:0.3 animations:^{
            _listView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-60, [UIScreen mainScreen].bounds.size.height);
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            _listView.frame = CGRectMake(-([UIScreen mainScreen].bounds.size.width-60), 0, [UIScreen mainScreen].bounds.size.width-60, [UIScreen mainScreen].bounds.size.height);
        } completion:^(BOOL finished) {
            [_listView removeFromSuperview];
        }];
    }
}
- (void)ytListView:(YTListView *)listView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", (long)indexPath.row);
}
- (UIPageViewController *)pageViewController {
    if (!_pageViewController) {
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageViewController.delegate = self;
        _pageViewController.dataSource = self;
        YTReaderContentViewController *initialViewController = [self viewControllerAtIndex:0];
        NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
        [_pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [tap addTarget:self action:@selector(pageViewControllerWithTap:)];
        [_pageViewController.view addGestureRecognizer:tap];
    }
    return _pageViewController;
}
- (YTReaderContentViewController *)contentVC {
    if (!_contentVC) {
        _contentVC = [[YTReaderContentViewController alloc] init];
    }
    return _contentVC;
}
- (NSMutableArray *)pageContentArray {
    if (!_pageContentArray) {
        _pageContentArray = [[NSMutableArray alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"第一章" ofType:@"txt"];
        NSString *content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:content];
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:8];
        paragraphStyle.paragraphSpacing = 5.0;
        paragraphStyle.paragraphSpacingBefore = 1.0;
        paragraphStyle.headIndent = 0.0;
        
        [attString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [content length])];
        [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, [content length])];
        NSArray *arr = [attString pageRangeArrayWithConstrainedToSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-20, [UIScreen mainScreen].bounds.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height*4)];
        NSLog(@"%@", arr);
        
        for (int i = 0; i < arr.count; i++) {
            NSRange range = [arr[i] rangeValue];
            [_pageContentArray addObject:[attString attributedSubstringFromRange:range]];
        }
    }
    return _pageContentArray;
}
#pragma mark - 根据index得到对应的UIViewController
- (YTReaderContentViewController *)viewControllerAtIndex:(NSUInteger)index {
    if (([self.pageContentArray count] == 0) || (index >= [self.pageContentArray count])) {
        return nil;
    }
    // 创建一个新的控制器类，并且分配给相应的数据
    YTReaderContentViewController *contentVC = [[YTReaderContentViewController alloc] init];
    contentVC.content = [self.pageContentArray objectAtIndex:index];
    contentVC.bgColor = [UIColor colorWithRed:247.0/255.0 green:230.0/255.0 blue:174.0/255.0 alpha:1];
    return contentVC;
}
#pragma mark - 数组元素值，得到下标值
- (NSUInteger)indexOfViewController:(YTReaderContentViewController *)viewController {
    return [self.pageContentArray indexOfObject:viewController.content];
}
//向前翻页执行
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:(YTReaderContentViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}
// 向后翻页时执行
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:(YTReaderContentViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == [self.pageContentArray count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}
//在动画执行完毕后被调用，在controller切换完成后，我们可以在这个代理中进行一些后续操作
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    NSLog(@"在动画执行完毕后被调用，在controller切换完成后，我们可以在这个代理中进行一些后续操作");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
