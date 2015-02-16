//
//  MCLSudokuPuzzleViewController.h
//  SudokuSolver
//
//  Created by Jeff Hajewski on 11/24/14.
//  Copyright (c) 2014 Monarch Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCLSudokuPuzzle.h"

@interface MCLSudokuPuzzleViewController : UIViewController

@property (strong, nonatomic) MCLSudokuPuzzle *puzzle;
@property (weak, nonatomic) IBOutlet UIProgressView *solutionProgressBar;

@end
