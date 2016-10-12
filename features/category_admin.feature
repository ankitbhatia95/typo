Feature: Add or Edit blogging categories
  As a blog administrator
  In order to create a space for different interests
  I want to be able to add and edit categories

Background:
  Given the blog is set up
  And I am logged into the admin panel

Scenario: Create a new Category
  Given I am on the new category page
  Then I should see "Categories"
  And I should see "Name"
  And I should see "Keywords"
  And I should see "Permalink"
  And I should see "Description"
  When I fill in "Name" with "Technology"
  And I press "Save"
  Then I should see "Category was successfully saved."

Scenario: Edit a Category
  Given I am on the edit category page for "General"
  When I fill in "Description" with "Updated info"
  And I press "Save"
  Then I should see "Category was successfully saved."
