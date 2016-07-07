//
//  WDDMenuView.h
//  WDDMenuViewDemo
//
//  Created by Wdong on 16/7/7.
//  Copyright © 2016年 Wdong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WDDMenuView;

@protocol WDDMenuViewDelegate <NSObject>

@required

/**
 *  设置菜单选项数量
 */
- (NSInteger)numberOfRowsInMenuView:(WDDMenuView *)menuView;

/**
 *  设置每个菜单的标题
 */
- (NSString *)menuView:(WDDMenuView *)menuView titleOfRow:(NSInteger)menuIndex;

/**
 *  设置每个菜单详情内容
 */
- (UIView *)menuView:(WDDMenuView *)menuView centerViewForIndex:(NSInteger)menuIndex;

@optional

/**
 *  设置每个menu选项的高度，默认65
 */
- (CGFloat)menuView:(WDDMenuView *)menuView heightForRow:(NSInteger)menuIndex;

/**
 *  menu选项被点击时的回调方法
 */
- (void)menuView:(WDDMenuView *)menuView didSelectRowAtIndex:(NSInteger)menuIndex;


@end


@interface WDDMenuView : UIView
/// 未选中时的标题文字颜色，默认grayColor
@property (nonatomic, strong) UIColor *titleColor;

/// 选中时的标题文字颜色，默认blackColor
@property (nonatomic, strong) UIColor *titleSelectedColor;

/// menu栏的宽度，默认宽度100
@property (nonatomic, assign) CGFloat menuWith;

/// 获取当前menu选项的centerView
@property (nonatomic, readonly, strong) UIView *centerView;

/// 设置WDDMenuView的代理
@property (nonatomic, assign) id<WDDMenuViewDelegate>delegate;



@end
