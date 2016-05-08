//
//  SettingViewController.m
//  Speedboy
//
//  Created by TaHoangMinh on 2/11/16.
//  Copyright © 2016 TaHoangMinh. All rights reserved.
//

#import "SettingViewController.h"
#import "ColorChooserViewController.h"
#import "IAPHelper.h"
#import "RageIAPHelper.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LocalizedString(@"Setting");
    [self.view addGestureRecognizer:[SWRevealViewController shareInstance].panGestureRecognizer];
    [self refreshButtons];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshButtons) name:IAPHelperProductPurchasedNotification object:nil];
}

- (void)backAction:(id)sender
{
    [[SWRevealViewController shareInstance] revealToggle:self.btnBack];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnThemeColorClicked:(id)sender {
    ColorChooserViewController *vc = [[Utils mainStoryboard] instantiateViewControllerWithIdentifier:@"ColorChooserViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)btnResetDataClicked:(id)sender {

}
- (IBAction)btnAboutClicked:(id)sender {

}
- (IBAction)btnRemoveAdsClicked:(id)sender {
    [self buyItem:kIAP_removeads];
}
- (IBAction)btnReloadClicekd:(id)sender {
    [[RageIAPHelper sharedInstance] restoreCompletedTransactions];
}

- (void) refreshButtons
{
    BOOL purchased = [[NSUserDefaults standardUserDefaults] boolForKey:kIAP_removeads];
    if (purchased) {
        self.btnRemoveAds.enabled = NO;
        [self.adsView removeFromSuperview];
        [self.iAdView removeFromSuperview];
    } else {
        self.btnRemoveAds.enabled = YES;
    }
}
- (void) buyItem:(NSString *)strItem
{
    if([[RageIAPHelper sharedInstance] productPurchased:strItem])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:IAPHelperProductPurchasedNotification object:nil userInfo:nil];
    }
    else
    {
        [[RageIAPHelper sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray * products)
         {
             if (success)
             {
                 if (products.count > 0) {
                     for (SKProduct *productBuy in products) {
                         if ([productBuy.productIdentifier isEqualToString:strItem]) {
                             [[RageIAPHelper sharedInstance] buyProduct:productBuy];
                         }
                     }
                 } else {
                     [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Can not find product" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                 }
             } else {
                 [[[UIAlertView alloc] initWithTitle:@"Error" message:@"There's error, please try again later!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
             }
         }];
    }
}

@end
