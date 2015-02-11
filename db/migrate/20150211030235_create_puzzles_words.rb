class CreatePuzzlesWords < ActiveRecord::Migration
  def change
    create_table :puzzles_words do |t|
      t.references :word
      t.references :dryphtwords_puzzle
    end
  end
end
