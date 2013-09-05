//
//  ViewController.h
//  Twitter_test
//
//  Created by Kranti Tech Services on 9/4/13.
//  Copyright (c) 2013 Asheesh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SA_OAuthTwitterEngine;
@class ACAccountStore;
@class SLRequest;

@interface ViewController : UIViewController<UITextFieldDelegate>
{  
    IBOutlet UITextField *search;
}

@end
