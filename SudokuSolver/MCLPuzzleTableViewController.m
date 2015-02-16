//
//  MCLPuzzleTableViewController.m
//  SudokuSolver
//
//  Created by Jeff Hajewski on 12/2/14.
//  Copyright (c) 2014 Monarch Lags. All rights reserved.
//

#import "MCLPuzzleTableViewController.h"
#import "MCLSudokuPuzzle.h"
#import "MCLSudokuPuzzleViewController.h"

@interface MCLPuzzleTableViewController ()

@property (nonatomic, strong)NSMutableArray *puzzleNameList;
@property NSInteger selectedPuzzle;

@end

@implementation MCLPuzzleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Load puzzles
    _puzzleList = [[NSMutableArray alloc] init];
    _puzzleNameList = [[NSMutableArray alloc] init];
    
    NSArray *easyPuzzle = @[@0, @6, @1, @8, @0, @0, @0, @0, @7,
                            @0, @8, @9, @2, @0, @5, @0, @4, @0,
                            @0, @0, @0, @0, @4, @0, @9, @0, @3,
                            @2, @0, @0, @1, @6, @0, @3, @0, @0,
                            @6, @7, @0, @0, @0, @0, @0, @5, @1,
                            @0, @0, @4, @0, @2, @3, @0, @0, @8,
                            @7, @0, @5, @0, @9, @0, @0, @0, @0,
                            @0, @9, @0, @4, @0, @2, @7, @3, @0,
                            @1, @0, @0, @0, @0, @8, @4, @6, @0];
    
    NSArray *easyPuzzleSolution = @[ @4, @6, @1, @8, @3, @9, @5, @2, @7,
                                     @3, @8, @9, @2, @7, @5, @1, @4, @6,
                                     @5, @2, @7, @6, @4, @1, @9, @8, @3,
                                     @2, @5, @8, @1, @6, @7, @3, @9, @4,
                                     @6, @7, @3, @9, @8, @4, @2, @5, @1,
                                     @9, @1, @4, @5, @2, @3, @6, @7, @8,
                                     @7, @4, @5, @3, @9, @6, @8, @1, @2,
                                     @8, @9, @6, @4, @1, @2, @7, @3, @5,
                                     @1, @3, @2, @7, @5, @8, @4, @6, @9];
    
    [self.puzzleList addObject:easyPuzzle];
    [self.puzzleNameList addObject:@"Arizona Daily Wildcat - 1/17/2006"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.puzzleList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"puzzleCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"puzzleCell"];
    }
    cell.textLabel.text = self.puzzleNameList[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Set property to hold the selected puzzle
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedPuzzle = indexPath.row;
}

#pragma mark - Navigation

// Pass puzzle back to solver view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    MCLSudokuPuzzleViewController *dvc = [segue destinationViewController];
    dvc.puzzle = self.puzzleList[self.selectedPuzzle];
}


@end
