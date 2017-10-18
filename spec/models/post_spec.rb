require 'rails_helper'

describe Post do
	# Validation Tests
	context "when creating new post" do
		it "is is valid with title and content" do
			expect(Post.new(title: "Title", content: "Content")).to be_valid
		end

		it "is not valid without title" do
			expect(Post.new(content: "Content")).not_to be_valid
		end

		it "is not valid without content" do
			expect(Post.new(title: "Title")).not_to be_valid
		end
	end
end