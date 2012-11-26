Feature: Solve bug relating categories, which fail to be shown
  As an blog administrator
  In order to have a good articles structure
  I want to be able to define categories to later, asign articles to them

  Background:
    Given the blog is setup with the following users
      |    login    | password |     email       | profile | name  | state  |
      |    admin    |  secret  | admin@myblog.es |     1   | admin | active |
      | publisher   |  secret  | publi@myblog.es |     2   | publi | active |
      | contributor |  secret  | contr@myblog.es |     3   | contr | active |
    And the following categories exist
      |  name  | permalink | position |
      | 2ndCat |   2ndcat  |     2    |
      | 3rdCat |   3rdcat  |     3    |
@bug
  Scenario: A admin user can view all the categories
    Given I am logged into the admin panel as "admin"
    When I follow "Categories"
    Then I should see "2ndCat"
    And I should see "3rdCat"


