require_relative 'row_model.rb'

class QuestionFollow < RowModel
  attr_accessor :id, :question, :user

  def initialize(options)
    @id = options['id']
    @question = options['question']
    @user = options['user']
  end

  def self.find_by_id(id)
    super(id, 'question_follows', QuestionFollow)
  end

  def self.all
    super('question_follows', QuestionFollow)
  end

  def save!
    hash = {'question' => @question, 'user' => @user, 'id' => @id}
    super(hash, 'question_follows')
  end

  def self.followers_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        users ON users.id = question_follows.user
      WHERE
        question = ?
    SQL
    results.map { |row| User.new(row) }
  end

  def self.followed_questions_for_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows f
      JOIN
        questions ON questions.id = f.question
      WHERE
        f.user = ?
    SQL
    results.map { |row| Question.new(row) }
  end

  def self.most_followed_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        question_follows f
      JOIN
        questions ON questions.id = f.question
      GROUP BY
        f.question
      ORDER BY
        COUNT(f.question) DESC
      LIMIT
        ?
    SQL
    results.map { |row| Question.new(row) }
  end
end
