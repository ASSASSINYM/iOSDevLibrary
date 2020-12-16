//
//  BaseViewController.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2020/12/16.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = self.baseBgColor;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeStyle) name:@"changeStyle" object:nil];
}

#pragma mark - change Style

-(void)changeStyle {
    self.view.backgroundColor = [UIColor yellowColor];
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
