class Post < ApplicationRecord
	validates_presence_of :author, :title, :content
end
