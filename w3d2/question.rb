require_relative 'row_model.rb'

class Question < RowModel
  attr_accessor :id, :title, :body, :user

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user = options['user']
    # @id, @title = options.values_at('id', 'title')
  end

  def self.find_by_id(id)
    super(id, 'questions', Question)
  end

  def self.all
    super('questions', Question)
  end

  def save!
    hash = {'title' => @title, 'body' => @body, 'user' => @user, 'id' => @id}
    super(hash, 'questions')
  end

  def self.find_by_author_id(author_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user = ?
    SQL
    results.map { |row| Question.new(row) }
  end

  def author
    User.find_by_id(@user)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end
end
