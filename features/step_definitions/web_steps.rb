When /^I press "([^"]*)"$/ do |button|
  first(:button, button).click
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link link
end

When /^(?:|I )check (?:the\s+)?"([^"]*)"(?:\s*checkbox)?$/ do |field|
  check(field)
end

When /^(?:|I )uncheck (?:the\s+)?"([^"]*)"(?:\s*checkbox)?$/ do |field|
  uncheck(field)
end

Then /^I should see "([^"]*)"$/ do |text|
  expect(page).to have_content text
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  expect(page).to_not have_content text
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  regexp = /#{e1}.*#{e2}/m
  expect(page.body) =~ regexp
end