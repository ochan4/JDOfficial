//
//  User.m
//  ITSNS
//
//  Created by tarena on 16/5/16.
//  Copyright © 2016年 Ivan. All rights reserved.
//

#import "User.h"
static User *_user;
@implementation User

+(User *)currentUser{
    if (!_user) {
        _user = [[User alloc]initWithBmobUser:[BmobUser getCurrentUser]];
    }
    
    return _user;
}

//数组要初始化
-(NSMutableArray *)likedJokeArray{
    _likedJokeArray = self.likedJokeArray;
    if (self) {
        self.likedJokeArray = [NSMutableArray new];
    }
    return _likedJokeArray;
}

- (instancetype)initWithBmobUser:(BmobUser *)bUser
{
    self = [super init];
    if (self) {
        self.name = [bUser objectForKey:@"name"];
        self.intro = [bUser objectForKey:@"intro"];
        self.headUrlPath = [bUser objectForKey:@"headUrlPath"];
        self.bUser = bUser;
    }
    return self;
}

-(void)update{
   
    [self.bUser setObject:self.name forKey:@"name"];
    [self.bUser setObject:self.headUrlPath forKey:@"headUrlPath"];
    [self.bUser setObject:self.intro forKey:@"intro"];
    
    [self.bUser updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            NSLog(@"更新个人信息成功！");
        }else{
            NSLog(@"更新失败：%@",error);
        }
    }];
    
}

@end
