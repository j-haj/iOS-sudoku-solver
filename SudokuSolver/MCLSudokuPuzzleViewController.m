//
//  MCLSudokuPuzzleViewController.m
//  SudokuSolver
//
//  Created by Jeff Hajewski on 11/24/14.
//  Copyright (c) 2014 Monarch Labs. All rights reserved.
//

#import "MCLSudokuPuzzleViewController.h"

@interface MCLSudokuPuzzleViewController ()

/*
 * Quick and dirty way to get the interface up and running
 * but not the final design. The final UI will likely
 * subclass UIView so that each cell can show the current
 * guess as well as potential guesses. This also shortens
 * this class as we can generate the 81 subview programmatically
 */

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

// Ninth column
@property (weak, nonatomic) IBOutlet UITextField *cell72;
@property (weak, nonatomic) IBOutlet UITextField *cell73;
@property (weak, nonatomic) IBOutlet UITextField *cell74;
@property (weak, nonatomic) IBOutlet UITextField *cell75;
@property (weak, nonatomic) IBOutlet UITextField *cell76;
@property (weak, nonatomic) IBOutlet UITextField *cell77;
@property (weak, nonatomic) IBOutlet UITextField *cell78;
@property (weak, nonatomic) IBOutlet UITextField *cell79;
@property (weak, nonatomic) IBOutlet UITextField *cell80;


@property (weak, nonatomic) IBOutlet UIProgressView *puzzleProgressBar;

@property CGFloat solutionProgress;

// Solving method
- (IBAction)solvePuzzle:(id)sender;
- (IBAction)visualSolvePuzzle:(id)sender;
- (IBAction)tapRegistered:(id)sender;
- (IBAction)swipeDownRegistered:(id)sender;

- (void)loadPuzzle;
- (void)showSolution;
- (void)showPuzzle;

// Clear board contents and reset font color to black
- (IBAction)clearPuzzle:(id)sender;




@end


#pragma mark - Implementation

@implementation MCLSudokuPuzzleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _solutionProgress = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    [super observeValueForKeyPath:keyPath
                         ofObject:object
                           change:change
                          context:context];
    NSLog(@"%@\n", self.puzzle.solution);
    [self showSolution];
}

- (IBAction)solvePuzzle:(id)sender {
    // Load in the puzzle from the puzzle board
    [self loadPuzzle];
    
    // Solve the puzzle in the background
    [self.puzzle solvePuzzle];
    
    // Display the puzzle on the puzzle board
    [self showSolution];
}

/**
 * Shows solution progress on screen while the puzzle is being solved
 */
- (IBAction)visualSolvePuzzle:(id)sender {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receivePuzzleProgressNotification)
                                                 name:@"solutionProgressIncrementer"
                                               object:nil];
    [self loadPuzzle];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(void){
        [self.puzzle solvePuzzle];
        NSLog(@"Puzzle solved. Removing observer....\n");
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        
    });
    [self showSolution];
}

- (IBAction)tapRegistered:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)swipeDownRegistered:(id)sender {
    [self.view endEditing:YES];
}

- (void)loadPuzzle {
    
    NSMutableArray *userPuzzle = [[NSMutableArray alloc] init];
    for (int i = 0; i < 81; i++) {
        // Create a selector for cell i
        NSString *cellName = [NSString stringWithFormat:@"cell%d", i];

        
        // Initialize a number formatter and format the cell text to a NSNumber
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        NSNumber *tempNumber = [formatter numberFromString:[self valueForKeyPath:[NSString stringWithFormat:@"%@.text", cellName]]];
        
        // Check whether there was a number in the cell or whether it was blank.
        // If there was a number, store it in the puzzle, otherwise set the ith
        // Puzzle entry to 0
        if (tempNumber) {
            [userPuzzle addObject:tempNumber];
        } else {
            [userPuzzle addObject:@0];
        }
    } // End i-loop
    
    self.puzzle = [[MCLSudokuPuzzle alloc] initWithPuzzle:userPuzzle];
    self.solutionProgress = 81 - [self countZeros];
}

