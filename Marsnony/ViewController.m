//
//  ViewController.m
//  Marsnony
//
//  Created by Zeaple on 16/2/29.
//  Copyright © 2016年 Zeaple. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"

@interface ViewController ()

@property(nonatomic, assign)BOOL isAnimate;
@property(strong, nonatomic)UIView *aTestView;
@property(strong, nonatomic)UIView *bTestView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *superView = self.view;
    UIView *testView = [UIView new];
    testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView];

    UIView *bTestView = [UIView new];
    self.bTestView = bTestView;
    bTestView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bTestView];

    int padding = 50;
    NSLog(@"%@", superView.mas_top);
    [testView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(superView.mas_top).with.offset(padding);
//        make.left.mas_equalTo(superView.mas_left).with.offset(padding);
//        make.bottom.mas_equalTo(superView.mas_bottom).with.offset(-padding);
        
        make.edges.mas_equalTo(superView).with.insets(UIEdgeInsetsMake(padding, padding, padding, padding));
        make.right.mas_equalTo(bTestView.mas_left).offset(-padding);
        
        make.width.mas_equalTo(bTestView.mas_width);

    }];
    
    [bTestView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(superView.mas_top).with.offset(padding);
        make.left.mas_equalTo(testView.mas_right).with.offset(padding);
        make.right.mas_equalTo(superView.mas_right).with.offset(-padding);
        make.bottom.mas_equalTo(testView.mas_bottom);
        
        make.width.mas_equalTo(testView.mas_width);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.isAnimate) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
