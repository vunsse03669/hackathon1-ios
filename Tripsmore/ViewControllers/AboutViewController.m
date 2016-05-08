//
//  AboutViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LocalizedString(@"About");
    [self.view addGestureRecognizer:[SWRevealViewController shareInstance].panGestureRecognizer];
    
    [self.webView loadHTMLString:@"<html><body><p align=\"justify\" style=\"font-size:12px;\">For the first time Revit Technologies developed and released the Pashto Dictionary application for iPhone (iOS) users in May 2012. Pashto Dicitonary was the first but still leading dictionary application of Pashto language on App Store. A major upgrade of the application has just been completed and released in February 2016. Improvements and new changes include the following:<br/><br/>1. Thousands of new Pashto and English words added to the database.<br/>2. Journalism related words database added.<br/>3. Add word to favourite list<br/>4. Add new words to the database.<br/>5. Edit existing words<br/>6. Delete words from the database.<br/>7. Share words with others with one click.<br/>8. Existing bugs were fixed.<br/>9. Compatibility with new devices added.<br/>10. A new design and theme feature used.<br/>11. No internet connection required for (working offline).<br/>12. The Pashto Dictionary is offered free of charge with ads. (Ad-free version requires purchase)<br/><br/>We are committed to having frequent upgrades from now on to our Pashto Dictionary. We highly value our users input in this regard. Should you have any suggestions or material that can add to the value to the Pashto Dictionary, please contact us via email or phone. The application is completely free to use with ads. <br/><br/>To get more, please visit our website .com<br/>Email us: info@revittechnology.com<br/>Ph: +1-416-854-1324</p> </body></html>" baseURL:nil];
}

- (void)backAction:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
