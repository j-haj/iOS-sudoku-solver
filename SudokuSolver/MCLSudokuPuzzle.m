//
//  MCLSudokuPuzzle.m
//  SudokuSolver
//
//  Created by Jeff Hajewski on 11/21/14.
//  Copyright (c) 2014 Monarch Labs. All rights reserved.
//

/*!
   @class MCLSudokuPuzzle
 
  Sudoku puzzles are stored in column-major order as one long vector.
  This means that as you look at a Sudoku puzzle and index the cells,
  starting from the upper left corner of the puzzle, the indices increase
  as you follow each column down. When you reach the bottom of a column,
  the next index is the top row of the next column. Below is a diagram of
  a puzzle and its cell index layout:
 
  [0][ 9][18][27][36][45][54][63][72]
 
  [1][10][19][28][37][46][55][64][73]
 
  [2][11][20][29][38][47][56][65][74]
 
  [3][12][21][30][39][48][57][66][75]
 
  [4][13][22][31][40][49][58][67][76]
 
  [5][14][23][32][41][50][59][68][77]
 
  [6][15][24][33][42][51][60][69][78]
 
  [7][16][25][34][43][52][61][70][79]
 
  [8][17][26][35][44][53][62][71][80]
 
 
  A puzzle is decomposed into 9 3x3 blocks (referred to as indexBlocks in
  the class) and are labeled as follows:
 
  [0][0][0][3][3][3][6][6][6]
 
  [0][0][0][3][3][3][6][6][6]
 
  [0][0][0][3][3][3][6][6][6]
 
  [1][1][1][4][4][4][7][7][7]
 
  [1][1][1][4][4][4][7][7][7]
 
  [1][1][1][4][4][4][7][7][7]
 
  [2][2][2][5][5][5][8][8][8]
 
  [2][2][2][5][5][5][8][8][8]
 
  [2][2][2][5][5][5][8][8][8]
 
 
  When storing a puzzle, the value 0 denotes an unknown value.
 
  @abstract Class that handles puzzle storage and solving implementations
 */

#import "MCLSudokuPuzzle.h"

@interface MCLSudokuPuzzle ()

/*!
    @brief Recursive solver for sudoku puzzle
    @function recursivelySolvePuzzleWithPositionList:atRecursionDepth:
    @param positionList NSArray that holds the positions of empty cells
    @param recursionDepth int that tracks the depth of the recursion
 */
- (NSMutableArray *)recursivelySolvePuzzleWithPositionList: (NSArray *)positionList
                           atRecursionDepth:(int)recursionDepth;

/*!
    @brief Returns a NSArray of valid guesses for the specified position
    @function returnValidGuessesAtPosition
    @param position the current position within the puzzle
 */
- (NSArray *)returnValidGuessesAtPosition: (int)position;

@end

@implementation MCLSudokuPuzzle

#pragma mark - Initializers

- (instancetype)initWithPuzzle:(NSMutableArray *)puzzle andSolution:(NSMutableArray *)solution
{
    // Call superclass init
    if  (self = [super init]) {
        _puzzle = puzzle;
        _solution = solution;
    }
    
    return self;
}

- (instancetype)initWithPuzzle:(NSMutableArray *)puzzle
{
    NSMutableArray *solution = [[NSMutableArray alloc] initWithArray:puzzle];
    return [[MCLSudokuPuzzle alloc] initWithPuzzle:puzzle andSolution:solution];
}

- (instancetype)init
{
    NSMutableArray *puzzle = [[NSMutableArray alloc] init];
    NSMutableArray *solution = [[NSMutableArray alloc] init];
    return [[MCLSudokuPuzzle alloc] initWithPuzzle:puzzle andSolution:solution];
}

#pragma mark - Solver tools

