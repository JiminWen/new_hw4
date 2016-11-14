
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

When(/^I follow "([^"]*)"$/) do |link|
  click_link(link)
  

end

Then /^(?:|the) director of "([^"]*)" should be "([^"]*)"$/ do |first,second|
    page.body.should=~/#{first}.*Director.*#{second}/m
end

Then /^I should be on the (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
 # @movie_id = Movie.find_by_title(page_name).id
  assert current_path==path_to(page_name)
end

