class PostSub < ActiveRecord::Base
  has_many :sub_id
  has_many :post_id
end
