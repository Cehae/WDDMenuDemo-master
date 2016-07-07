//
//  WDDMenuViewController.m
//  WDDMenuViewDemo
//
//  Created by Wdong on 16/7/7.
//  Copyright © 2016年 Wdong. All rights reserved.
//

#import "WDDMenuViewController.h"
#import "WDDMenuView.h"
@interface WDDMenuViewController ()<WDDMenuViewDelegate>

@property (nonatomic, strong) NSMutableArray *titles;

@end
@implementation WDDMenuViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"WDDMenu";
    // 设置navigationBar不透明
    self.navigationController.navigationBar.translucent = NO;
    // 设置titles数组
    self.titles = [NSMutableArray array];
    for (NSInteger i = 0; i < 20; i++) {
        NSString *title = [NSString stringWithFormat:@"Menu %ld", i];
        [self.titles addObject:title];
    }
    // 创建WDDMenuView
    WDDMenuView *MenuView = [[WDDMenuView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64)];
    MenuView.titleColor = [UIColor  blackColor]; // 未选中时的标题文字颜色，默认grayColor
    MenuView.titleSelectedColor = [UIColor redColor]; // 选中时的标题文字颜色，默认blackColor
    MenuView.menuWith = 100.f; // menu栏的宽度，默认宽度100
    MenuView.delegate = self;
    MenuView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:MenuView];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark WDDMenuDelegate
#pragma mark @required

- (NSInteger)numberOfRowsInMenuView:(WDDMenuView *)menuView {
    return self.titles.count;
}

- (NSString *)menuView:(WDDMenuView *)menuView titleOfRow:(NSInteger)menuIndex {
    return self.titles[menuIndex];
}


- (UIView *)menuView:(WDDMenuView *)menuView centerViewForIndex:(NSInteger)menuIndex {
    
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 100, 190, 50)];
    label.backgroundColor = [UIColor whiteColor];
    label.text = [NSString stringWithFormat:@"CenterView %ld", menuIndex];
    [view addSubview:label];
    return view;
}


#pragma mark @optional

- (CGFloat)menuView:(WDDMenuView *)menuView heightForRow:(NSInteger)menuIndex {
    return 65.f;
}

- (void)menuView:(WDDMenuView *)menuView didSelectRowAtIndex:(NSInteger)menuIndex {
    // You can get centerView use menuView.centerView
    NSLog(@"centerView:%@", menuView.centerView);
}


@end
