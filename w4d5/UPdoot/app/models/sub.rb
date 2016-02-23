# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :moderator_id, presence: true
  before_save :fix_name

  belongs_to :moderator,
    foreign_key: :moderator_id,
    primary_key: :id,
    class_name: 'User'

  has_many :post_subs

  has_many :comments,
    through: :posts,
    source: :comments

  def fix_name
    self.title = self.title.titleize
  end
end
