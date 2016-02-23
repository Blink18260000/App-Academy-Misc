require_relative 'row_model.rb'

class Reply < RowModel
  attr_accessor :id, :question, :parent_reply, :user, :body

  def initialize(options)
    @id = options['id']
    @question = options['question']
    @parent_reply = options['parent_reply']
    @user = options['user']
    @body = options['body']
  end

  def self.find_by_id(id)
    super(id, 'replies', Reply)
  end

  def self.all
    super('replies', Reply)
  end

  def save!
    hash = {'user' => @user, 'question' => @question, 'body' => @body, 'parent_reply' => @parent_reply, 'id' => @id}
    super(hash, 'replies')
  end

  def self.find_by_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user = ?
    SQL
    results.map { |row| Reply.new(row) }
  end

  def self.find_by_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question = ?
    SQL
    results.map { |row| Reply.new(row) }
  end

  def author
    User.find_by_id(@user)
  end

  def question
    Question.find_by_id(@question)
  end

  def parent_reply
    raise 'No parent' if @parent.nil?
    Reply.find_by_id(@parent)
  end

  def child_replies
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply = ?
    SQL
    results.map { |row| Reply.new(row) }
  end
end
