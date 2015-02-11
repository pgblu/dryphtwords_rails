class CreateDryphtwordsPuzzles < ActiveRecord::Migration
  def change
    create_table :dryphtwords_puzzles do |t|
      t.string  :clue_string
      t.string  :solution_string
      t.integer :difficulty
      t.integer :creator_id
      t.string  :hint_url
      t.timestamps
    end
  end
end
