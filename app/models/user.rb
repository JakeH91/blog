class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :posts
	has_many :comments

	validates :first_name, :last_name, :email, :presence => true
	validates :email, :uniqueness => { :case_sensitive => false }

	has_attached_file :avatar,
										styles: { 
											thumb: "100x100>",
											medium: "300x300>",
											large: "400x400" }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
