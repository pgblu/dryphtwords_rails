class User < ActiveRecord::Base
  has_many :created_puzzles, class_name: "DryphtwordsPuzzle", foreign_key: :creator_id
  has_many :puzzle_views
  has_many :viewed_puzzles, through: :puzzle_views, source: :puzzle

  has_secure_password

  validates :handle, uniqueness: :true

  # def password
  #   @password = BCrypt::Password.new(self.password_hash)
  # end

  # def password= (other)
  #   @password = BCrypt::Password.create(other)
  #   self.password_hash = @password
  # end

  # def self.authenticate(handle, password_attempt)
  #   user = find_by(handle: handle)
  #   if user && user.password == password_attempt
  #     return user
  #   end
  # end

  def solved_puzzles
    solved_views = PuzzleView.all.select {|view| view.solved && view.user_id == self.id }
    solved_views.map { |view| view.puzzle }
  end

  def unsolved_puzzles
    DryphtwordsPuzzle.all - solved_puzzles
  end

  def score
    solved_puzzles.map {|puzz| puzz.difficulty }.reduce(:+)
  end

  def average_difficulty
    score.to_f / solved_puzzles.count
  end
end