- (void)showSolution {
    // Create copies of the puzzle and solution
    // The puzzle is only used to determine cell text coloring
    for (int i = 0; i < 81; i++) {
        // Create a string containing the name for cell i
        NSString *cellName = [NSString stringWithFormat:@"cell%d", i];
        
        // Set cell text to solution[i]
        NSString *cellText = [self.puzzle.solution[i] isEqual:@0] ? [NSString stringWithFormat:@""] : [NSString stringWithFormat:@"%@", self.puzzle.solution[i]];
        [self setValue:[NSString stringWithFormat:@"%@", cellText] forKeyPath:[NSString stringWithFormat:@"%@.text", cellName]];
        
        if ([self.puzzle.puzzle[i] isEqual:@0]) {
            // If the ith cell of the puzzle is 0, then it is part of the solution
            // Color it blue
            [self setValue:[UIColor blackColor] forKeyPath:[NSString stringWithFormat:@"%@.textColor", cellName]];
        } else {
            // Otherwise, it was part of the original problem
            // Color it black
            [self setValue:[UIColor whiteColor] forKeyPath:[NSString stringWithFormat:@"%@.textColor", cellName]];
            [self setValue:[UIColor grayColor] forKeyPath:[NSString stringWithFormat:@"%@.backgroundColor", cellName]];
        }
    }
}

- (void)showPuzzle {
    for (int i = 0; i < 81; i++) {
        // Create a string containing the name for cell i
        NSString *cellName = [NSString stringWithFormat:@"cell%d", i];
        NSString *cellText = [self.puzzle.solution[i] isEqual:@0] ? [NSString stringWithFormat:@""] : [NSString stringWithFormat:@"%@", self.puzzle.solution[i]];;
        // Set cell text to puzzle[i]
        if ([self.puzzle.puzzle[i] isEqual:@0]) {
            cellText = @"";
        }
        [self setValue:[NSString stringWithFormat:@"%@", cellText] forKeyPath:[NSString stringWithFormat:@"%@.text", cellName]];
        
        if ([self.puzzle.puzzle[i] isEqual:@0]) {
            // If the ith cell of the puzzle is 0, then it is part of the solution
            // Color it blue
            [self setValue:[UIColor blackColor] forKeyPath:[NSString stringWithFormat:@"%@.textColor", cellName]];
        } else {
            // Otherwise, it was part of the original problem
            // Color it black
            [self setValue:[UIColor blackColor] forKeyPath:[NSString stringWithFormat:@"%@.textColor", cellName]];
        }
    }
}

- (IBAction)clearPuzzle:(id)sender {
    [self.puzzleProgressBar setProgress:0.0f animated:YES];
    for (int i = 0; i < 81; i++) {
        // Create a selector for cell i
        NSString *cellName = [NSString stringWithFormat:@"cell%d", i];
        
        // Create a pointer to the ith cell
        //UITextField *aCell = [self performSelector:NSSelectorFromString(selectorName)];
        
        // Set cell text to solution[i]
        //aCell.textColor = [UIColor blackColor];
        [self setValue:[UIColor blackColor]
            forKeyPath:[NSString stringWithFormat:@"%@.textColor", cellName]];
        [self setValue:@""
            forKeyPath:[NSString stringWithFormat:@"%@.text", cellName]];
        [self setValue:[UIColor whiteColor]
            forKeyPath:[NSString stringWithFormat:@"%@.backgroundColor", cellName]];
        //[aCell setText:@""];
    }
    NSLog(@"Finished clearPuzzle for-loop\n");
}

- (void)receivePuzzleProgressNotification {
    dispatch_async(dispatch_get_main_queue(), ^(void){
        self.solutionProgress = 81 - [self countZeros];
        [self.puzzleProgressBar setProgress:self.solutionProgress animated:YES];
        [self showSolution];
    });
}

- (CGFloat)countZeros {
    CGFloat counter = 0;
    for (int i = 0; i < 81; i++) {
        if ([self.puzzle.solution[i] isEqual:@0]) {
            counter++;
        }
    }
    return counter;
}
@end
