class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true
  validates :password,format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  with_options presence: true do

    with_options format:  {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
      validates :last_name
      validates :first_name
    end
 
     with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :last_name_kana
      validates :first_name_kana
     end
 end

  has_many :items
  has_many :orders

end
