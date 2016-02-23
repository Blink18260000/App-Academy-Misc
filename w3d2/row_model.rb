require 'byebug'

class RowModel
  def self.find_by_id(id, table, ruby_class)
    el = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = ?
    SQL
    return ruby_class.new(el.first) unless el.empty?
    raise "No such id"
  end

  def self.all(table, ruby_class)
    el = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table}
    SQL
    unless el.empty?
      el.map do |row|
        ruby_class.new(row)
      end
    else
      raise "Empty table"
    end
  end

  def save!(object_info, table_name)

    to_save = object_info.length
    raise 'Invalid case' if to_save == 0
    unless object_info['id']

      string = "("
      string += object_info.keys[0..-2].join(", ")
      string += ")"

      QuestionsDatabase.instance.execute(<<-SQL, *object_info.values[0..-2])
        INSERT INTO
          #{table_name} #{string}
        VALUES
          (#{"?, " * (to_save - 2) + "?"})
      SQL

      @id = QuestionsDatabase.instance.last_insert_row_id
      self

    else

      string = object_info.keys[0..-2].join(" = ?, ")
      string += " = ?"

      QuestionsDatabase.instance.execute(<<-SQL, *object_info.values)
        UPDATE
          #{table_name}
        SET
          #{string}
        WHERE
          id = ?
      SQL
      self
    end

  rescue
    return "FUCK YOU IT DIDN'T WORK"
  end
end
