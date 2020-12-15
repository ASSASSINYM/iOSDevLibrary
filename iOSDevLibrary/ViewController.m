//
//  ViewController.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2020/12/15.
//

#import "ViewController.h"
#import "MTTableViewCell.h"
#import "UITableView+CellAnimation.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.tableView customAnimation:CustomAnimationTypeLayDown];
}

#pragma mark - tableview delegate & datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MTTableViewCell"];
    return cell;
}

@end
