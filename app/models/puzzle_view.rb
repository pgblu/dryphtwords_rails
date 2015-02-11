class PuzzleView < ActiveRecord::Base
  belongs_to :puzzle, class_name: "DryphtwordsPuzzle"
  belongs_to :user
end
