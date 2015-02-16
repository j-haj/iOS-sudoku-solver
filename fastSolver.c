#include <stdio.h>
#include <stdbool.h>

//---------------------//
// Function Prototypes //
//---------------------//

int *returnValidGuessesAtPosition(int);
int *recursivePuzzleSolver(int*, int);
bool isSolved(int*);
int *getEmptyIndices(int*);

//-----------//
// Main loop //
//-----------//
int main(int argc, char *argv[]) {
	// Main loop
	return 0;
}

//----------------------//
// Function Definitions //
//----------------------//
int *returnValidGuessesAtPosition(int position) {
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
	const int columnIndexListArray = { { 0,  1,  2,  3,  4,  5,  6,  7,  8  },
	                                   { 9,  10, 11, 12, 13, 14, 15, 16, 17 },
	                                   { 18, 19, 20, 21, 22, 23, 24, 25, 26 },
	                                   { 27, 28, 29, 30, 31, 32, 33, 34, 35 },
	                                   { 36, 37, 38, 39, 40, 41, 42, 43, 44 },
	                                   { 45, 46, 47, 48, 49, 50, 51, 52, 53 },
	                                   { 54, 55, 56, 57, 58, 59, 60, 61, 62 },
	                                   { 63, 64, 65, 66, 67, 68, 69, 70, 71 },
	                                   { 72, 73, 74, 75, 76, 77, 78, 79, 80 } };
    
    // Given a specific row, this array has the corresponding element indices
    // for the respective row
	const int rowIndexListArray = { {  0, 9,  18, 27, 36, 45, 54, 63, 72 },
	                                { 1, 10, 19, 28, 37, 46, 55, 64, 73 },
	                                { 2, 11, 20, 29, 38, 47, 56, 65, 74 },
	                                { 3, 12, 21, 30, 39, 48, 57, 66, 75 },
	                                { 4, 13, 22, 31, 40, 49, 58, 67, 76 },
	                                { 5, 14, 23, 32, 41, 50, 59, 68, 77 },
	                                { 6, 15, 24, 33, 42, 51, 60, 69, 78 },
	                                { 7, 16, 25, 34, 43, 52, 61, 70, 79 },
	                                { 8, 17, 26, 35, 44, 53, 62, 71, 80 } };
  
    // Given a specific block, this array has the corresponding element indices
    // for the respective block
	const int blockIndexListArray = { { 0,  1,  2,  9,  10, 11, 18, 19, 20 },
	                                  { 3,  4,  5,  12, 13, 14, 21, 22, 23 },
	                                  { 6,  7,  8,  15, 16, 17, 24, 25, 26 },
	                                  { 27, 28, 29, 36, 37, 38, 45, 46, 47 },
	                                  { 30, 31, 32, 39, 40, 41, 48, 49, 50 },
	                                  { 33, 34, 35, 42, 43, 44, 51, 52, 53 },
	                                  { 54, 55, 56, 63, 64, 65, 72, 73, 74 },
	                                  { 57, 58, 59, 66, 67, 68, 75, 76, 77 },
	                                  { 60, 61, 62, 69, 70, 71, 78, 79, 80 } };

	const int valueList = {1, 2, 3, 4, 5, 6, 7, 8, 9};

	for (int i = 0; i < count; ++i)
	{
		/* code */
	}
}