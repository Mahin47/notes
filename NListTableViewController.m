//
//  NListTableViewController.m
//  notes
//
//  Created by Mahin Nur Islam on 10/24/16.
//  Copyright © 2016 Mahin Nur Islam. All rights reserved.
//

#import "NListTableViewController.h"
#import "NDetailsViewController.h"
#import "Note.h"


@interface NListTableViewController ()

@property (nonatomic, strong) NSMutableArray *note;

@end

@implementation NListTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _note = [NSMutableArray array];
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.note count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotesCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.note[indexPath.row] title];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.note removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowNote"]) {
        NDetailsViewController *noteDetailViewController = [segue destinationViewController];
        NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
        noteDetailViewController.note = self.note[selectedIndexPath.row];
    } else if ([segue.identifier isEqualToString:@"AddNote"]) {
        Note *note = [Note new];
        [self.note addObject:note];
        NDetailsViewController *noteDetailViewController = [segue destinationViewController];
        noteDetailViewController.note = note;
    }
}


@end
