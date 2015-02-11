class CreatePuzzleViews < ActiveRecord::Migration
  def change
    create_table :puzzle_views do |t|
      t.references :user, index: true
      t.references :dryphtwords_puzzle, index: true
      t.boolean    :solved
      t.boolean    :received_hint
      t.boolean    :upvote
    end
    add_foreign_key :puzzle_views, :users
    add_foreign_key :puzzle_views, :dryphtwords_puzzles
  end
end
