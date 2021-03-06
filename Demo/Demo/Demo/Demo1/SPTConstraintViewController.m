//
//  SPTConstraintViewController.m
//  SPTPlayerKitDemo
//
//  Created by JD on 2017/12/1.
//  Copyright © 2017年 . All rights reserved.
//

#import "SPTConstraintViewController.h"
#import "UIView+JDLayout.h"

@interface SPTConstraintViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *view5;

@end

@implementation SPTConstraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //代码布局
    //代码更改xib约束
    [self codeLayout0];
    //自己处理垂直平分
    [self codeLayout1];
     //自己处理水平平分
    [self codeLayout2];
    //对齐
    [self codeLayout3];
    //简易的水平平分
    [self codeLayout4];
    //简易的垂直平分
    [self codeLayout5];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)click0:(id)sender {
    //更新约束
    self.button2
    .jd_left(self.button1).jd_equal(10).jd_update();
    [UIView animateWithDuration:1.0f delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:10 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
}

- (IBAction)click:(id)sender {
    //更新约束
    self.button2
    .jd_left(self.button1).jd_equal(100).jd_update();
    [UIView animateWithDuration:1.0f delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:10 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
}

//代码更改xib约束
- (void)codeLayout0 {
    
}

//自己处理垂直平分
- (void)codeLayout1 {
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"我是垂直平分1";
    label1.backgroundColor = [UIColor redColor];
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view1 addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"我是垂直平分2";
    label2.backgroundColor = [UIColor blueColor];
    label2.textAlignment = NSTextAlignmentCenter;
    [self.view1 addSubview:label2];
    
    label1
    .jd_top(self.view1).jd_equal(0).jd_and()
    .jd_centerX(self.view1).jd_equal(0)
    .jd_layout();
    
    label2
    .jd_top(label1.jd_bottomAttribute).jd_equal(0).jd_and()
    .jd_centerX(label1).jd_equal(0).jd_and()
    .jd_bottom(self.view1).jd_equal(0).jd_and()
    .jd_height(label1)
    .jd_layout();
}

 //自己处理水平平分
- (void)codeLayout2 {
    UILabel *label11 = [[UILabel alloc] init];
    label11.text = @"我是水平平分1";
    label11.backgroundColor = [UIColor redColor];
    label11.textAlignment = NSTextAlignmentCenter;
    [self.view2 addSubview:label11];
    UILabel *label21 = [[UILabel alloc] init];
    label21.text = @"我是水平平分2";
    label21.backgroundColor = [UIColor blueColor];
    label21.textAlignment = NSTextAlignmentCenter;
    [self.view2 addSubview:label21];
    
    label11
    .jd_left(self.view2).jd_equal(0).jd_and()
    .jd_centerY(self.view2).jd_equal(0).jd_and()
    .jd_layout();
    
    label21
    .jd_left(label11.jd_rightAttribute).jd_equal(0).jd_and()
    .jd_centerY(label11).jd_equal(0).jd_and()
    .jd_right(self.view2).jd_equal(0).jd_and()
    .jd_width(label11)
    .jd_layout();
}

//对齐
- (void)codeLayout3 {
    UILabel *label11 = [[UILabel alloc] init];
    label11.text = @"我是1";
    label11.backgroundColor = [UIColor redColor];
    label11.textAlignment = NSTextAlignmentCenter;
    [self.view3 addSubview:label11];
    
    label11
    .jd_left(self.view3).jd_equal(10).jd_and()
    .jd_width(@(200)).jd_and()
    .jd_top(self.view3).jd_equal(10)
    .jd_layout();
    
    UILabel *label21 = [[UILabel alloc] init];
    label21.text = @"我是2";
    label21.backgroundColor = [UIColor blueColor];
    label21.textAlignment = NSTextAlignmentCenter;
    [self.view3 addSubview:label21];
    //与label11左对齐
    label21
    .jd_left(label11.jd_leftAttribute).jd_equal(0).jd_and()
    .jd_width(label11.jd_widthAttribute).jd_equal(0).jd_and()
    .jd_top(label11.jd_bottomAttribute).jd_equal(10)
    .jd_layout();
}

//简易的水平平分
- (void)codeLayout4 {
    //水平平分
    UILabel *label11 = [[UILabel alloc] init];
    label11.text = @"我是11";
    label11.backgroundColor = [UIColor redColor];
    label11.textAlignment = NSTextAlignmentCenter;
    [self.view4 addSubview:label11];
    
    UILabel *label21 = [[UILabel alloc] init];
    label21.text = @"我是21";
    label21.backgroundColor = [UIColor blueColor];
    label21.textAlignment = NSTextAlignmentCenter;
    [self.view4 addSubview:label21];
    
    UILabel *label31 = [[UILabel alloc] init];
    label31.text = @"我是31";
    label31.backgroundColor = [UIColor orangeColor];
    label31.textAlignment = NSTextAlignmentCenter;
    [self.view4 addSubview:label31];
    
    self.view4.jd_equalWidthSubViews(@[label11,label21,label31]);
}

//简易的垂直平分
- (void)codeLayout5 {
    //水平平分
    UILabel *label11 = [[UILabel alloc] init];
    label11.text = @"我是11";
    label11.backgroundColor = [UIColor redColor];
    label11.textAlignment = NSTextAlignmentCenter;
    [self.view5 addSubview:label11];
    
    UILabel *label21 = [[UILabel alloc] init];
    label21.text = @"我是21";
    label21.backgroundColor = [UIColor blueColor];
    label21.textAlignment = NSTextAlignmentCenter;
    [self.view5 addSubview:label21];
    
    UILabel *label31 = [[UILabel alloc] init];
    label31.text = @"我是31";
    label31.backgroundColor = [UIColor orangeColor];
    label31.textAlignment = NSTextAlignmentCenter;
    [self.view5 addSubview:label31];
    
    self.view5.jd_equalHeightSubViews(@[label11,label21,label31]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
