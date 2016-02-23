require_relative 'row_model.rb'

class QuestionLike < RowModel
  attr_accessor :id, :user, :question

  def initialize(options)
    @id = options['id']
    @user = options['user']
    @question = options['question']
  end

  def self.find_by_id(id)
    super(id, 'question_likes', QuestionLike)
  end

  def self.all
    super('question_likes', QuestionLike)
  end

  def save!
    hash = {'user' => @user, 'question' => @question, 'id' => @id}
    super(hash, 'question_likes')
  end

  def self.likers_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_likes
      JOIN
        users ON users.id = question_likes.user
      WHERE
        question_likes.question = ?
    SQL
    results.map { |row| User.new(row) }
  end

  def self.num_likes_for_question_id(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*)
      FROM
        question_likes
      WHERE
        question = ?
    SQL
    result.first.values.first

  end

  def self.liked_questions_for_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_likes
      JOIN
        users ON users.id = question_likes.user
      JOIN
        questions ON question_likes.question = questions.id
      WHERE
        users.id = ?
    SQL
    results.map { |row| Question.new(row) }
  end

  def self.most_liked_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        question_likes
      JOIN
        questions ON questions.id = question_likes.question
      GROUP BY
        questions.id
      LIMIT
        ?
    SQL
    results.map { |row| Question.new(row) }
  end
end
