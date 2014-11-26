//
//  MCLSudokuPuzzleViewController.m
//  SudokuSolver
//
//  Created by Jeff Hajewski on 11/24/14.
//  Copyright (c) 2014 Monarch Lags. All rights reserved.
//

#import "MCLSudokuPuzzleViewController.h"
#import "MCLSudokuPuzzle.h"

@interface MCLSudokuPuzzleViewController ()

// First column
@property (weak, nonatomic) IBOutlet UITextField *cell0;
@property (weak, nonatomic) IBOutlet UITextField *cell1;
@property (weak, nonatomic) IBOutlet UITextField *cell2;
@property (weak, nonatomic) IBOutlet UITextField *cell3;
@property (weak, nonatomic) IBOutlet UITextField *cell4;
@property (weak, nonatomic) IBOutlet UITextField *cell5;
@property (weak, nonatomic) IBOutlet UITextField *cell6;
@property (weak, nonatomic) IBOutlet UITextField *cell7;
@property (weak, nonatomic) IBOutlet UITextField *cell8;

// Second column
@property (weak, nonatomic) IBOutlet UITextField *cell9;
@property (weak, nonatomic) IBOutlet UITextField *cell10;
@property (weak, nonatomic) IBOutlet UITextField *cell11;
@property (weak, nonatomic) IBOutlet UITextField *cell12;
@property (weak, nonatomic) IBOutlet UITextField *cell13;
@property (weak, nonatomic) IBOutlet UITextField *cell14;
@property (weak, nonatomic) IBOutlet UITextField *cell15;
@property (weak, nonatomic) IBOutlet UITextField *cell16;
@property (weak, nonatomic) IBOutlet UITextField *cell17;

// Third column
@property (weak, nonatomic) IBOutlet UITextField *cell18;
@property (weak, nonatomic) IBOutlet UITextField *cell19;
@property (weak, nonatomic) IBOutlet UITextField *cell20;
@property (weak, nonatomic) IBOutlet UITextField *cell21;
@property (weak, nonatomic) IBOutlet UITextField *cell22;
@property (weak, nonatomic) IBOutlet UITextField *cell23;
@property (weak, nonatomic) IBOutlet UITextField *cell24;
@property (weak, nonatomic) IBOutlet UITextField *cell25;
@property (weak, nonatomic) IBOutlet UITextField *cell26;

// Fourth column
@property (weak, nonatomic) IBOutlet UITextField *cell27;
@property (weak, nonatomic) IBOutlet UITextField *cell28;
@property (weak, nonatomic) IBOutlet UITextField *cell29;
@property (weak, nonatomic) IBOutlet UITextField *cell30;
@property (weak, nonatomic) IBOutlet UITextField *cell31;
@property (weak, nonatomic) IBOutlet UITextField *cell32;
@property (weak, nonatomic) IBOutlet UITextField *cell33;
@property (weak, nonatomic) IBOutlet UITextField *cell34;
@property (weak, nonatomic) IBOutlet UITextField *cell35;

// Fifth column
@property (weak, nonatomic) IBOutlet UITextField *cell36;
@property (weak, nonatomic) IBOutlet UITextField *cell37;
@property (weak, nonatomic) IBOutlet UITextField *cell38;
@property (weak, nonatomic) IBOutlet UITextField *cell39;
@property (weak, nonatomic) IBOutlet UITextField *cell40;
@property (weak, nonatomic) IBOutlet UITextField *cell41;
@property (weak, nonatomic) IBOutlet UITextField *cell42;
@property (weak, nonatomic) IBOutlet UITextField *cell43;
@property (weak, nonatomic) IBOutlet UITextField *cell44;

// Sixth column
@property (weak, nonatomic) IBOutlet UITextField *cell45;
@property (weak, nonatomic) IBOutlet UITextField *cell46;
@property (weak, nonatomic) IBOutlet UITextField *cell47;
@property (weak, nonatomic) IBOutlet UITextField *cell48;
@property (weak, nonatomic) IBOutlet UITextField *cell49;
@property (weak, nonatomic) IBOutlet UITextField *cell50;
@property (weak, nonatomic) IBOutlet UITextField *cell51;
@property (weak, nonatomic) IBOutlet UITextField *cell52;
@property (weak, nonatomic) IBOutlet UITextField *cell53;

