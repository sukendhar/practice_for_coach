### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "please", :password_confirmation => "please" }
end

def find_user
  @user ||= User.first conditions: {:email => @visitor[:email]}
end

def find_user(email)
  @user ||= User.first conditions: {:email => email}  
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email])
end

def delete_user  
  @user ||= User.first conditions: {:email => @visitor[:email]}
  @user.destroy unless @user.nil?
end

def delete_user(email)  
  @user ||= User.first conditions: {:email => email}
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "Name", :with => @visitor[:name]
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  fill_in "Password confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_up(email,name,password,password_confirmation)
  delete_user(email)
  visit '/users/sign_up'
  fill_in "Name", :with => name
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  fill_in "Password confirmation", :with => password_confirmation
  click_button "Sign up"
  find_user(email)
end

def sign_in
  visit '/users/sign_in'
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

Given /^I am on the sign\-up page$/ do
  visit '/users/sign_up'
end

Given /^I see an option to sign up as a credentialled coach$/ do
  page.should have_content "Sign up as credentialled coach"
end

Given /^I see an option to sign up as a student$/ do
  page.should have_content "Sign up as student"
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "please123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Edit account"
  fill_in "Name", :with => "newname"
  fill_in "Current password", :with => @visitor[:password]
  click_button "Update"
end

When /^I look at the list of users$/ do
  visit '/'
end

When /^I choose to register as a registered student on an Accredited Coach Training Program$/ do
  ## TODO # WRITE CODE #
end

When /^I sign up email with "(.*?)" and name with "(.*?)" and password with "(.*?)" and confirm_password with "(.*?)"$/ do |arg1, arg2, arg3, arg4|
  sign_up(arg1, arg2, arg3, arg4)
end


### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "A message with a confirmation link has been sent to your email address."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see my name$/ do
  create_user
  page.should have_content @user[:name]
end

Then /^I should see "(.*?)" message$/ do |arg1|
  page.should have_content arg1
end

Then /^I see a list of training providers$/ do
  page.should have_content "Training provider"
end

Then /^I select "(.*?)" and "(.*?)"$/ do |arg1, arg2|
  #first_option_xpath = "//div[1]/div/div/div/div/select"
  #first_option = find(:xpath, first_option_xpath).text
  #raise find_field('#training_provider').find('option').value.inspect
  #raise find_field('#training_provider').find('option[selected]').text.inspect
  #raise find_field('training_provider option[selected]').text.inspect
  page.has_content?(arg1)
  ## TODO NOT COMPLETED ## 
end

Then /^An email should be sent to the MyCoachPractice administrator$/ do
  
end






