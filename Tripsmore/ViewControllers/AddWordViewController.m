//
//  AddWordViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "AddWordViewController.h"

@interface AddWordViewController ()

@property NSString *str;

@end

@implementation AddWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _str = [[NSString alloc]init];
    [self.view addGestureRecognizer:[SWRevealViewController shareInstance].panGestureRecognizer];
    if (self.word == nil) {
        NSLog(@"fdsyggfydsbgfsbfgvysd");
    } else {
        self.tfWord.text = self.word.word;
        self.tfTranslate.text = self.word.result;
//        self.word = [[Words alloc]init];
//        self.word.word = self.tfWord.text;
//        self.word.result = self.tfTranslate.text;
    }
    self.title = LocalizedString(@"Add Word");
}

- (void)backAction:(id)sender
{
    [[SWRevealViewController shareInstance] revealToggle:self.btnBack];
    if (self.word == nil) {
        
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"cccc");
}

- (IBAction)btnClearClicked:(id)sender {
    self.tfTranslate.text = @"";
    self.tfWord.text = @"";
}

- (IBAction)btnSaveClicked:(id)sender {
    Words *word = [[Words alloc] init];
    if (self.word != nil) {
        word = self.word;
    }
    
    word.word = self.tfWord.text;
    word.result = self.tfTranslate.text;
    
    word.isEng2Pa = self.isEng2Pa;
    
    _str = [[DatabaseService shareInstance] getDataByWord:word];
    if ([_str isEqualToString:@"xxx"]) {
        BOOL result = [[DatabaseService shareInstance] insert:word changeEditTime:YES];
        if (result) {
            NSLog(@"123");
            self.word = word;
            self.tfTranslate.text = @"";
            self.tfWord.text = @"";
            [self.view makeToast:LocalizedString(@"Inserted word successfully") duration:2.0 position:nil];
        } else {
            [self.view makeToast:LocalizedString(@"Inserted word failed!") duration:2.0 position:nil];
            NSLog(@"1243");
        }
    } else {
        BOOL result = [[DatabaseService shareInstance] update:word changeEditTime:YES];
        if (result) {
            [self.view makeToast:LocalizedString(@"Updated word successfully") duration:2.0 position:nil];
        } else {
            [self.view makeToast:LocalizedString(@"Updated word failed!") duration:2.0 position:nil];
            
        }
        
    }
}
@end
