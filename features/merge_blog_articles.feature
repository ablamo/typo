Feature: Merge Blog Articles
  As an blog administrator
  In order to have a really concise blog
  I want to merge articles with the same topic

  Background:
    Given the blog is set up
    And two articles are published

  Scenario: Merge articles not shown when logged as publisher
    Given I am logged into the admin panel as publisher
    And I go to the home page
    When I follow "Article 1"
    Then I should not see "Merge Articles"

  Scenario: Merge articles not shown when logged as contributor
    Given I am logged into the admin panel as contributor
    And I go to the home page
    When I follow "Article 1"
    Then I should not see "Merge Articles"

  Scenario: Merge articles is shown when logged as admin
    Given I am logged into the admin panel as admin
    And I go to the home page
    When I follow "Article 1"
    Then I should see "Merge Articles"


