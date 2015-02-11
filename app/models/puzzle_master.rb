class PuzzleMaster
  def random_puzzle(user_id, difficulty_range = nil)
    puzzles_to_choose_from = User.find(user_id).unsolved_puzzles
    if difficulty_range
      puzzles_to_choose_from.select { |puzzle| puzzle.difficulty.between? difficulty_range.first, difficulty_range.last }
    else
      puzzles_to_choose_from.sample
    end
  end

  def create_viewing(puzzle_id, user_id)
    PuzzleView.create!(user_id: user_id, puzzle_id: puzzle_id, solved: false)
  end

  def check_answer(puzzle, guess)

  end
end