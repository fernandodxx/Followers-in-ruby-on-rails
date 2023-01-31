class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Isso acessa o objeto de relacionamento
  has_many :followed_users,
           foreign_key: :follower_id,
           class_name: 'Relationship',
           dependent: :destroy

  # Isso acessa o usuário através do objeto de relacionamento
  has_many :followees, through: :followed_users, dependent: :destroy
  
  # Isso acessa o objeto de relacionamento
  has_many :following_users,
           foreign_key: :followee_id,
           class_name: 'Relationship',
           dependent: :destroy
  
  # Isso acessa o usuario atraves do objeto relacinamento 
  has_many :followers, through: :following_users, dependent: :destroy
end
