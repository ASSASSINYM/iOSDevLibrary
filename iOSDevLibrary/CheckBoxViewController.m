//
//  CheckBoxViewController.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2020/12/15.
//

#import "CheckBoxViewController.h"
#import "MTCheckBoxBtn.h"

@interface CheckBoxViewController ()

@end

@implementation CheckBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MTCheckBoxBtn *checkBox = [[MTCheckBoxBtn alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    checkBox.type = MTSquareType;
    
    [self.view addSubview:checkBox];
}


@end