// Returns an array of valid guesses
- (NSArray *)returnValidGuessesAtPosition: (int)position
{
    // This array uses the current position to determine which
    // block corresponds to the current position
    const int blockArray[] = { 0, 0, 0, 1, 1, 1, 2, 2, 2,
                               0, 0, 0, 1, 1, 1, 2, 2, 2,
                               0, 0, 0, 1, 1, 1, 2, 2, 2,
                               3, 3, 3, 4, 4, 4, 5, 5, 5,
                               3, 3, 3, 4, 4, 4, 5, 5, 5,
                               3, 3, 3, 4, 4, 4, 5, 5, 5,
                               6, 6, 6, 7, 7, 7, 8, 8, 8,
                               6, 6, 6, 7, 7, 7, 8, 8, 8,
                               6, 6, 6, 7, 7, 7, 8, 8, 8 };
    
    // This array uses the current position to determine
    // which column corresponds to the current position
    const int colArray[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0,
                             1, 1, 1, 1, 1, 1, 1, 1, 1,
                             2, 2, 2, 2, 2, 2, 2, 2, 2,
                             3, 3, 3, 3, 3, 3, 3, 3, 3,
                             4, 4, 4, 4, 4, 4, 4, 4, 4,
                             5, 5, 5, 5, 5, 5, 5, 5, 5,
                             6, 6, 6, 6, 6, 6, 6, 6, 6,
                             7, 7, 7, 7, 7, 7, 7, 7, 7,
                             8, 8, 8, 8, 8, 8, 8, 8, 8 };
    
    // This array uses the current position to determine
    // which row corresponds to the current position
    const int rowArray[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8,
                             0, 1, 2, 3, 4, 5, 6, 7, 8,
                             0, 1, 2, 3, 4, 5, 6, 7, 8,
                             0, 1, 2, 3, 4, 5, 6, 7, 8,
                             0, 1, 2, 3, 4, 5, 6, 7, 8,
                             0, 1, 2, 3, 4, 5, 6, 7, 8,
                             0, 1, 2, 3, 4, 5, 6, 7, 8,
                             0, 1, 2, 3, 4, 5, 6, 7, 8,
                             0, 1, 2, 3, 4, 5, 6, 7, 8 };
    
    // Given a specific column, this array has the corresponding element indices
    // for the respective column
    NSArray *columnIndexListArray = @[ @[ @0,  @1,  @2,  @3,  @4,  @5,  @6,  @7,  @8 ],
                                       @[ @9,  @10, @11, @12, @13, @14, @15, @16, @17 ],
                                       @[ @18, @19, @20, @21, @22, @23, @24, @25, @26 ],
                                       @[ @27, @28, @29, @30, @31, @32, @33, @34, @35 ],
                                       @[ @36, @37, @38, @39, @40, @41, @42, @43, @44 ],
                                       @[ @45, @46, @47, @48, @49, @50, @51, @52, @53 ],
                                       @[ @54, @55, @56, @57, @58, @59, @60, @61, @62 ],
                                       @[ @63, @64, @65, @66, @67, @68, @69, @70, @71 ],
                                       @[ @72, @73, @74, @75, @76, @77, @78, @79, @80 ] ];
    
    // Given a specific row, this array has the corresponding element indices
    // for the respective row
    NSArray *rowIndexListArray = @[ @[ @0, @9,  @18, @27, @36, @45, @54, @63, @72] ,
                                    @[ @1, @10, @19, @28, @37, @46, @55, @64, @73 ],
                                    @[ @2, @11, @20, @29, @38, @47, @56, @65, @74 ],
                                    @[ @3, @12, @21, @30, @39, @48, @57, @66, @75 ],
                                    @[ @4, @13, @22, @31, @40, @49, @58, @67, @76 ],
                                    @[ @5, @14, @23, @32, @41, @50, @59, @68, @77 ],
                                    @[ @6, @15, @24, @33, @42, @51, @60, @69, @78 ],
                                    @[ @7, @16, @25, @34, @43, @52, @61, @70, @79 ],
                                    @[ @8, @17, @26, @35, @44, @53, @62, @71, @80 ] ];
  
    // Given a specific block, this array has the corresponding element indices
    // for the respective block
    NSArray *blockIndexListArray = @[ @[ @0,  @1,  @2,  @9,  @10, @11, @18, @19, @20 ],
                                      @[ @3,  @4,  @5,  @12, @13, @14, @21, @22, @23 ],
                                      @[ @6,  @7,  @8,  @15, @16, @17, @24, @25, @26 ],
                                      @[ @27, @28, @29, @36, @37, @38, @45, @46, @47 ],
                                      @[ @30, @31, @32, @39, @40, @41, @48, @49, @50 ],
                                      @[ @33, @34, @35, @42, @43, @44, @51, @52, @53 ],
                                      @[ @54, @55, @56, @63, @64, @65, @72, @73, @74 ],
                                      @[ @57, @58, @59, @66, @67, @68, @75, @76, @77 ],
                                      @[ @60, @61, @62, @69, @70, @71, @78, @79, @80 ] ];
    
    // List of possible values for a Sudoku puzzle square
    NSArray *valueList = @[ @1, @2, @3, @4, @5, @6, @7, @8, @9 ];

    // Get indicex arrays of column, row, and block elements
    NSArray *colIndexList = [[NSArray alloc] initWithArray:columnIndexListArray[colArray[position]] copyItems:YES];
    NSArray *rowIndexList = [[NSArray alloc] initWithArray:rowIndexListArray[rowArray[position]] copyItems:YES];
    NSArray *blockIndexList = [[NSArray alloc] initWithArray:blockIndexListArray[blockArray[position]] copyItems:YES];
    
    // Create arrays that contain column, row, and block elements using
    // the indices found in the preceding step
    NSMutableArray *columnValues = [[NSMutableArray alloc] init];
    for ( id e in colIndexList ) {
        [columnValues addObject:[self.solution objectAtIndex:[e intValue]]];
    }
    NSMutableArray *rowValues = [[NSMutableArray alloc] init];
    for ( id e in rowIndexList ) {
        [rowValues addObject:[self.solution objectAtIndex:[e intValue]]];
    }
    NSMutableArray *blockValues = [[NSMutableArray alloc] init];
    for ( id e in blockIndexList ) {
        [blockValues addObject:[self.solution objectAtIndex:[e intValue]]];
    }
 
    // Create a list of valid guesses
    NSMutableArray *validGuesses = [[NSMutableArray alloc] init];
    for (id e in valueList) {
        if (![columnValues containsObject:e] && ![rowValues containsObject:e] &&
            ![blockValues containsObject:e]) {
            [validGuesses addObject:e];
        }
    }
    return validGuesses;
}

