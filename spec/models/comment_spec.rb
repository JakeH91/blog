require 'rails_helper'

describe Comment do
	# Validation Tests
	context "when creating new comment" do
		it "is is valid with content" do
			expect(Comment.new(content: "Content")).to be_valid
		end

		it "is not valid without content" do
			expect(Comment.new(content: "")).not_to be_valid
		end
	end
end