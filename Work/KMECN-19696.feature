Feature: KMECN-22084

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "KM QA" from "https://confluence.devfactory.com/display/KM/KMECN+E2E+Environment+Data+Structure"
Given credentials "kmplatformadmin"

Scenario: User Logs in to ECN
Given browser "Chrome"
When I open "{environment.endpoints.KMQA.URL}"
And I set "{credentials.kmplatformadmin.username}" to "Username in KM Login Page" value
And I set "{credentials.kmplatformadmin.password}" to "Password in KM Login Page" value
And I click on "Sign In button in KM Login Page"
Then "Home page Brand Logo" should be displayed
And I should see "{credentials.kmplatformadmin.username}" in "Current logged in user"

Scenario: User selects appropriate channel and customer
When I set "Channel Dropdown in Home page" value to "Knowledge Marketing"
And I set "Customer Dropdown in Home page" value to "Knowledge Marketing Subscribers ( PRT / UAD / CIRC )"
Then I should see "KMPS Trade Press Media Group" in "Selected Channel Dropdown option in Home page"
And I should see "MPS TradePress Subscribers ( UAD / CIRC )" in "Selected Customer Dropdown option in Home page"

Scenario: User navigates to Form Designer and Verify Group Filter Dropdown and Text
When I click on "Form Designer (Button in Main Page)"
Then "Group Filter Textbox (under Active Forms)" should be displayed
And "Group Filter Dropdown (under Active Forms)" should be displayed

Scenario: User verify Group Dropdown Filter Values
When I click on "Group Filter Dropdown (under Active Forms)"
Then "contains (dropdown option for Group)" should be displayed
Then "starts with (dropdown option for Group)" should be displayed
Then "equals (dropdown option for Group)" should be displayed
Then "ends with (dropdown option for Group)" should be displayedcontains (dropdown option for Group)

Scenario: User select Search Criteria and Text, then click Search
When I click on "contains (dropdown option for Group)"
And I set "Group" to "Group Filter Textbox (under Active Forms)" value
And I click on "Search Button (under Active Forms)"
Then I should see "Group" in "Group Cell (in First Row, under Active Forms Grid)"

Scenario: User Log Off
When I click on "Logout Link"
Then "Username in KM Login Page" should be displayed