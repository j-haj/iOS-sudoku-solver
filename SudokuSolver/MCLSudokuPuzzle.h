//
//  MCLSudokuPuzzle.h
//  SudokuSolver
//
//  Created by Jeff Hajewski on 11/21/14.
//  Copyright (c) 2014 Monarch Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCLSudokuPuzzle : NSObject

/*! @brief NSMutableArray that stores the sudoku puzzle */
@property (strong, nonatomic) NSMutableArray *puzzle;

/*! @brief NSMutableArray that stores the solution to sudoku puzzle */
@property (strong, nonatomic) NSMutableArray *solution;

/*!
    @brief Designated initializer
    @function initWithPuzzle:andSolution:
    @param puzzle NSMutableArray that sets the puzzle property
    @param solution NSMutableArray that sets the solution property
 */
- (instancetype)initWithPuzzle:(NSMutableArray *)puzzle andSolution:(NSMutableArray *)solution;

/*!
    @brief Initializer - sets the puzzle property but not the solution property
    @function initWithPuzzle:
    @param puzzle NSMutableArray that sets the puzzle property
 */
- (instancetype)initWithPuzzle:(NSMutableArray *)puzzle;

/*!
    @brief Solves the object puzzle
    @function solvePuzzle
 */
- (void)solvePuzzle;

/*!
    @brief Checks if the object puzzle has been solved, returns BOOL
    @function isSolved
 */
- (BOOL)isSolved;
@end
