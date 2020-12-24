//
//  CheckBoxViewController.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2020/12/15.
//

#import "CheckBoxViewController.h"
#import "MTCheckBoxBtn.h"
#import "MTNotePopView.h"

@interface CheckBoxViewController ()

@end

@implementation CheckBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MTCheckBoxBtn *checkBox = [[MTCheckBoxBtn alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    checkBox.type = MTSquareType;
    
    [self.view addSubview:checkBox];
    
    self.view.backgroundColor = [UIColor whiteColor];

    int a,b,c;
    a = 1;
    b = 1;
    c = a + b;
    NSLog(@"%d",c);
    
    
    
    
}

#pragma mark - exchange style

-(IBAction)changeStyle:(id)sender {
    
    self.baseBgColor = [UIColor yellowColor];
   // [[NSNotificationCenter defaultCenter] postNotificationName:@"changeStyle" object:nil];
}

#pragma mark - next step

-(IBAction)nextStep:(id)sender {
    
    
}


@end
