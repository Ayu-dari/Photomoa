class Post < ApplicationRecord
  belongs_to :user

  # 必要なら他の関連やバリデーションもここに書く
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user
end
