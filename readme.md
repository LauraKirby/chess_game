# Chess Game
It is the end of a chess game (human vs human), and only kings and pawns are left. Write a program that takes in a CSV file (from local file system) with the current positions of the pieces, e.g.:

king, white, d3 <br>
pawn, white, d4 <br>
king, black, b5 <br>
pawn, black, a4 <br>
pawn, black, c4 <br>

and then allows the players to legally move their pieces. You are only implementing the logic, not the UI. The only requirements are that there needs to be one exposed function that lets a player move his/her piece and another function to get the current state of the board.

Please don’t spend more than a couple hours on this. If there are features or edge cases that you don’t have time to include, take note of them, and we can discuss how you would tackle them afterward. Let me know if you have any questions.


# Approach
- Given the time constraints, I aimed to make problem (listed above) smaller by first solving for the "black pawn" located at "c4". While solving for the "black pawn" first, moved quickly with well tested code. As I begin working on other pieces, I will aim to continue a test driven approach while enhancing the structure, descriptive nature and dynamic pattern of the source code.

## Initial Steps
- read file
- create Pieces
- convert position to something that can be represented on x & y coordinates
- add ability for pawn to move
  - [x, y] = [column, row]
  - black: move forward [x, y] + [0, -1]
  - black: move diagonally
    - condition: if there is a piece in diagonal position
    - diagonal left: [x, y] + [-1, -1]
    - diagonal right: [x, y] + [1, -1]
  - white: move forward [x, y] + [0, 1]
  - white: move diagonally
    - condition: if there is a piece in diagonal position
    - diagonal left: [x, y] + [-1, 1]
    - diagonal right: [x, y] + [1, 1]
  - cannot move back or horizontally
  - cannot move forward if piece is in that position

# Run project
- clone project
- assuming you have bundler installed, run `bundle install` from root directory of project
  - run tests: `bundle exec rspec`
  - You can run the code without bundler but you may not be able to run the tests.
- run program: `ruby ./main.rb`
- see `Spec` directory for tests

# Move
- To move a piece: call `move` on an instance of `Board` and pass in the current board position of the piece (eg 'c4') and the new preferred board position (eg 'c3').

# To-do
- finish implementing logic described in "Initial Steps"
- add logic for white pawn, black king and white king
- re-factor method for placing pieces now that a method for calculating the list location from given coordinates exists. (See `find_list_position`)
- remove excessive `if` `else` statements and create new methods for logic
- add tests for entering a destination that is off the board (logic already exists)
- make code descriptive enough where notes would not be (or very minimally) needed
- make `add_piece` and `remove_piece` private methods, per instructions above
- Thoughts: 'Piece' could inherit from 'Square'

# Results
- Running the program with `ruby main.rb` and the tests with `bundle exec rspec` should result in the following:
<img width="949" alt="run_main" src="https://user-images.githubusercontent.com/7623147/30297335-51bdd788-96fc-11e7-9ee0-bb0039fe09a4.png">