// Seventh column
@property (weak, nonatomic) IBOutlet UITextField *cell54;
@property (weak, nonatomic) IBOutlet UITextField *cell55;
@property (weak, nonatomic) IBOutlet UITextField *cell56;
@property (weak, nonatomic) IBOutlet UITextField *cell57;
@property (weak, nonatomic) IBOutlet UITextField *cell58;
@property (weak, nonatomic) IBOutlet UITextField *cell59;
@property (weak, nonatomic) IBOutlet UITextField *cell60;
@property (weak, nonatomic) IBOutlet UITextField *cell61;
@property (weak, nonatomic) IBOutlet UITextField *cell62;

// Eighth column
@property (weak, nonatomic) IBOutlet UITextField *cell63;
@property (weak, nonatomic) IBOutlet UITextField *cell64;
@property (weak, nonatomic) IBOutlet UITextField *cell65;
@property (weak, nonatomic) IBOutlet UITextField *cell66;
@property (weak, nonatomic) IBOutlet UITextField *cell67;
@property (weak, nonatomic) IBOutlet UITextField *cell68;
@property (weak, nonatomic) IBOutlet UITextField *cell69;
@property (weak, nonatomic) IBOutlet UITextField *cell70;
@property (weak, nonatomic) IBOutlet UITextField *cell71;

@property (weak, nonatomic) IBOutlet UITextField *cell72;
@property (weak, nonatomic) IBOutlet UITextField *cell73;
@property (weak, nonatomic) IBOutlet UITextField *cell74;
@property (weak, nonatomic) IBOutlet UITextField *cell75;
@property (weak, nonatomic) IBOutlet UITextField *cell76;
@property (weak, nonatomic) IBOutlet UITextField *cell77;
@property (weak, nonatomic) IBOutlet UITextField *cell78;
@property (weak, nonatomic) IBOutlet UITextField *cell79;
@property (weak, nonatomic) IBOutlet UITextField *cell80;

@property (strong, nonatomic) MCLSudokuPuzzle *puzzle;


// Solving method
- (IBAction)solvePuzzle:(id)sender;

- (void)loadPuzzle;
- (void)showSolution;



@end

@implementation MCLSudokuPuzzleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)solvePuzzle:(id)sender {
    // Load in the puzzle from the puzzle board
    [self loadPuzzle];
    
    // Solve the puzzle
    [self.puzzle solvePuzzle];
    
    // Display the puzzle on the puzzle board
    [self showSolution];
    
    // For debugging purposes
    NSLog(@"User puzzle is loaded and being printed from MCLSudokuPuzzle descriptor:\n%@\n",self.puzzle);
}

- (void)loadPuzzle {
    NSMutableArray *userPuzzle = [[NSMutableArray alloc] init];
    for (int i = 0; i < 81; i++) {
        // Create a selector for cell i
        NSString *selectorName = [NSString stringWithFormat:@"cell%d", i];
        
        // Create a pointer to the ith cell
        UITextField *aCell = [self performSelector:NSSelectorFromString(selectorName)];
        
        // Initialize a number formatter and format the cell text to a NSNumber
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        NSNumber *tempNumber = [formatter numberFromString: aCell.text];
        
        // Check whether there was a number in the cell or whether it was blank.
        // If there was a number, store it in the puzzle, otherwise set the ith
        // Puzzle entry to 0
        if (tempNumber) {
            [userPuzzle addObject:tempNumber];
        } else {
            [userPuzzle addObject:@0];
        }
    } // End i-loop
    
    if (!_puzzle) {
        _puzzle = [[MCLSudokuPuzzle alloc] initWithPuzzle:userPuzzle];
    }
}

- (void)showSolution {
    // Create copies of the puzzle and solution
    // The puzzle is only used to determine cell text coloring
    NSArray *puzzle = [[NSArray alloc] initWithArray:self.puzzle.puzzle copyItems:YES];
    NSMutableArray *solution = [[NSMutableArray alloc] initWithArray:self.puzzle.solution copyItems:YES];
    for (int i = 0; i < 81; i++) {
        // Create a selector for cell i
        NSString *selectorName = [NSString stringWithFormat:@"cell%d", i];
        
        // Create a pointer to the ith cell
        UITextField *aCell = [self performSelector:NSSelectorFromString(selectorName)];
        
        // Set cell text to solution[i]
        aCell.text = [NSString stringWithFormat:@"%@", solution[i]];
        
        if ([puzzle[i] isEqual:@0]) {
            // If the ith cell of the puzzle is 0, then it is part of the solution
            // Color it blue
            aCell.textColor = [UIColor blueColor];
        } else {
            // Otherwise, it was part of the original problem
            // Color it black
            aCell.textColor = [UIColor blackColor];
        }
    }
}

@end
