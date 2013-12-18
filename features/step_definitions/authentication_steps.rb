Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^they submit invalid signin information$/ do
  click_button "Sign in"
end

Then /^they should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

Given /^the user has an account$/ do
  @user = User.create(name: "New User", email: "user@example.com",
                      password: "saasbook", password_confirmation: "saasbook")
end

When /^the user submits valid signin information$/ do
  visit signin_path
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then /^they should see their profile page$/ do
  page.should have_selector('title', text: @user.name)
end

Then /^they should see a signout link$/ do
  page.should have_link('Sign out', href: signout_path)
end