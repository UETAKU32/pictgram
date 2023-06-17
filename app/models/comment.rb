class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :content, presence: true, length: { maximum: 100 }
  
  belongs_to :user
  belongs_to :topic
end
