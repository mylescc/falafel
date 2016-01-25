class User < ActiveRecord::Base
  extend Forwardable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  delegate [:name] => :personal_detail

  has_one :personal_detail, foreign_key: :user_id
  has_many :roles, foreign_key: :user_id
  has_many :user_competencies
  has_many :references
  has_one :video_statement
  has_many :user_experience_roles
  has_many :user_experience_industries
  has_many :user_experience_management_skills
  has_many :user_experience_methods
  has_many :user_experience_applications
  has_many :user_experience_languages
  has_many :user_experience_infrastructures

end
