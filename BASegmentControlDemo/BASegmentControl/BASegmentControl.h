//
//  BASegmentControl.h
//  test
//
//  Created by 博爱 on 16/5/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"

@protocol BASegmentControlDelegate;
@interface BASegmentControl : UIView <UIScrollViewDelegate>
{
    UIScrollView                                        *_rootScrollView;                      //主视图
    UIScrollView                                        *_topScrollView;                       //顶部页签视图
    
    CGFloat                                             _userContentOffsetX;
    BOOL                                                _isLeftScroll;                         //是否左滑动
    BOOL                                                _isBuildUI;                            //是否建立了ui
    NSInteger                                           _userSelectedChannelID;                //点击按钮选择名字ID
    
    UIColor                                             *_tabItemNormalColor;                   //正常时tab文字颜色
    UIColor                                             *_tabItemSelectedColor;                 //选中时tab文字颜色
    UIColor                                             *_tabItemNormalBackgroundColor;         //tab背景颜色
    UIColor                                             *_tabItemSelectionIndicatorColor;       //tab被选中横线\box 颜色
    
    CGFloat                                             _tabItemNormalFont;                     //tab字体大小
    CGFloat                                             _tabItemSelectedFont;                   //被选中字体大小
    
    BOOL                                                _verticalDividerEnabled;                //是否有垂直分界线
    UIColor                                             *_verticalDividerColor;                  //垂直分界线颜色
    CGFloat                                             _verticalDividerWidth;                  //垂直分界线宽度
    
    HMSegmentedControlSelectionStyle                   _tabSelectionStyle;                      //tab被选中 box 风格
    HMSegmentedControlSelectionIndicatorLocation       _tabSelectionIndicatorLocation;          //tab被选中 box 风格位置
    
    HMSegmentedControlSegmentWidthStyle _segmentWidthStyle; // 宽度样式
    
    NSMutableArray                                      *_viewArray;                            //主视图的子视图数组
    
    UIViewController                                     *_segmentController;
    
}

@property (nonatomic, weak)   id<BASegmentControlDelegate>                     segmentControlDelegate;

@property (nonatomic, strong)  UIScrollView                                     *topScrollView;
@property (nonatomic, strong)  UIScrollView                                     *rootScrollView;
@property (nonatomic, assign)  CGFloat                                          userContentOffsetX;
@property (nonatomic, assign)  NSInteger                                        userSelectedChannelID;

@property (nonatomic, strong)  UIColor                                          *tabItemNormalColor;
@property (nonatomic, strong)  UIColor                                          *tabItemSelectedColor;
@property (nonatomic, strong)  UIColor                                          *tabItemNormalBackgroundColor;
@property (nonatomic, strong)  UIColor                                          *tabItemSelectionIndicatorColor;

@property (nonatomic, assign)  CGFloat                                          tabItemNormalFont;
@property (nonatomic, assign)  CGFloat                                          tabItemSelectedFont;

@property (nonatomic, assign)  BOOL                                             verticalDividerEnabled;
@property (nonatomic, strong)  UIColor                                          *verticalDividerColor;
@property (nonatomic, assign)  CGFloat                                          verticalDividerWidth;

@property (nonatomic ,assign)  HMSegmentedControlSelectionStyle                tabSelectionStyle;
@property (nonatomic ,assign)  HMSegmentedControlSelectionIndicatorLocation    tabSelectionIndicatorLocation;

@property (nonatomic, assign) HMSegmentedControlSegmentWidthStyle segmentWidthStyle;

@property (nonatomic, strong)  NSMutableArray           *viewArray;

@property (nonatomic, strong)  NSMutableArray           *channelName; //存放频道名称


/*!
 *  创建子视图UI
 */
- (void)ba_buildUI;

/*!
 *  跳转指定segment
 *
 *  @param index 当前的segmentBar
 */
- (void)ba_changeSlideAtSegmentIndex:(NSInteger)index;

/*!
 *  初始化
 *
 *  @param frame         frame
 *  @param channel       平台数组
 *  @param srcController VC
 *
 *  @return              实例化
 */
- (id)ba_initWithFrame:(CGRect)frame channelName:(NSArray *)channel source:(UIViewController *)srcController;

/*!
 *  初始化
 *
 *  @param frame                 frame
 *  @param sectionImages         图片
 *  @param sectionSelectedImages 被选中的图片
 *  @param srcController         VC
 *
 *  @return 实例化
 */
- (id)ba_initWithFrame:(CGRect)frame sectionImages:(NSArray *)sectionImages sectionSelectedImages:(NSArray *)sectionSelectedImages source:(UIViewController *)srcController;

@end


/*! 代理方法 */
@protocol BASegmentControlDelegate <NSObject>

@required

/*!
 *  顶部title个数
 *
 *  @param view BASegmentControl
 *
 *  @return 顶部title个数
 */
- (NSUInteger)ba_numberOfTitle:(BASegmentControl *)view;

/*!
 *  每个title所属的viewController
 *
 *  @param view   BASegmentControl
 *  @param index 顶部title索引
 *
 *  @return 每个title所属的viewController
 */
- (UIViewController *)ba_slideSwitchView:(BASegmentControl *)view viewOfTitle:(NSUInteger)index;

/*!
 *  滑动左边界时传递手势
 */
@optional
- (void)ba_slideSwitchView:(BASegmentControl *)view panLeftEdge:(UIPanGestureRecognizer*) panParam;

/*!
 *  滑动右边界时传递手势
 *
 *  @param view     BASegmentControl
 *  @param panParam 手势
 */
//- (void)ba_slideSwitchView:(BASegmentControl *)view panRightEdge:(UIPanGestureRecognizer*) panParam;

/*!
 * @method 点击tab
 * @abstract
 * @discussion
 * @param tab索引
 * @result
 */
/*!
 *  点击title
 *
 *  @param view   BASegmentControl
 *  @param index title索引
 */
- (void)ba_slideSwitchView:(BASegmentControl *)view didselectTitle:(NSUInteger)index;



@end
