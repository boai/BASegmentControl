//
//  ViewController2.m
//  test
//
//  Created by 博爱 on 16/5/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BASegmentVC.h"
#import "BASegmentControl.h"
#import "ViewController.h"

@interface BASegmentVC ()<BASegmentControlDelegate>

@property (nonatomic, strong) BASegmentControl *slideSwitchView;
@property (nonatomic,strong ) NSArray            *itemArray;

@end

@implementation BASegmentVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"demo";
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildSegment];
}

#pragma mark - 配置segment
- (void)buildSegment
{
//    self.itemArray = @[@"首页",@"游戏",@"娱乐",@"新闻",@"游戏",@"网页游戏",@"段子",@"科技"];
    self.itemArray = @[@"首页",@"游戏",@"娱乐",@"新闻"];
    self.slideSwitchView = [[BASegmentControl alloc] ba_initWithFrame:CGRectMake(0 , 64 , self.view.frame.size.width, self.view.frame.size.height - 64) channelName:self.itemArray source:self];
    [self.slideSwitchView setUserInteractionEnabled:YES];
    
    // BASegmentControl代理
    self.slideSwitchView.segmentControlDelegate = self;
    
    //注意：设置字体大小，颜色，的背景，并且tabSelectionIndicatorLocation设置成HMSegmentedControlSelectionIndicatorLocationNone 实现木有被选中效果
    
    // 设置tab 颜色(可选)
    self.slideSwitchView.tabItemNormalColor = [UIColor blueColor];
    
    // 设置tab 被选中的颜色(可选)
    self.slideSwitchView.tabItemSelectedColor = [UIColor redColor];
    
    //设置tab 背景颜色(可选)
//    self.slideSwitchView.tabItemNormalBackgroundColor = [UIColor lightGrayColor];
//    //设置tab 被选中的标识的颜色(可选)
    self.slideSwitchView.tabItemSelectionIndicatorColor = [UIColor whiteColor];
    
    // 设置tab字体大小(可选)
    self.slideSwitchView.tabItemNormalFont = 15;
    
    // 被选中字体大小 (可选)
    self.slideSwitchView.tabItemSelectedFont = 20;
    
    // 设置tab 被选中标识的位置
//    self.slideSwitchView.tabSelectionIndicatorLocation = HMSegmentedControlSelectionStyleFullWidthStripe;
    // 设置tab 被选中标识的位置 实现木有被选中效果
    self.slideSwitchView.tabSelectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    
//    self.slideSwitchView.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    
    //设置分界线样式
//    self.slideSwitchView.verticalDividerEnabled = YES;
//    self.slideSwitchView.verticalDividerColor = [UIColor brownColor];
//    self.slideSwitchView.verticalDividerWidth = 1.0f;
    
    [self.view addSubview:self.slideSwitchView];
}

- (NSUInteger)ba_numberOfTitle:(BASegmentControl *)view
{
    return self.itemArray.count;
}

// 待加载的控制器
- (UIViewController *)ba_slideSwitchView:(BASegmentControl *)view viewOfTitle:(NSUInteger)index
{
    ViewController *root = [ViewController new];
    root.title = self.itemArray[index];
    return root;
}

- (void)ba_slideSwitchView:(BASegmentControl *)view didselectTitle:(NSUInteger)index
{
    ViewController *root = view.viewArray[index];
    [root rootLoadData:index];
}

@end
