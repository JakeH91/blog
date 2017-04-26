class Post < ApplicationRecord
	validates_presence_of :author, :title, :content
	has_many :comments
end
