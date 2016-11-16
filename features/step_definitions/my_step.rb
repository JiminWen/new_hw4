
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

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

Then /^(?:|the) director of "([^"]*)" should be "([^"]*)"$/ do |first,second|
    page.body.should=~/#{first}.*Director.*#{second}/m
end

Then /^I should be on (.+)$/ do |page_name|

  current_path = URI.parse(current_url).path 
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end



Then /^I should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end


Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then /^I should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end