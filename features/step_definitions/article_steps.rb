And /two articles are published$/ do
  step %Q{I am logged into the admin panel as admin}
  step %Q{I create an article with title "Article 1" and body "This is the body of article 1"}
  step %Q{I create an article with title "Article 2" and body "This is the body of article 2"}
  visit '/accounts/logout'
end

Given /I create an article with title "([^"]*)" and body "([^"]*)"/ do |title, body|
  step %Q{I am on the new article page}
  step %Q{I fill in "article_title" with "#{title}"}
  step %Q{I fill in "article__body_and_extended_editor" with "#{body}"}
  step %Q{I press "Publish"}
end
