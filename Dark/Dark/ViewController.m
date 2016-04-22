//
//  ViewController.m
//  Dark
//
//  Created by Mac on 16/4/20.
//  Copyright © 2016年 hyp. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "SendViewController.h"
@interface ViewController (){
    NSInteger _count ;
}
@property (nonatomic, retain) UIView *darkView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupBtn];
    [self addDrackView];
    _count = 0;
}
- (void)setupBtn {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(black:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sendBtn.frame = CGRectMake(100, 300, 100, 100);
    sendBtn.backgroundColor = [UIColor redColor];
    [sendBtn addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendBtn];
    
}
- (void)push:(UIButton *)sender {
    SendViewController *sVC = [SendViewController new];
    sVC.view.backgroundColor = [UIColor redColor];
    [self presentViewController:sVC animated:YES completion:nil];
    
}
- (void)black:(UIButton *)sender {
    
    _count++;
    NSLog(@"%ld",_count);
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [NSString stringWithFormat:@"%@/drack",path];
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (_count%2!=0) {
        [app.window addSubview:_darkView];
        [NSKeyedArchiver archiveRootObject:@"yes" toFile:filePath];
    }else {
        [app.darkView removeFromSuperview];
        [_darkView removeFromSuperview];
        [NSKeyedArchiver archiveRootObject:@"no" toFile:filePath];
        
    }
    
}
- (void)addDrackView
{
    self.darkView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    _darkView.backgroundColor = [UIColor blackColor];
    _darkView.alpha = 0.6;
    _darkView.userInteractionEnabled = NO;
//    [_darkView release];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
