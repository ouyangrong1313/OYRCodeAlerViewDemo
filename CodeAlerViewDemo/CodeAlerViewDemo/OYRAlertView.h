//
//  OYRAlertView.h
//  CodeAlerViewDemo
//
//  Created by 欧阳荣 on 17/4/18.
//  Copyright © 2017年 HengTaiXin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PZXVerificationCodeView.h"


@protocol OYRAlertViewDelegate <NSObject>

@optional

-(void)didClickButtonAtIndex:(NSUInteger)index password:(NSString *)password;

- (void)successPassword;


@end


@interface OYRAlertView : UIView<UITextFieldDelegate>

@property(nonatomic,strong)PZXVerificationCodeView *pzxView;


@property (nonatomic,strong)UIView *blackView;
@property (strong,nonatomic)UIView * alertview;
@property (strong,nonatomic)NSString * title;
@property (nonatomic,copy)NSString *contentStr;
@property (nonatomic,strong)UILabel *tipLable;
@property (weak,nonatomic) id<OYRAlertViewDelegate> delegate;
@property (nonatomic,assign)NSInteger type;
@property (nonatomic,assign)NSInteger numBtn;
@property (nonatomic,copy)NSString *password;
@property (nonatomic,retain)NSArray *btnTitleArr;
@property (nonatomic,retain)UITextField *textF;
-(void)initWithTitle:(NSString *) title contentStr:(NSString *)content type:(NSInteger)type btnNum:(NSInteger)btnNum btntitleArr:(NSArray *)btnTitleArr;









@end
