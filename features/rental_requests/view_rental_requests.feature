Feature: view rental requests
  As a user with an item listing on the website
  In order to rent out the specified item
  I want to view all the rental requests for that specific item

    Background: these are the registered users
        Given the following users exist
            |email             |first_name |last_name |password    |
            |frankie@gmail.com |Frankie    |Valli     |password123 |
            |cat@gmail.com     |Cat        |Wu        |123         |
        And "Frankie Valli" has the following listings
            |name                  |description                |pick_up_location|fee |fee_unit|fee_time|deposit|
            |Dyson V11 Torque Drive|an excellent vacuum cleaner|Wien Hall       |1.03|karma   |hour    |12.50  |
        And "Cat Wu" has the following listings
            |name                  |description                |pick_up_location|fee |fee_unit|fee_time|deposit|
            |Cape Cod Potato Chips |savory and delicious       |Furnald Hall    |5   |dollars |week    |1.00   |

        Given I am a logged in user with information
            |email             |first_name |last_name |password    |
            |nathan@gmail.com  |Nathan     |Nguyen    |asdfjkl;    |
        And I have the following listings
            |name                  |description                |pick_up_location|fee |fee_unit|fee_time|deposit|
            |Mr. Bunny             |the best bunny alive       |East Campus     |11.03|karma   |hour    |13.50  |

        Given I have the following rental requests for "Dyson V11 Torque Drive"
            |pick_up_time           |return_time            |
            |2022-10-28 00:00:00 UTC|2022-10-29 00:00:00 UTC|
        And I have the following rental requests for "Cape Cod Potato Chips"
            |pick_up_time           |return_time            |
            |2022-11-28 00:00:00 UTC|2022-11-29 00:00:00 UTC|
        And "Frankie Valli" has the following rental requests for "Mr. Bunny"
            |pick_up_time           |return_time            |
            |2022-12-28 00:00:00 UTC|2023-01-29 00:00:00 UTC|
        And "Cat Wu" has the following rental requests for "Dyson V11 Torque Drive"
            |pick_up_time           |return_time            |
            |2022-11-28 10:00:00 UTC|2022-12-20 00:00:00 UTC|
        
    Scenario: user can see all of their rental requests under my rentals
        Given I am on the listings page
        When I follow "My Rentals"
        Then I should be on my rentals page
        And I should see "Dyson V11 Torque Drive"
        And I should see "Pick-up 10/28 12:00 AM"
        And I should see "Due by 10/29 12:00 AM"
        And I should see "Cape Cod Potato Chips"
        And I should see "Pick-up 11/28 12:00 AM"
        And I should see "Due by 11/29 12:00 AM"

    Scenario: user can see their rental requests for a specific listing
        Given I am on the listing page for "Dyson V11 Torque Drive"
        When I follow "View Requests"
        Then I should see "Fri 10/28/22 12:00 AM"
        And I should see "Sat 10/29/22 12:00 AM"
    
    Scenario: user can see rental requests for their own listing
        Given I am on the listing page for "Mr. Bunny"
        When I follow "Manage Requests"
        Then I should see "Wed 12/28/22 12:00 AM"
        And I should see "Sun 01/29/23 12:00 AM"

    Scenario: user tries to look at another user's rental requests
        Given I am on the listings page
        When I go on Cat Wu's request for "Dyson V11 Torque Drive"
        Then I should be on my listings page
        