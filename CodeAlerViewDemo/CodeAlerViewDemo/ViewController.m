//
//  ViewController.m
//  CodeAlerViewDemo
//
//  Created by 欧阳荣 on 17/4/18.
//  Copyright © 2017年 HengTaiXin. All rights reserved.
//

#import "ViewController.h"

#import "OYRAlertView.h"

@interface ViewController ()<OYRAlertViewDelegate>

@property (nonatomic,strong) OYRAlertView * oyrAlertView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 200, 50);
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn setTitle:@"点击申请加入" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

-(void)click{
    [self loadAlertView:@"请输入赛事密码" contentStr:nil btnNum:2 btnStrArr:[NSArray arrayWithObjects:@"取消",@"确认", nil] type:11];

}
- (void)loadAlertView:(NSString *)title contentStr:(NSString *)content btnNum:(NSInteger)num btnStrArr:(NSArray *)array type:(NSInteger)typeStr
{
    
    OYRAlertView *alertView = [[OYRAlertView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [alertView initWithTitle:title contentStr:content type:typeStr btnNum:num btntitleArr:array];
    alertView.delegate = self;
    UIView * keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview: alertView];
    self.oyrAlertView = alertView;
    
}
-(void)didClickButtonAtIndex:(NSUInteger)index password:(NSString *)password{
    switch (index) {
        case 101:
        {
            NSLog(@"Click ok");
            UIAlertController  *alert = [UIAlertController alertControllerWithTitle:@"您输入的密码" message:[NSString stringWithFormat:@"%@",self.oyrAlertView.pzxView.vertificationCode] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        case 100:
            NSLog(@"Click cancle");
            
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
