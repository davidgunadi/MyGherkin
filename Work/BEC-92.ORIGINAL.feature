Feature: BEC-92

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environments: * Beckon Web App QA
    * Beckon Web App Staging
   
   
 *" from "https://confluence.devfactory.com/display/BEC/Manual+Testing+Environments"
Given credentials "beckonqa"

Scenario: Log in
Given browser "Chrome"
When I open "<environment.endpoints.web application.Login URL>"
And I click on "Username Input"
And I type "<credentials.beckonqa.username>"
And I click on "Password Input"
And I type "<credentials.beckonqa.password>"
And I click on "Sign In Button"
Then "BECKON" page should be displayed

Scenario: Navigate to Dimensions page
When I hover on "Model Menu"
And I click on "Dimensions Link"
Then "DIMENSIONS" page should be displayed

Scenario: Open new dimension dialog 
When I click on "Create New Dimension Button"
Then "Dialog With Title Add New Category" should be displayed

Scenario: Fill name 
When I click on "Dimension Name Input"
And I type "Test Dimension - <Current date and time, ex: 6/4/2020 23:30>"
Then I should see "Test Dimension - <Current date and time, ex: 6/4/2020 23:30>" in "Dimension Human Id Input"
And I put a value from "Dimension Name Input" into "new_dimension_name"

Scenario: Save dimension
When I click on "Save New Dimension Button"
Then "Dialog With Title Add New Category" should not be displayed
and "Notification About Successfull Dimension Creation" should be displayed

Scenario: Find created dimension 
When I click on "Search All Columns Input"
and I type "<new_dimension_name>"
Then "Filtered Out Message" should not be displayed
and I should see "<new_dimension_name>" in "First Column Of First Table Row"