/*
 * Find Sudoku puzzle solution using recursion. This algorithm determines a list
 * of possible guesses for a given puzzle position and picks one of the guesses.
 * It then calls itself on the newly formed puzzle (old puzzle + new guess).
 * This process is repeated until either the puzzle is solved or there are no
 * more guesses. If there are no more valid guesses, the solver drops back a
 * recursion levels until it finds a new valid guess.
 */
//TODO: Consider making this a Las Vegas algorithm
- (NSMutableArray *)recursivelySolvePuzzleWithPositionList: (NSArray *)positionList
                                          atRecursionDepth:(int)recursionDepth
{
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    if (self.isSolved) {
        return self.solution;
    } else {
        NSArray *guessList = [self returnValidGuessesAtPosition:[positionList[recursionDepth] intValue]];
        if ([guessList count] == 0) {
            return self.solution;
        }
        
        for ( id guess in guessList ) {
            [self.solution setObject:guess atIndexedSubscript:[positionList[recursionDepth] intValue]];
            
            [self.solution setArray:[self recursivelySolvePuzzleWithPositionList:positionList atRecursionDepth:(recursionDepth + 1)]];
            
            // Send notification for new guess added to the puzzle
            [notification postNotificationName:@"solutionProgressIncrementer"
                                        object:self
                                      userInfo:nil];
            
            if (self.isSolved) {
                return self.solution;
            } else {
                [self.solution setObject:@0 atIndexedSubscript:[positionList[recursionDepth] intValue]];
            }
        }
        [notification postNotificationName:@"solutionProgressIncrementer"
                                    object:self
                                  userInfo:nil];
        return self.solution;
    }
}

// This is the actual method that is called by a MCLSudokuPuzzle object
- (void)solvePuzzle
{
    [self.solution setArray:[self.puzzle copy]];
    NSMutableArray *posList = [[NSMutableArray alloc] init];
    for (int i = 0; i < 81; i++) {
        if ( [[self.puzzle objectAtIndex:i] isEqual:@0] ) {
            [posList addObject:[NSNumber numberWithInt:i]];
        }
    }
    
    [self.solution setArray:[self recursivelySolvePuzzleWithPositionList:posList
                                                        atRecursionDepth:0]];
}

// Returns a bool stating the solution state of a Sudoku puzzle
- (BOOL)isSolved {
    if ([self.solution containsObject:@0]) {
        return false;
    }
    
    return true;
}
/**
 * Returns an array containing the indices of the empty Sudoku cells
 */
 - (NSArray *)getEmptyIndices {
    NSMutableArray *emptyIndexArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 81; i++) {
        if (self.puzzle[i] == 0) {
            [emptyIndexArray addObject:self.puzzle[i]];
        }
    }
    
    // Return immutable copy
    return [emptyIndexArray copy];
}

/**
 *Custom description method. MCLSudokuPuzzle descriptions are of the form:
 * Puzzle:
 * <puzzle array>
 * Solution:
 * <solution array>
 */
- (NSString *)description
{
    NSString *puzzleString = [[NSString alloc] init];
    NSString *solutionString = [[NSString alloc] init];
    
    for (int i = 0; i < 81; i++) {
        puzzleString = [puzzleString stringByAppendingString:[NSString stringWithFormat:@"%d, ", [self.puzzle[i] intValue]]];
        solutionString = [solutionString stringByAppendingString:[NSString stringWithFormat:@"%d, ", [self.solution[i] intValue]]];
    }
    
    NSString *descriptionString = [NSString stringWithFormat:@"Puzzle:\n%@\nSolution:\n%@", puzzleString, solutionString];
    
    return descriptionString;
}

@end
