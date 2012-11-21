And /two articles are published$/ do
  step %Q{I am logged into the admin panel as admin}
  step %Q{I create an article with title "Article 1" and body "This is the body of article 1"}
  step %Q{I create an article with title "Article 2" and body "This is the body of article 2"}
  step %Q{I go to the logout page}
end

Given /I create an article with title "([^"]*)" and body "([^"]*)"/ do |title, body|
  step %Q{I am on the new article page}
  step %Q{I fill in "article_title" with "#{title}"}
  step %Q{I fill in "article__body_and_extended_editor" with "#{body}"}
  step %Q{I press "Publish"}
end

Given /^the blog is setup with the following users$/ do |table|
  Blog.default.update_attributes!({:blog_name => 'My Own Blog',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  table.hashes.each do |user|
  User.create!({:login => user[:login],
                :password => user[:password],
                :email => user[:email],
                :profile_id => user[:profile],
                :name => user[:name],
                :state => user[:state]})
  end
  
end

Given /^the following articles are published$/ do |table|
  table.hashes.each do |article|
    step %Q{I am logged into the admin panel as "#{article[:author]}"}
    step %Q{I create an article with title "#{article[:Title]}" and body "#{article[:Body]}"}
    step %Q{I go to the logout page}
  end
end


Given /^I am editing the article "(.*?)" as "(.*?)"$/ do |article, login|
  step %Q{I am logged into the admin panel as "#{login}"}
  step %Q{I am on the edit page for article titled "#{article}"}
end

Then /^I should see "(.*?)"  and "(.*?)"$/ do |arg1, arg2|
  regexp = /#{arg1}.*#{arg2}/m # m means match across newlines
  assert page.body =~ regexp
end


Then /^I should see only one input element with the name "(.*?)"$/ do |arg1|
  page.has_css?('input#merge_with', :count => 1)
end

When /^I merge "(.*?)" with "(.*?)"$/ do |arg1, arg2|
  pending "Must define step to merge two articles" # express the regexp above with the code you wish you had
end

Then /^The Author of the nested article should be "(.*?)"$/ do |arg1|
  pending "Detecting article author" # express the regexp above with the code you wish you had
end

Then /^The Title of the nested article should be "(.*?)"$/ do |arg1|
  pending "Detecting article title" # express the regexp above with the code you wish you had
end

Then /^Comments of "(.*?)" and "(.*?)" are asigned to the merged article$/ do |arg1, arg2|
  pending "Describe asigning comments"# express the regexp above with the code you wish you had
end


