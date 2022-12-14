Feature: edit listing
  As a user who has listed an item on the platform
  In order to edit the listing if I made a mistake or the details changed
  I want to edit the listing on the platform

  Background: user is logged in and there are listings
    Given I am a logged in user with information
      |email             |first_name |last_name |password    |phone|
      |frankie@columbia.edu |Frankie    |Valli     |password123 |1234567890|
    And I have the following listings
      |name                  |description                |pick_up_location|fee |fee_unit|fee_time|deposit|item_category|cash|
      |Dyson V11 Torque Drive|an excellent vacuum cleaner|Wien Hall       |1.03|karma   |hour    |12.50  |tools        |true|

  Scenario: user navigates to the edit listing page from the listings page
    Given I am on the listing page for "Dyson V11 Torque Drive"
    When I follow "Edit"
    Then I should be on the edit listing page for "Dyson V11 Torque Drive"
    When I fill in "Pick-up Location" with "Furnald Hall"
    And I check the following payment methods: venmo, paypal
    And I press "Update Listing Info"
    Then the pick-up location of "Dyson V11 Torque Drive" should be "Furnald Hall"

  Scenario: user tries to edit listing owned by another user
    Given the following users exist
      |email             |first_name |last_name |password    |phone|
      |joe@columbia.edu     |Joe        |Long      |password123 |1234567891|
    And "Joe Long" has the following listings
      |name                  |description                |pick_up_location|fee |fee_unit|fee_time|deposit|item_category|paypal|
      |Mirrored Swim Goggles |                           |East Campus     |0.00|dollars |hour    |9.00   |tools        |true  |
    When I go to the listing page for "Mirrored Swim Goggles"
    Then I should not see "Edit"
    When I go to the edit listing page for "Mirrored Swim Goggles"
    Then I should be on the listings page

