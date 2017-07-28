//
//  ViewController.m
//  Font-iOS
//
//  Created by 杨东明 on 2017/7/28.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)changeSizeAction:(UIButton *)sender {
    self.textField.text = [NSString stringWithFormat:@"%@", @(self.textField.text.integerValue + (sender.tag ? 1 : -1))];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [UIFont familyNames].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [UIFont familyNames][section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UIFont *font = [UIFont fontWithName:[UIFont familyNames][indexPath.section] size:self.textField.text.integerValue];
    cell.textLabel.font = font;
    if (indexPath.row == 0) {
        cell.textLabel.text = @"中文样式";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"English Style";
    } else {
        cell.textLabel.text = @"0123456789";
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
