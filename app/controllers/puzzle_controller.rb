class PuzzleController
  def show
    @puzzle = DryphtwordsPuzzle.find_by(id: params[:id])
    @pm.create_viewing(@puzzle.id, session[:user_id])
    @count = 10
    @demo = "yes"
    if @puzzle
      render 'puzzles/show'
    else
      @messages << "No puzzle with that ID. Here's a random puzzle!"
      @puzzle = @pm.random_puzzle
      render 'puzzles/show'
    end
  end
end

def guess
  puzzle = DryphtwordsPuzzle.find(params[:id])
  view = PuzzleView.find_by(user_id: session[:user_id], puzzle_id: params[:id])
  target_words = puzzle.solution_words.map { |wordlist| wordlist.first }
  if target_words.include? params[:guess]
    view.update_attributes(solved: true)
    render json: {tint: "11EE11", result: "correct"}
  else
    render json: {tint: "EE1111", result: "incorrect"}
  end
end
