Feature: Merge similar articles
  As a blog administrator
  In order to reduce article redundancy
  I want to be able to merge two similar articles

Background:
  Given the blog is set up
  Given the following articles exist
  | id | title | author | user_id | body             | state     | type    |
  | 1  | Hello | bob    | 2       | Hello World!     | published | article | 
  | 4  | Merge | joe    | 1       | Goodbye World... | published | article |
  | 3  | CS169 | joe    | 1       | Long homework man| published | article |
  Given the following users exist
  | profile_id | login | name | password   | email         | state  |
  | 1          | test  | joe  | test123    | joe@gmail.com | active |
  | 2          | test2 | bob  | test123    | bob@gmail.com | active |

Scenario: If I am an admin, I should be able to merge articles
  And I am logged into the admin panel
  And I go to edit the first article
  Then I should see "Merge Articles"
  And I should see "Article ID"

Scenario: A non-admin cannot merge two articles
  Given I am on the login page
  And I fill in "user_login" with "test"
  And I fill in "user_password" with "test123"
  And I go to edit the first article
  Then I should not see "Merge Articles"
  And I should not see "Article ID"

Scenario: When articles are merged, the merged article should contain the text of both previous articles
  Given I am logged into the admin panel
  And I go to edit the first article
  And I fill in "merge_article" with "4"
  And I press "Merge"
  Then I should be on the articles page
  And I should see "Successfully merged articles 1 and 4!"
  Then I go to edit the first article
  Then I should see "Welcome to Typo. This is your first article."
  And I should see "Goodbye World..."



  