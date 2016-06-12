
//
//  BarView.h
//  笑话大全_设置页面
//
//  Created by AierChen on 1/6/16.
//  Copyright © 2016年 Canterbury Tale Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarView : UIView
@property (strong, nonatomic) UIButton *likedImageButton;
@property (strong, nonatomic) UIButton *likedTextButton;
@property (strong, nonatomic) UIButton *profileButton;
@property (strong, nonatomic) NSArray *allButtons;
@property (weak, nonatomic) IBOutlet UIView *orangeLine;
@property (weak, nonatomic) IBOutlet UIView *largeUIView;

@end
