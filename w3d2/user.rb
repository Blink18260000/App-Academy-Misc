require_relative 'row_model.rb'

class User < RowModel
  attr_accessor :id, :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_id(id)
    super(id, 'users', User)
  end

  def self.all
    super('users', User)
  end

  def save!
    hash = {'fname' => @fname, 'lname' => @lname, 'id' => @id}
    super(hash, 'users')
  end

  def self.find_by_name(fname, lname)
    results = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND
        lname = ?
    SQL
    results.map { |row| User.new(row) }.first
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end

  def folowed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    results = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        AVG(count)
      FROM
        (SELECT
          COUNT(*) count
        FROM
          question_likes
        JOIN
          users ON users.id = question_likes.user
        JOIN
          questions ON question_likes.question = questions.id
        WHERE
          questions.user = ?
        GROUP BY
          questions.id)
    SQL
    results[0].values.first || 0
  end
end
