class User < ApplicationRecord
  has_one_attached :avatar
  # 仮想属性としてtermsを扱う（DBにはない）
  attr_accessor :terms

  # 利用規約チェックが必須なバリデーション
  validates :terms, acceptance: { accept: "1", message: "に同意してください" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
