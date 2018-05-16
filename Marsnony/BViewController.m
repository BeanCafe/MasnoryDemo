//
//  BViewController.m
//  Marsnony
//
//  Created by Zeaple on 2018/5/14.
//  Copyright © 2018年 Zeaple. All rights reserved.
//

#import "BViewController.h"

#import "Masonry.h"

@interface BViewController ()

@property(strong, nonatomic)UIView *bottomView;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSlidesView];
    // Do any additional setup after loading the view.
}

- (void)createSlidesView {
    UIView *lastView = self.view;
    
    for (int i=0; i<10; i++) {
        UIView *interView = [UIView new];
        interView.backgroundColor = [UIColor yellowColor];
        interView.layer.borderColor = [UIColor blackColor].CGColor;
        interView.layer.borderWidth = 5;
        [self.view addSubview:interView];
        
        [interView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(lastView).with.insets(UIEdgeInsetsMake(20, 20, 20, 20));
        }];
        
        lastView = interView;
    }
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
