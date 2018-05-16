//
//  AViewController.m
//  Marsnony
//
//  Created by Zeaple on 2018/5/14.
//  Copyright © 2018年 Zeaple. All rights reserved.
//

#import "AViewController.h"

#import <Masonry.h>

@interface AViewController ()

@property(strong, nonatomic)UIView *greenView;
@property(strong, nonatomic)UIView *redView;
@property(strong, nonatomic)UIView *blueView;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.greenView = [UIView new];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];

    self.redView = [UIView new];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];

    self.blueView = [UIView new];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];

    int padding = 10;
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).with.offset(padding);
        make.left.mas_equalTo(self.view).with.offset(padding);
        make.bottom.mas_equalTo(self.blueView.mas_top).with.offset(-padding);
        make.right.mas_equalTo(self.redView.mas_left).with.offset(-padding);
        
        make.width.mas_equalTo(self.redView.mas_width);
        make.height.mas_equalTo(self.redView.mas_height);
    }];
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.greenView);
        make.left.mas_equalTo(self.greenView.mas_right).with.offset(padding);
        make.bottom.mas_equalTo(self.greenView);
        make.right.mas_equalTo(self.view.mas_right).with.offset(-padding);
        
        
    }];
    
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.greenView.mas_bottom).with.offset(padding);
        make.left.mas_equalTo(self.greenView);
        make.bottom.mas_equalTo(self.view).with.offset(-padding);
        make.right.mas_equalTo(self.view).with.offset(-padding);
        
        make.height.mas_equalTo(self.greenView);
    }];
    // Do any additional setup after loading the view.
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
