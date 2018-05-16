//
//  CViewController.m
//  Marsnony
//
//  Created by Zeaple on 2018/5/14.
//  Copyright © 2018年 Zeaple. All rights reserved.
//

#import "CViewController.h"

#import <Masonry.h>

@interface CViewController ()
@property(strong, nonatomic)UIView *animateView;

@property(strong, nonatomic)UIView *testView;

@property(nonatomic, assign)BOOL isAnimateFinished;

@property(strong, nonatomic)MASConstraint *animateConstraint;
@property(strong, nonatomic)NSMutableArray *constraintArray;
@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animateView = [UIView new];
    self.animateView.backgroundColor = [UIColor orangeColor];
    self.animateView.layer.borderColor = [UIColor blackColor].CGColor;
    self.animateView.layer.borderWidth = 2;
    [self.view addSubview:self.animateView];
    
    self.testView = [UIView new];
    self.testView.backgroundColor = [UIColor orangeColor];
    self.testView.layer.borderColor = [UIColor blackColor].CGColor;
    self.testView.layer.borderWidth = 2;

    [self.view addSubview:self.testView];

    self.constraintArray = [NSMutableArray array];
    [self.animateView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
        self.animateConstraint = make.top.mas_equalTo(self.view).with.offset(10);
        [self.constraintArray addObject:make.top.mas_equalTo(self.view).with.offset(10)];
        make.left.mas_equalTo(self.view).with.offset(10);
        make.bottom.mas_equalTo(self.testView.mas_top).with.offset(-10);
        make.right.mas_equalTo(self.view).with.offset(-10);
        
        make.height.mas_equalTo(self.testView);
    }];
    
    [self.testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.animateView.mas_bottom).with.offset(10);
        make.left.mas_equalTo(self.view).with.offset(10);
        make.bottom.mas_equalTo(self.view).with.offset(-10);
        make.right.mas_equalTo(self.view).with.offset(-10);

        make.height.mas_equalTo(self.animateView).priorityLow();
    }];
    
    //下载数据
    [self downloadData];
    // Do any additional setup after loading the view.
}

- (void)downloadData {
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.hidesWhenStopped = YES;
    [self.view addSubview:indicator];
    [indicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.animateView);
    }];
    [self.view layoutIfNeeded];
    
    //旋转
    [indicator startAnimating];
    
    //检测视图是否为动画后的大小, 如果为动画后的大小则变更为动画前大小
    if (self.isAnimateFinished) {
        [self.animateView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).with.offset(10);
            make.left.mas_equalTo(self.view).with.offset(10);
            make.bottom.mas_equalTo(self.testView.mas_top).with.offset(-10);
            make.right.mas_equalTo(self.view).with.offset(-10);
            
            make.height.mas_equalTo(self.testView);
        }];
        
        [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            self.isAnimateFinished = NO;
        }];
    }
    
    [self performSelector:@selector(finishDownloadWithIndicator:) withObject:indicator afterDelay:2.0];
}

- (void)finishDownloadWithIndicator:(UIActivityIndicatorView *)indicator {
    [indicator stopAnimating];
    
    if (self.isAnimateFinished) return;
    
    [self.animateView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).with.offset(10);
        make.left.mas_equalTo(self.view).with.offset(10);
        make.bottom.mas_equalTo(self.testView.mas_top).with.offset(-10);
        make.right.mas_equalTo(self.view).with.offset(-10);

        make.height.mas_equalTo(self.testView).multipliedBy(8);
    }];
//    self.animateConstraint.height.mas_equalTo(@(10));
//    MASConstraint *constraint = [self.constraintArray firstObject];
//    constraint.insets = ;
    
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.isAnimateFinished = YES;
        [self downloadData];
    }];
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
