//
//  ViewController.m
//  Sear
//
//  Created by WJ on 17/2/12.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "ViewController.h"
#define SIZE_SCALE_IPHONE6(x)   (x * ([UIScreen mainScreen].bounds.size.width / 375))

@interface ViewController ()<UISearchBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView * searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, SIZE_SCALE_IPHONE6(375), SIZE_SCALE_IPHONE6(60))];
    searchView.backgroundColor = [UIColor colorWithRed:255/255.0 green:55/255.0 blue:87/255.0 alpha:1];
    [self.view addSubview:searchView];
    
    UISearchBar * mySearch = [[UISearchBar alloc] init];
    mySearch.delegate = self;
    mySearch.placeholder = @"请选择你喜欢的商品";
    [searchView addSubview:mySearch];

    mySearch.frame = CGRectMake(30, 10, 200, 30);
    
    // 方法一:
    // 去掉searchbar背景色(灰色边框)
//    [[[[mySearch.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
//    // 去除 searchBar 输入框内的白色的背景颜色
//    [[[[[mySearch.subviews objectAtIndex:0] subviews] objectAtIndex:0].subviews objectAtIndex:0] removeFromSuperview];
    
    // 方法二:
    for (UIView *tempV in [[mySearch.subviews objectAtIndex:0] subviews]) {
        NSString *str = NSStringFromClass([tempV class]);
        if ([str isEqualToString:@"UISearchBarBackground"]) {
            // 去掉背景颜色 (灰色边框)
            [tempV removeFromSuperview];
        }else{
            // 去掉白色背景
            [[[tempV subviews] objectAtIndex:0] removeFromSuperview];
        }
    }
    
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"%s",__FUNCTION__);
}


@end
