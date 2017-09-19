require 'csv'
require_relative './game'

class Board < Game

  attr_accessor :squares, :pieces, :piece

  def initialize(input=nil)
    @squares = create_board
    @reset = parse_input(input)
  end

  def add_piece(piece, color, board_location)
    piece_index = find_list_position(board_location)
    @squares[piece_index].piece = Piece.new(piece, color, board_location)
  end

  def remove_piece(board_location)
    piece_index = find_list_position(board_location)
    @squares[piece_index].piece = nil
  end

  def print_board
    count = 0
    @squares.each do |square|
      square.piece.nil? ? local_piece = " e " : local_piece = "#{square.piece.piece_name[0]}/#{square.piece.color[0]}"
      puts "\n \n"  if count % 8 == 0
      print " #{square.coordinates} : #{local_piece} --"
      count += 1
    end
  end

  def move(previous_board_location, new_board_location)
    # piece = nil
    previous_index = find_list_position(previous_board_location)
    new_index = find_list_position(new_board_location)
    new_coordinates = parse_position(new_board_location)
    previous_coordinates = parse_position(previous_board_location)

    piece = @squares[previous_index].piece

    # return 0 if piece == nil
    if piece == nil
      puts "no piece located at #{previous_board_location}"
      return 0
    end

    difference = find_distance(previous_coordinates, new_coordinates)

    # black pawn
    # forward
    if (difference == [0, -1]) && !piece_at_index?(new_index)
      update_piece_coordinates(piece, difference)
      update_squares_pieces(piece, previous_index, new_index)
      piece.current_position
    # diagonal right
    elsif (difference == [1, -1]) && piece_at_index?(new_index)
      piece_2 = piece_at_index(new_index)
      if piece_2.color != piece.color
        update_piece_coordinates(piece, difference)
        update_squares_pieces(piece, previous_index, new_index)
        piece.current_position
      else
        return 0
      end
    # diagonal left
    elsif (difference == [-1, -1]) && piece_at_index?(new_index)
      piece_2 = piece_at_index(new_index)
      if piece_2.color != piece.color
        update_piece_coordinates(piece, difference)
        update_squares_pieces(piece, previous_index, new_index)
        piece.current_position
      else
        return 0
      end
    else
      # puts "invalid move"
      return 0
    end
  end

  private

  def create_board
    new_board = []
    [*8.downto(1)].each do | row |
      (1..8).each do | column |
        new_board.push(Square.new(row, column))
      end
    end
    new_board
  end

  # to do: make more efficient by looking up
  # piece locations with: 8 * (8-y) + (x-1)
  def place_pieces(pieces)
    return [] if pieces.nil?
    pieces.each do |piece|
      count = 0
      for i in 0..63
        if piece.current_position == @squares[i].coordinates
          @squares[i].piece = piece
          count += 1
        elsif count > pieces.length
          break pieces
        end
      end
    end
    pieces
  end

end
