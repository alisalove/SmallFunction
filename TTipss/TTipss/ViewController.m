//
//  ViewController.m
//  TTipss
//
//  Created by 唐俊杰 on 16/11/29.
//  Copyright © 2016年 MissTjj. All rights reserved.
//

#import "ViewController.h"
#import "TTips.h"


@interface ViewController ()
@property(nonatomic, strong)UIButton * tipsButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];

    self.tipsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.tipsButton.frame = CGRectMake(100 , 100, 100,100);
    self.tipsButton.backgroundColor = [UIColor blueColor];
    [self.tipsButton setTitle:@"showTips" forState:UIControlStateNormal];
    [self.tipsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.tipsButton.layer.masksToBounds = YES;
    self.tipsButton.layer.cornerRadius = 3;
    [self.view addSubview:self.tipsButton];
    [self.tipsButton addTarget:self action:@selector(showTheTips) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showTheTips{
    
     [TTips showMessages:@"糖豆你好，提示" duration:3000];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
