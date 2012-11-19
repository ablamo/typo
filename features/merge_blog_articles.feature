Feature: Merge Blog Articles
  As an blog administrator
  In order to have a really concise blog
  I want to merge articles with the same topic

  Background:
    Given the blog is set up

  Scenario: Merge articles not shown when logged as publisher
    Given I am logged into the admin panel as publisher
    And I create an article with title "Article 1" and body "This is the body of article 1"
    When I am on the edit page for article titled "Article 1"
    Then I should not see "Merge Articles"

#  Scenario: Merge articles not shown when logged as contributor
#    Given I am logged into the admin panel as contributor
#    And I create an article with title "Article 1" and body "This is the body of article 1"
#    When I am on the edit page for article titled "Article 1"
#    Then I should not see "Merge Articles"

  Scenario: Merge articles is shown when logged as admin
    Given I am logged into the admin panel as admin
    And I create an article with title "Article 1" and body "This is the body of article 1"
    When I am on the edit page for article titled "Article 1"
    Then I should see "Merge Articles"


