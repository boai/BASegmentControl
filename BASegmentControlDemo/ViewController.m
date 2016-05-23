//
//  ViewController.m
//  test
//
//  Created by 博爱 on 16/5/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "ViewController.h"
#import "HMSegmentedControl.h"
#import "view1.h"
#import "view2.h"
#import "view3.h"
#import "view4.h"


#define KCOLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#pragma mark - ***** frame设置
// 当前设备的屏幕宽度
#define KSCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
// 当前设备的屏幕高度
#define KSCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) HMSegmentedControl  *segmentedControl;
@property (nonatomic, strong) UIScrollView        *scrollView;

@property (nonatomic, strong) view1               *views1;
@property (nonatomic, strong) view2               *views2;
@property (nonatomic, strong) view3               *views3;
@property (nonatomic, strong) view4               *views4;

@property (nonatomic, assign) CGRect views1Frame;
@property (nonatomic, assign) CGRect views2Frame;
@property (nonatomic, assign) CGRect views3Frame;
@property (nonatomic, assign) CGRect views4Frame;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"demo";

    self.view.backgroundColor = [UIColor whiteColor];

    [self cetupUI];
}

- (void)cetupUI
{
    self.segmentedControl.hidden = NO;
    self.scrollView.hidden = NO;
    
    self.views1.hidden = NO;
    self.views2.hidden = NO;
    self.views3.hidden = NO;
    self.views4.hidden = NO;
}

- (HMSegmentedControl *)segmentedControl
{
    if (!_segmentedControl)
    {
        _segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 64, KSCREEN_WIDTH, 40)];
        _segmentedControl.sectionTitles = @[@"boai", @"博爱", @"博爱3", @"博爱411111111111"];
        _segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        _segmentedControl.selectedSegmentIndex = 0;
        _segmentedControl.backgroundColor = [UIColor whiteColor];
        _segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
        _segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : KCOLOR(29, 192, 184, 1.0)};
        _segmentedControl.selectionIndicatorColor = KCOLOR(29, 192, 184, 1.0);
        _segmentedControl.selectionIndicatorHeight = 2.0f;
        _segmentedControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleDynamic;
        _segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _segmentedControl.verticalDividerEnabled = YES;
        _segmentedControl.verticalDividerColor = [UIColor lightGrayColor];
        _segmentedControl.verticalDividerWidth = 1.0f;
        
        [self.view addSubview:_segmentedControl];
        
        __weak typeof(self) weakSelf = self;
        [_segmentedControl setIndexChangeBlock:^(NSInteger index) {
            [weakSelf.scrollView scrollRectToVisible:CGRectMake(KSCREEN_WIDTH * index, 0, KSCREEN_WIDTH, 200) animated:YES];
        }];
    }
    return _segmentedControl;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_segmentedControl.frame), KSCREEN_WIDTH, KSCREEN_HEIGHT - CGRectGetMaxY(_segmentedControl.frame))];
        self.scrollView.backgroundColor = [UIColor whiteColor];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.contentSize = CGSizeMake(KSCREEN_WIDTH * (_segmentedControl.sectionTitles.count), KSCREEN_HEIGHT - CGRectGetMaxY(_segmentedControl.frame));
        self.scrollView.delegate = self;
//        [self.scrollView scrollRectToVisible:CGRectMake(0, 0, KSCREEN_WIDTH, self.scrollView.frame.size.height) animated:NO];
        [self.view addSubview:self.scrollView];
        
        _views1Frame = CGRectMake(0, 0, KSCREEN_WIDTH, self.scrollView.frame.size.height);
        _views2Frame = CGRectMake(KSCREEN_WIDTH, 0, KSCREEN_WIDTH, self.scrollView.frame.size.height);
        _views3Frame = CGRectMake(KSCREEN_WIDTH * 2, 0, KSCREEN_WIDTH, self.scrollView.frame.size.height);
        _views4Frame = CGRectMake(KSCREEN_WIDTH * 3, 0, KSCREEN_WIDTH, self.scrollView.frame.size.height);
    }
    return _scrollView;
}

#pragma mark - ***** UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [_segmentedControl setSelectedSegmentIndex:page animated:YES];
}

#pragma mark 随机颜色
- (UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

#pragma mark - ***** setter / getter
- (view1 *)views1
{
    if (!_views1)
    {
        _views1 = [[view1 alloc] initWithFrame:_views1Frame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
        _views1.backgroundColor = [self randomColor];
        [self.scrollView addSubview:_views1];
    }
    return _views1;
}

- (view2 *)views2
{
    if (!_views2)
    {
        _views2 = [[view2 alloc] initWithFrame:_views2Frame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
        //        _views2.backgroundColor = [self ba_randomColor];
        [self.scrollView addSubview:_views2];
    }
    return _views2;
}

- (view3 *)views3
{
    if (!_views3)
    {
        _views3 = [[view3 alloc] initWithFrame:_views3Frame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
        [self.scrollView addSubview:_views3];
    }
    return _views3;
}

- (view4 *)views4
{
    if (!_views4)
    {
        _views4 = [[view4 alloc] initWithFrame:_views4Frame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
        [self.scrollView addSubview:_views4];
    }
    return _views4;
}

@end
