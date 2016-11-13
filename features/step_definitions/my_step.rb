
Given /^the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)

  end
end

Given /^(?:|I) am on the (.+)$/ do |page_name|
    visit path_to(page_name)
end

When (/^(?:|I) go to the (.+)$/) do |page_name|
    visit path_to(page_name)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I) press "([^"]*)"$/ do |button|
  click_button(button) 
end

When /(?:|I) follow "([^"]*)"$/ do |button|
    click_button(button)
end    

Then /^(?:|the) director of "([^"]*)" should be "([^"]*)"$/ do |first,second|
    page.body.should=~/#{first}.*Director.*#{second}/m
end