require '/app/helpers/parser_helper'


User.create!(
  handle:   "ChafingDish",
  password: "secret"
  )
43.times do
  num = rand(3) + 2
  User.create!(
    handle: Faker::Lorem.words(num).map {|word| word.capitalize}.join(""),
    password: "password"
    )
end

parser = Parser.new
# Turn the source file into many puzzles
string_of_puzzles = IO.read(parser.source)
array_of_puzzles = string_of_puzzles.split("\n\n")
array_of_puzzles.each do |puzzle|
  clues, _, solutions = puzzle.partition(";")
  clues.gsub!("\n",",")
  solutions = solutions.split(" ").each(&:strip!).join(",")
  diff = parser.difficulty(clues.split(","))
  DryphtwordsPuzzle.create!(
    clue_string:     clues.downcase,
    solution_string: solutions,
    difficulty:      diff,
    creator_id:      (1..44).to_a.sample
    )
end

dwg = DryphtwordsPuzzle.all.count

User.all.each do |user|
  unless user.id == 1
    num = rand(21) + 11
    (1..dwg).to_a.sample(num).each do |num|
      PuzzleView.create!(
        user_id:       user.id,
        puzzle_id:     num,
        solved:        [true, false, false, false].sample,
        received_hint: [true, false].sample,
        upvote:        [true, true, false, false, false, false, false].sample
        )
    end
  end
end