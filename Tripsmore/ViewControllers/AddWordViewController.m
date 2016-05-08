//
//  AddWordViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "AddWordViewController.h"

@interface AddWordViewController ()

@end

@implementation AddWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.word == nil) {
        [self.view addGestureRecognizer:[SWRevealViewController shareInstance].panGestureRecognizer];
    } else {
        self.tfWord.text = self.word.word;
        self.tfTranslate.text = self.word.result;
    }
    self.title = LocalizedString(@"Add Word");
    
    
    // HIDE KEYBOARD
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    // tap.cancelsTouchesInView = NO;
}

// TAP TO DIHE KEYBOARD
-(void)dismissKeyboard
{
    [_tfWord resignFirstResponder];
    [_tfTranslate resignFirstResponder];
}

- (void)backAction:(id)sender
{
    if (self.word == nil) {
        [[SWRevealViewController shareInstance] revealToggle:self.btnBack];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if (self.word == nil) {
        BOOL result = [[DatabaseService shareInstance] insert:word changeEditTime:YES];
        if (result) {
            NSLog(@"123");
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
