Feature: Admin users can merge blog articles
  As an blog administrator
  In order to have a really concise blog
  I want to merge articles with the same topic

  Background:
    Given the blog is setup with the following users
      |    login    | password |     email       | profile | name  | state  |
      |    admin    |  secret  | admin@myblog.es |     1   | admin | active |
      | publisher   |  secret  | publi@myblog.es |     2   | publi | active |
      | contributor |  secret  | contr@myblog.es |     3   | contr | active |
    And the following articles are published
      |   author   |   Title   |              Body             |
      |    admin   | Article 1 | This is the body of article 1 |
      |  publisher | Article 2 | This is the body of article 2 |

  Scenario: A non-admin cannot merge two articles
    Given I am logged into the admin panel as "publisher"
    When I am on the edit page for article titled "Article 2"
    Then I should not see "Merge Articles"

  Scenario: Merge articles is shown when logged as admin
    Given I am logged into the admin panel as "admin"
    When I am on the edit page for article titled "Article 1"
    Then I should see "Merge Articles"

  Scenario: Merge articles not shown for new articles
    Given I am logged into the admin panel as "admin"
    When I follow "New Article"
    Then I should not see "Merge Articles"

  Scenario: There should be exactly one input element with the name merge_with on the edit article page
    Given I am editing the article "Article 1" as "admin"
    Then I should see only one input element with the name "merge_with"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am editing the article "Article 1" as "admin"
    And I fill in "Article ID" with "2"
    And I press "Merge With This Article"
    Then I should see "This is the body of article 1"  and "This is the body or article 2"

  Scenario: The merged article's author should be one of the of the authors of the two original articles
    When I merge "Article 1" with "Article 2"
    Then The Author of the nested article should be "admin"

  Scenario: The merged article's title should be one of the of the titles of the two original articles
    When I merge "Article 1" with "Article 2"
    Then The Title of the nested article should be "Article 1"

  Scenario: The coments of the original articles are asigned to the merged article
    When I merge "Article 1" with "Article 2"
    Then Comments of "Article 1" and "Article 2" are asigned to the merged article

