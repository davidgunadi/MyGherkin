Feature: KMECN-22084

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "KM QA" from "https://confluence.devfactory.com/display/KM/KMECN+E2E+Environment+Data+Structure"
Given credentials "kmplatformadmin"

Scenario: Precondition: Login to Knowledge Marketing Administrator
Given browser "Chrome"
When I open "{environment.endpoints.KMQA.URL}"
And I set "{credentials.kmplatformadmin.username}" to "Username in KM Login Page" value
And I set "{credentials.kmplatformadmin.password}" to "Password in KM Login Page" value
And I click on "Sign In button in KM Login Page"
Then "Home page Brand Logo" should be displayed
And I should see "{credentials.kmplatformadmin.username}" in "Current logged in user"

Scenario: Precondition: Select Channel and Customer
When I set "Channel Dropdown in Home page" value to "KMPS Trade Press Media Group"
And I set "Customer Dropdown in Home page" value to "KMPS TradePress Subscribers ( UAD / CIRC )"
Then I should see "KMPS Trade Press Media Group" in "Selected Channel Dropdown option in Home page"
And I should see "MPS TradePress Subscribers ( UAD / CIRC )" in "Selected Customer Dropdown option in Home page"

Scenario: Precondition: Enter UAD Application
When I click on "UAD (Button in Main Page)"
Then "Master Database Reports" page should be displayed

Scenario: In the menu, go to "Filters", and select the option "Question Category"
When I hover on "Filters (Navigation Menu)"
And I click on "Question Category (Navigation Menu)"
Then "Question Category (Page Header)" should be displayed

Scenario: Collapse all categories
When I wait for "1" seconds
And I click on "Collapse All (in Question Category Menu)"
And I wait until "The Line from Parent to Child (in Question Category Menu)" disappears
Then "The Line from Parent to Child (in Question Category Menu)" should not be displayed

Scenario: Expand all categories
When I click on "Expand All (in Question Category Menu)"
And I wait until "The Line from Parent to Child (in Question Category Menu)" appears
Then "The Line from Parent to Child (in Question Category Menu)" should be displayed

Scenario: Go to Sales View
When I click on "Sales View (Navigation Menu)"
Then "Questions Category Table (in Sales View)" should be displayed
And I remember a value from "First Item in Question Category Table (in Sales View)" as "QuestionCategory"

Scenario: Select a Different Question Category
When I click on "First Item in Question Category Table (in Sales View)"
Then I should see "Question Category" in "Question Category Name (in Questions Table(in Right Side))"

Scenario: Search Questions
When I set "Question Name Textbox (in Sales View)" value to "question"
And I click on "Search Button (in Sales View)"
Then "Question Name containing the word Question (in Questions Table(in Right Side))" should be displayed

Scenario: Download Questions
When I click on "Download Questions Button (in Sales View)"
Then the file "Questions.pdf" should be downloaded