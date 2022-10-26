Feature: add listing
  As a user with an extra or unused item
  In order to rent it out to other users of the platform
  I want to add a listing for my item

  Background: user is logged in
    Given I am a logged in user with information
      |email             |first_name |last_name |password    |
      |frankie@gmail.com |Frankie    |Valli     |password123 |

  Scenario: user navigates to the new listing page from the listings page
    Given I am on the listings page
    Then I should see "Add new listing"
    When I follow "Add new listing"
    Then I should be on the new listing page

  Scenario: user successfully adds a new listing
    Given I am on the new listing page
    When I add a new listing with information
      |name                  |description                |pick_up_location|fee |fee_unit|fee_time|deposit|
      |Dyson V11 Torque Drive|an excellent vacuum cleaner|Wien Hall       |1.03|Karma   |Hour    |12.50  |
    Then I should be on the listings page
    And I should see a listing for "Dyson V11 Torque Drive"

  Scenario: user unsuccessfully adds a new listing
    Given I am on the new listing page
    When I add a new listing with information
      |name                  |
      |Dyson V11 Torque Drive|
    Then I should see the error {"pick_up_location"=>["can't be blank"], "fee"=>["can't be blank"], "deposit"=>["can't be blank"]}
