Feature: SUPSOFT-14466

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Browser: Login to User Center
Given browser "Internet Explorer"
When I open "{environment.SupportSoft User Center portal.URLLogin}"
And I set "Username in UC Login Page" value to "{credentials.Administrator.username}"
And I set "Password in UC Login Page" value to "{credentials.Administrator.password}"
And I click on "Login Button in UC Login Page"
Then "Proactive Assist User Center" page should be displayed

Scenario: Navigate to Search Page
When I click on "Search (in Navigation Bar)"
Then "Search Textbox in User Center Home Page" should be displayed
And "Search Button in User Center Home Page" should be displayed

Scenario: Go into Advanced Search Page
When I set "Search Textbox in User Center Home Page" value to "search"
And I click on "Advanced Search (in Search Page)"
Then "Advanced Search (Header)" should be displayed
And I should see "search" in "Search Textbox (in Advanced Search)"
And "Search Button (in Advanced Search)" should be displayed
And "Terms Radio Button (in Advanced Search)" should be displayed
And "Folder Name Radio Button (in Advanced Search)" should be displayed
And "Search Type Dropdown (in Advanced Search)" should be displayed
And "Occurrence Dropdown (in Advanced Search)" should be displayed
And "Modified Dropdown (in Advanced Search)" should be displayed
And "Content Type Dropdown (in Advanced Search)" should be displayed

Scenario: Clear Cache, Perform Advanced Search, and Verify User is taken back to home page
When I execute an action which only human can execute:
"""
Open Developer Tools for the Browser you are using.
Remove all the Session Cookies for the environment.
"""
And I set "Any Word" to "Search Type Dropdown (in Advanced Search)" value
And I set "Anywhere" to "Occurrence Dropdown (in Advanced Search)" value
And I set "Anytime" to "Modified Dropdown (in Advanced Search)" value
And I set "All" to "Content Type Dropdown (in Advanced Search)" value
And I click on "Search Button (in Advanced Search)"
Then "Login Button in UC Login Page" should be displayed