require 'rails_helper'

describe User do
	# Validation Tests
	context "when creating new user" do
		it "is is valid with first name, last name, email and password" do
			expect(User.new(first_name: "an", last_name: "example", email: "shjdf@ads.asd", password: "adfhjs")).to be_valid
		end

		it "is not valid without first name" do
			expect(User.new(last_name: "example", email: "shjdf@ads.asd", password: "adfhjs")).not_to be_valid
		end

		it "is not valid without last name" do
			expect(User.new(first_name: "an", email: "shjdf@ads.asd", password: "adfhjs")).not_to be_valid
		end

		it "is not valid without email" do
			expect(User.new(first_name: "an", last_name: "example", password: "adfhjs")).not_to be_valid
		end

		it "is not valid without password" do
			expect(User.new(first_name: "an", last_name: "example", email: "shjdf@ads.asd")).not_to be_valid
		end
	end
end