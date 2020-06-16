Feature: BEC-92

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Beckon Web App QA" from "https://confluence.devfactory.com/display/BEC/Manual+Testing+Environments"
Given credentials "beckonqa"
Given "currentDateTime" value is the current datetime "+0 milliseconds"

Scenario: Log in
Given browser "Chrome"
When I open "{environment.Web Application.Login URL}"
And I click on "Username Input"
And I type "{credentials.beckonqa.username}"
And I click on "Password Input"
And I type "{credentials.beckonqa.password}"
And I click on "Sign In Button"
Then "Logged In Icon Logo" should be displayed

Scenario: Navigate to Dimensions page
When I click on "Model Menu"
And I click on "Dimensions Link"
Then "Dimensions (Page Header)" should be displayed

Scenario: Open new dimension dialog 
When I click on "Create New Dimension Button"
Then "Dialog With Title Add New Category" should be displayed

Scenario: Fill name 
When I click on "Dimension Name Input"
And I type "Test{currentDateTime}"
Then I should see "Test{currentDateTime}" in "Dimension Human Id Input"

Scenario: Save dimension
When I click on "Save New Dimension Button"
Then "Dialog With Title Add New Category" should not be displayed
And "Notification About Successfull Dimension Creation" should be displayed

Scenario: Find created dimension 
When I click on "Search All Columns Input"
And I type "Test{currentDateTime}"
Then "Filtered Out Message" should not be displayed
And I should see "Test{currentDateTime}" in "Name Column In First Row Of Dimension Table"