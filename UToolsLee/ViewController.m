//
//  ViewController.m
//  UTools
//
//  Created by iOS on 2019/6/26.
//  Copyright © 2019 Lee. All rights reserved.
//

#import "ViewController.h"
#import "ButtonTool/UIButtonTools.h"
#import "LabealTool/UILabealTools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButtonTools shareUITolls] createButtonWithTitle:@"这是个按钮" titleColor:[UIColor blackColor] titleFont:[UIFont systemFontOfSize:13] addTarget:self action:@selector(thisIsBtnClick) superView:self.view];
    btn.frame = CGRectMake(10, 100, 80, 20);
    
    UILabel *lab = [[UILabealTools shareUITolls] createLableWithFrame:CGRectMake(10, 150, 50, 20) text:@"标签" textColor:[UIColor blackColor] textFontOfSize:14 superView:self.view];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)thisIsBtnClick
{
    NSLog(@"asdfsaf");
}

@end
