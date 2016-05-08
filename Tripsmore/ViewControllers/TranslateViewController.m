//
//  TranslateViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "TranslateViewController.h"
#import "TranslateDetailViewController.h"

@interface TranslateViewController ()

@end

@implementation TranslateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LocalizedString(@"Translate");
    self.tfInput.text = @"";
    [self.view addGestureRecognizer:[SWRevealViewController shareInstance].panGestureRecognizer];
    [DatabaseService shareInstance];
    [self btnEng2PaClicked:self.btnEng2Pa];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.viewInput.backgroundColor = [StaticData sharedInstance].mainColor;
    self.btnClear.backgroundColor = [StaticData sharedInstance].mainColor;
    [self doSearch:self.tfInput.text];
}
- (void)backAction:(id)sender
{
    [[SWRevealViewController shareInstance] revealToggle:self.btnBack];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnEng2PaClicked:(id)sender {
    self.isEng2Pa = YES;
    [self doSearch:self.tfInput.text];
    [Utils setXView:self.viewLine height:self.btnEng2Pa.frame.origin.x];
}
- (IBAction)btnPa2EngClicked:(id)sender {
    self.isEng2Pa = NO;
    [self doSearch:self.tfInput.text];
    [Utils setXView:self.viewLine height:self.btnPa2Eng.frame.origin.x];
}
- (IBAction)btnClearClicked:(id)sender {
    self.tfInput.text = @"";
    [self doSearch:@""];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self doSearch:newText];
    return YES;
}

- (void) doSearch:(NSString *)newText
{
    if (newText.length == 0) {
        self.numberRowInSection = @{@(0): @(0)};
        [self.tableView reloadData];
        return;
    }
    NSArray *arr = [[DatabaseService shareInstance] search:newText eng2pa:self.isEng2Pa];
    self.tableData = arr;
    self.numberRowInSection = @{@(0): @(arr.count)};
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILabel *lbl1 = (UILabel *)[cell.contentView viewWithTag:101];
    UILabel *lbl2 = (UILabel *)[cell.contentView viewWithTag:102];
    
    Words *word = self.tableData[indexPath.row];
    lbl1.text = word.word;
    lbl2.text = word.result;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Words *word = self.tableData[indexPath.row];
    TranslateDetailViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"TranslateDetailViewController"];
    vc.word = word;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
