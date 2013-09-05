//
//  ViewController.m
//  Twitter_test
//
//  Created by Kranti Tech Services on 9/4/13.
//  Copyright (c) 2013 Asheesh. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import <Twitter/Twitter.h>
@interface ViewController ()
@property (nonatomic,strong) ACAccountStore *accountStore;
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    search.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidAppear: (BOOL)animated {
    
    if ([TWTweetComposeViewController canSendTweet])
    {
      // Valid account
    }
    else
    {        
        TWTweetComposeViewController *viewController = [[TWTweetComposeViewController alloc] init];        
        //hide the tweet screen
        viewController.view.hidden = YES;        
        viewController.completionHandler = ^(TWTweetComposeViewControllerResult result) {
            if (result == TWTweetComposeViewControllerResultCancelled) {
                [self dismissModalViewControllerAnimated:NO];
            }
        };
        [self presentModalViewController:viewController animated:NO];        
       
        [viewController.view endEditing:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text)
    {
        TableViewController *tableViewController = [[TableViewController alloc] init];
        tableViewController.text = textField.text;
        [self.navigationController pushViewController:tableViewController animated:YES];
    }
	[textField resignFirstResponder];
	return YES;
}
#pragma mark SA_OAuthTwitterEngineDelegate
- (void) storeCachedTwitterOAuthData: (NSString *) data forUsername: (NSString *) username {
    NSUserDefaults          *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: data forKey: @"authData"];
    [defaults synchronize];
}
- (NSString *) cachedTwitterOAuthDataForUsername: (NSString *) username {
    return [[NSUserDefaults standardUserDefaults] objectForKey: @"authData"];
}
#pragma mark TwitterEngineDelegate
- (void) requestSucceeded: (NSString *) requestIdentifier {
    NSLog(@"Request %@ succeeded", requestIdentifier);
}
- (void) requestFailed: (NSString *) requestIdentifier withError: (NSError *) error {
    NSLog(@"Request %@ failed with error: %@", requestIdentifier, error);
}

- (void)dealloc {    
    [super dealloc];
}
@end
