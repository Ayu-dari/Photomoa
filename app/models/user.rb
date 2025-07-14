class User < ApplicationRecord
  has_one_attached :avatar

  # お気に入り機能
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post

  # 投稿
  has_many :posts

  # 利用規約の仮想属性とバリデーション
  attr_accessor :terms
  validates :terms, acceptance: { accept: "1", message: "に同意してください" }

  # Deviseの認証
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
