//
//  ProgressViewController.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2021/1/29.
//

#import "ProgressViewController.h"
#import "MTBarProgressView.h"

@interface ProgressViewController ()

@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    MTBarProgressView *progressBar = [[MTBarProgressView alloc] initWithFrame:CGRectMake(20, 200, self.view.bounds.size.width - 40, 30)];
    progressBar.progress = 0.0;
    [self.view addSubview:progressBar];
    
    
    NSLog(@"fuck it");
    for (int i = 0; i < 100; i++) {
        wait(1);
        CGFloat j = i/100.0;
        NSLog(@"j = %lf",j);
        
        progressBar.progress = j;
    }
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
