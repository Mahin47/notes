//
//  NDetailsViewController.h
//  notes
//
//  Created by Mahin Nur Islam on 10/24/16.
//  Copyright © 2016 Mahin Nur Islam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Note;

@interface NDetailsViewController : UIViewController

@property (nonatomic, strong) Note *note;

@property (strong, nonatomic) IBOutlet UITextField *textfield;
@property (strong, nonatomic) IBOutlet UITextView *textview;



@end
