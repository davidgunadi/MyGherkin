Feature: BOINT-7730

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Automation Staging" from "https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure"
Given credentials "sc_admin"

Scenario: Log in to Bonzai as a site collection administrator
Given browser "Chrome"
When I open "{environment.bonzai_home.Login URL}"
Then "Admin Menu Icon" should be displayed

Scenario: Click on Header Links
When I hover on "Link Icon (in Header)"
Then "Link Dropdown Menu (in Header)" should be displayed

Scenario: Select Marketplace Option in Header Links Sub Menu
When I click on "Marketplace (in Link Dropdown Menu)"
Then "MarketPlace (Page)" should be displayed
And I remember a value from "MarketPlace Card Text (Last)" as "MarketPlaceRecord"

Scenario: Search Item and Verify Suggestion Dropdown
When I click on "Search Textbox (in MarketPlace)"
And I type "{MarketPlaceRecord}"
Then I should see "{MarketPlaceRecord}" in "Suggestion Dropdown Item (in MarketPlace)"

Scenario: Click on Search
When I click on "Search Icon (in Search Textbox, in MarketPlace)"
Then I should see "{MarketPlaceRecord}" in "MarketPlace Card Text (First)"

Scenario: Open Item Detail
When I click on "MarketPlace Card Text (First)"
Then I should see "{MarketPlaceRecord}" in "Item Title (in MarketPlace Item Detail Page)"

Scenario: Go back to Main MarketPlace Page
When I click on "See All Items (in MarketPlace)"
Then "Search Textbox (in MarketPlace)" should be displayed

Scenario: Filter by Location
When I click on "Location Dropdown (in MarketPlace)"
And I click on "Vancouver (Location Dropdown Option - in Marketplace)"
Then I should see "Vancouver" in "Location Value (in MarketPlace Card Text - First)"

Scenario: Filter by Another Location
When I click on "Location Dropdown (in MarketPlace)"
And I click on "Toronto (Location Dropdown Option - in Marketplace)"
Then I should see "Toronto" in "Location Value (in MarketPlace Card Text - First)"

Scenario: Restore "All" Location
When I click on "Location Dropdown (in MarketPlace)"
And I click on "All (Location Dropdown Option - in Marketplace)"
Then "Location Value (in MarketPlace Card Text - First)" should be displayed

Scenario: Filter by Category - For Sale
When I click on "Category Dropdown (in MarketPlace)"
And I click on "For Sale (Category Dropdown Option - in Marketplace)"
Then I should see "For Sale" in "Category Value (in MarketPlace Card Text - First)"

Scenario: Filter by Category - Wanted
When I click on "Category Dropdown (in MarketPlace)"
And I click on "Wanted (Category Dropdown Option - in Marketplace)"
Then I should see "Wanted" in "Category Value (in MarketPlace Card Text - First)"

Scenario: Filter by Category - Services
When I click on "Category Dropdown (in MarketPlace)"
And I click on "Services (Category Dropdown Option - in Marketplace)"
Then I should see "Services" in "Category Value (in MarketPlace Card Text - First)"

Scenario: Restore "All" Category
When I click on "Category Dropdown (in MarketPlace)"
And I click on "All (Category Dropdown Option - in Marketplace)"
Then "Category Value (in MarketPlace Card Text - First)" should be displayed

Scenario: Select "Expiring Soon" Dropdown
When I click on "Sort By Dropdown (in MarketPlace)"
And I click on "Expiring Soon (Sort By Dropdown Option - in Marketplace)"
Then I should see "Expiring Soon" in "Sort By Dropdown (in MarketPlace)"

Scenario: Sort by "Price - Low to High"
Select Price - Low to High on the Sort By dropdown
The results are ordered according to ascending price

Scenario: Sort by "Price - High to Low"
Select Price - High to Low on the Sort By dropdown
The results are ordered according to descending price