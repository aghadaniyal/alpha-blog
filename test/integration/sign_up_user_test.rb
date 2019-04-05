require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest

	test "sign up user" do

		get signup_path
		assert_template 'users/new'	
		assert_difference 'User.count', 1 do
			post users_path, params: {user: {username: "ahad", email: "ahad@yahoo.com", password: "12345"}}
			follow_redirect!
		end	
		assert_template'users/show'
		assert_select 'h1'
		assert_match "Welcome to ahad's page", response.body
	end


	test "invalid signup user" do

		get signup_path
		assert_template 'users/new'	
		assert_no_difference 'User.count' do
			post users_path, params: {user: {username: " ", email: " ", password: " "}}
			
		end	
		assert_template'users/new'
		assert_select 'h1'
		assert_match "error", response.body
	end
end