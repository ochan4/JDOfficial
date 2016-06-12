//
//  BarView.m
//  笑话大全_设置页面
//
//  Created by AierChen on 1/6/16.
//  Copyright © 2016年 Canterbury Tale Inc. All rights reserved.
//

#import "BarView.h"

@implementation BarView

-(void)awakeFromNib{
    
    [self setButton];
    
    self.allButtons = [[NSArray alloc]initWithObjects:self.likedImageButton,self.likedTextButton,self.profileButton,nil];
    
    self.likedImageButton.selected = YES;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(firstButtonNoti:) name:@"ScrollView第一页面监听" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(secondButtonNoti:) name:@"ScrollView第二页面监听" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(thirdButtonNoti:) name:@"ScrollView第三页面监听" object:nil];
}

-(void)setButton{
    self.likedImageButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 2, kScreenW/3, 35)];
    [self.likedImageButton setTitle:@"喜欢的图片" forState:UIControlStateNormal];
    self.likedImageButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.likedImageButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.likedImageButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.likedImageButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [self.likedImageButton addTarget:self action:@selector(likeImageAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.largeUIView addSubview:self.likedImageButton];
    
    self.likedTextButton = [[UIButton alloc]initWithFrame:CGRectMake(kScreenW/3, 2, kScreenW/3, 35)];
    [self.likedTextButton setTitle:@"喜欢的笑话" forState:UIControlStateNormal];
    self.likedTextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.likedTextButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.likedTextButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.likedTextButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [self.likedTextButton addTarget:self action:@selector(likeTextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.largeUIView addSubview:self.likedTextButton];
    
    self.profileButton = [[UIButton alloc]initWithFrame:CGRectMake(kScreenW/3+kScreenW/3, 2, kScreenW/3, 35)];
    [self.profileButton setTitle:@"设置" forState:UIControlStateNormal];
    self.profileButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.profileButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.profileButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.profileButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [self.profileButton addTarget:self action:@selector(profileAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.largeUIView addSubview:self.profileButton];
    
}

-(void)firstButtonNoti:(NSNotification *)noti{
    [self buttonHighlight:self.likedImageButton];
    [self orangeLinePosition:self.likedImageButton.center.x];
}

-(void)secondButtonNoti:(NSNotification *)noti{
    [self buttonHighlight:self.likedTextButton];
    [self orangeLinePosition:self.likedTextButton.center.x];
}

-(void)thirdButtonNoti:(NSNotification *)noti{
    [self buttonHighlight:self.profileButton];
    [self orangeLinePosition:self.profileButton.center.x];
}

//按钮
- (void)likeImageAction:(UIButton *)sender {
    
    [self buttonHighlight:self.likedImageButton];
    
    [self orangeLinePosition:self.likedImageButton.center.x];
    
    //发出通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"喜欢的图片监听" object: @"barView1"];
}

- (void)likeTextAction:(UIButton *)sender {
    
    [self buttonHighlight:self.likedTextButton];
    
    [self orangeLinePosition:self.likedTextButton.center.x];
    
    //发出通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"喜欢的笑话监听" object: @"barView2"];
}

- (void)profileAction:(UIButton *)sender {
    
    [self buttonHighlight:self.profileButton];
    
    [self orangeLinePosition:self.profileButton.center.x];
    
    //发出通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"设置监听" object: @"barView3"];
}

-(void)buttonHighlight:(UIButton *)sender{
    for (UIButton *btn in self.allButtons) {
        if (![sender isEqual:btn]) {
            btn.selected = NO;
        }
    }
    sender.selected = YES;
}

-(void)orangeLinePosition:(float)x{
    //直接做动画
    [UIView animateWithDuration:0.3 animations:^{
        self.orangeLine.center = CGPointMake(x, self.orangeLine.center.y);
    }];
}

@end
