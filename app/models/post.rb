class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  has_one_attached :image  # ActiveStorageで画像アップロードする場合

  # 必要なら他の関連やバリデーションもここに書く
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user

  validates :title, presence: true
  validates :body, presence: true
end
