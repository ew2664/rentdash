Given /^I am a registered user with credentials$/ do |credentials|
  @credentials = filter_credentials credentials
  @user = User.create!(email: @credentials["email"],
                       password: @credentials["password"],
                       password_confirmation: @credentials["password"])
end

When /^I log in with credentials$/ do |credentials|
  visit login_path
  login_with filter_credentials credentials
end

When /^I log in with my credentials$/ do
  visit login_path
  login_with @credentials
end

Then /^I should (?:|still )be on the login page$/ do
  expect(URI.parse(current_url).path).to eq(login_path)
end


def filter_credentials(credentials)
  credentials.rows_hash.slice("email", "password")
end

def login_with(credentials)
  credentials.each do |key, value|
    fill_in key, with: value
  end
  click_button "Sign in!"
end