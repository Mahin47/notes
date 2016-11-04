//
//  NDetailsViewController.m
//  notes
//
//  Created by Mahin Nur Islam on 10/24/16.
//  Copyright © 2016 Mahin Nur Islam. All rights reserved.
//

#import "NDetailsViewController.h"
#import "Note.h"

@interface NDetailsViewController ()

@end

@implementation NDetailsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.textfield.text = self.note.title;
    self.textview.text = self.note.view;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.note.title = self.textfield.text;
    self.note.view = self.textview.text;
}


@end
