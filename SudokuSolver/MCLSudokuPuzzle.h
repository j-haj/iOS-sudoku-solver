//
//  MCLSudokuPuzzle.h
//  SudokuSolver
//
//  Created by Jeff Hajewski on 11/21/14.
//  Copyright (c) 2014 Monarch Lags. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCLSudokuPuzzle : NSObject

@property (strong, nonatomic) NSMutableArray *puzzle;
@property (strong, nonatomic) NSMutableArray *solution;

// Designated initializer
- (instancetype)initWithPuzzle:(NSMutableArray *)puzzle andSolution:(NSMutableArray *)solution;
- (instancetype)initWithPuzzle:(NSMutableArray *)puzzle;

- (void)solvePuzzle;

@end
