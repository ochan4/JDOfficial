//
//  VideoView.m
//  test
//
//  Created by jc on 16/6/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "VideoBrowerView.h"
#import <MediaPlayer/MPMediaPlayback.h>
@implementation VideoBrowerView

-(void)setShow:(ShowModel *)show{
    _show = show;
    
    //清空自身显示的之前的图片
    for (UIImageView *iv in self.subviews) {
        [iv removeFromSuperview];
    }
    
//    NSURL *url = [NSURL URLWithString:show.video_uri];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    //获取全局变量
//    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
//    //设置缓存方式
//    [request setDownloadCache:appDelegate.myCache];
//    //设置缓存数据存储策略，这里采取的是如果无更新或无法联网就读取缓存数据
//    [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
//    request.delegate = self;
//    [request startAsynchronous];
    
//    MPMoviePlayerViewController *mpviemController =[[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:show.video_uri]];
//    
//    MPMoviePlayerController *mp=[mpviemController moviePlayer];
//    
//    UIImage *thumbImage=[mp thumbnailImageAtTime:2 timeOption:MPMovieTimeOptionNearestKeyFrame];
    
    
    //视频预览图
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ImageWidth, ImageHeight)];
//    [iv sd_setImageWithURL:[NSURL URLWithString:show.imagePath] placeholderImage:[UIImage imageNamed:@"loadingImage"]];
    iv.image = [KrVideoPlayerController thumbnailImageForVideo:[NSURL URLWithString:_show.video_uri] atTime:1];
    iv.contentMode = UIViewContentModeScaleAspectFill;
    iv.clipsToBounds = YES;
    [self addSubview:iv];
    
    UIButton *ImageBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ScreenW/4, ScreenW/4)];
    ImageBtn.center = iv.center;
    [ImageBtn setImage:[UIImage imageNamed:@"PlayVideoImage"] forState:UIControlStateNormal];
    [self addSubview:ImageBtn];
    [ImageBtn addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    //增加点击播放
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(playVideo)];
//    [ImageBtn addGestureRecognizer:tap];
//    ImageBtn.userInteractionEnabled = YES;
    
}

- (void)playVideo{
    NSURL *url = [NSURL URLWithString:_show.video_uri];
    [self addVideoPlayerWithURL:url];
}

- (void)addVideoPlayerWithURL:(NSURL *)url{
    if (!self.videoController) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.videoController = [[KrVideoPlayerController alloc] initWithFrame:CGRectMake(0, 64, width, width*(9.0/16.0))];
        __weak typeof(self)weakSelf = self;
        [self.videoController setDimissCompleteBlock:^{
            weakSelf.videoController = nil;
        }];
        [self.videoController setWillBackOrientationPortrait:^{
//                        [weakSelf toolbarHidden:NO];
        }];
        [self.videoController setWillChangeToFullscreenMode:^{
//                        [weakSelf toolbarHidden:YES];
        }];
        [self.window.rootViewController.view addSubview:self.videoController.view];
    }
    self.videoController.contentURL = url;
    
}

@end
