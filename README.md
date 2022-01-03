# Connect-4
 Play connect-4 against AI


REPORT: Intelligent Game Playing Agent that can play the game "Connect Four"
Assignment 3
Carolyn McAughren
CSCI 479, Professor Huizhu Liu

COMPILATION AND EXECUTION:

   Application can be compiled by entering "make" and ran by "./main".
   Once the program is started it will prompt the user to enter
   a: for AI versus AI
   b: for AI versus RANDOM player
   c: for AI versus Human

MINIMAX AND ALPHA-BETA PRUNING ALGORITHMS:

   The minimax algorithm with alpha-beta pruning is implemented in functions:
   Alpha_Beta_Search(), Max_Value(), Min_Value() of class Game.
   This is the minimax algorithm with additional variables alpha and beta
   which are used to cut off the search. Alpha holds the value of the best
   (highest-value) choice found so far for MAX, and Beta holds the value of the
   best value (lowest-value) choice for MIN. The search updates these values as it
   proceeds through the actions (columns which have a space open for a marble)
   and if a utility value for a state is found to be worse than the known alpha and beta,
   that recursive branch is stopped.


EVALUATION FUNCTION:

   The utility() function of game class operates as an evaluation function.
   It considers each row, column, diagonal on the board in 4-square segments.
   It awards
      1,000,001 points for 4 marbles of the current Players
      -1,000,000 points for 4 marbles of the opponent Players
      10,000 points for 3 marbles of the current Players, along with 1 empty space
      -10,001 points for 3 marbles of the opposing Players, along with 1 empty space
      100 points for 2 marbles of the current Players, along with 2 empty spaces
      -101 points for 2 marbles of the opposing Players, along with 2 empty spaces
      0 points for segments with mixed marble types, or with only one marble.
   Utility function also considers tops[] array while calculating points,
   to ensure that it is not awarding points for
   segments with "holes". The empty space must be just above the last placed marble in a row,
   if it is an empty space with many empty spaces below it, that spot could not be filled by
   a marble yet, and so it is discounted.

   Utility value for a winning 4 marbles is weighted slightly higher than the opposing
   value for an opponents 4 marble win. This is to tell the AI agent to prioritize making
   a winning move over blocking an opponents winning move. For segments with less than 4
   marbles, the preference is given to blocking the opponent from making a longer segment,
   rather than increasing the size of current players segment.

BUGS:
None known.

COMMENTS:

   In the design and debugging of this application I made reference to the heuristics outlined
   in another connect-four playing agent which can be found at:
      https://github.com/stratzilla/connect-four/blob/master/README.md
      (last accessed, Oct 29 2021)
   From this example I learned that setting the Utility values offset by "1" helps the AI
   agent to play more competitively. Before implementing this, my AI versus AI games were ending
   before the board filled (it was missing opportunities), and for this reason I went looking
   for help to improve it.

   In the design of the Alpha_Beta_Search() functionality, I made heavy reference
   of the textbook psuedocode for this algorithm. It can be found on page 200, Chapter 6 of
   "Artificial Intelligence: A Modern Approach" 2021 edition.

