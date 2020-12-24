//
//  FuckViewController.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2020/12/16.
//

#import "FuckViewController.h"
#import "MTNotePopView.h"

@interface FuckViewController ()

@end

@implementation FuckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    MTNotePopView *pop = [MTNotePopView popViewWithTitle:@"提示" message:@"哈哈哈哈"];
    [pop show];
}

-(void)fuckit {
    NSLog(@"%s",__func__);
    
    NSLog(@"%@",self);
    int a,b,c;
    a = 10;
    b = 21;
    c = a + b;
    NSLog(@"%d",c);
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
