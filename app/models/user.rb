class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true,format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/, message: "有効なアドレスを記入してください" }
  
  has_secure_password
  validates :password, length: { in: 8..32} ,format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "アルファベットと数字を1文字ずつ入れてください" }
  
  has_many :topics
end
