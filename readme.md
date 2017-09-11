# Chess Game
It is the end of a chess game (human vs human), and only kings and pawns are left. Write a program that takes in a CSV file (from local file system) with the current positions of the pieces, e.g.:

king, white, d3 <br>
pawn, white, d4 <br>
king, black, b5 <br>
pawn, black, a4 <br>
pawn, black, c4 <br>

and then allows the players to legally move their pieces. You are only implementing the logic, not the UI. The only requirements are that there needs to be one exposed function that lets a player move his/her piece and another function to get the current state of the board.

Please don’t spend more than a couple hours on this. If there are features or edge cases that you don’t have time to include, take note of them, and we can discuss how you would tackle them afterward. Let me know if you have any questions.


# Run project
- clone project
- assuming you have bundler installed, run `bundle install` from root directory of project
  - run tests: `bundle exec rspec`
  - You can run the code without bundler but you may not be able to run the tests.
- run program: `ruby ./main.rb`
- see `Spec` directory for tests

# To-do
- finish implementing logic described in `main.rb`
- create and implement logic for moving king
- 'Piece' could inherit from 'Square'
- Re-factor method for placing pieces now that calculation for coordinates exists
- update tests to test private methods

# Results
- Running the program with `ruby main.rb` and the tests with `bundle exec rspec` should result in the following:
<img width="927" alt="run_main" src="https://user-images.githubusercontent.com/7623147/30287262-43fec116-96d9-11e7-9e13-26102ad6d42f.png">

