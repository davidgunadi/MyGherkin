Feature: BEC-119

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environments: * Beckon Web App QA
    * Beckon Web App Staging" from "https://confluence.devfactory.com/display/BEC/Manual+Testing+Environments"
Given credentials "beckonqa"

Scenario: Log in 
Given browser "Chrome"
When I open "{environment.endpoints.Web Application.Login URL}"
And I click on "Username Input"
And I type "{credentials.beckonqa.username}"
And I click on "Password Input"
And I type "{credentials.beckonqa.password}"
And I click on "Sign In Button"
Then "BECKON" page should be displayed

Scenario: Navigate to Scorecards page
When I click on "Insights menu"
And I click on "Scorecards Link"
Then "SCORECARDS" page should be displayed

Scenario: Open scorecard
When I click on "First Column Of First Table Row"
Then "SCORECARD" page should be displayed

Scenario: Open copy dialog 
When I click on "Show More Three Dots Icon"
And I click on "Copy Scorecard Link"
Then I should see "COPY SCORECARD" in "Dialog Title"
And I put a value from "Copied Scorecard Name Input" into "name_of_copied_scorecard"

Scenario: Save and copy scorecard
When I click on "Save And Copy Scorecard Button"
Then "Dashboard Copied Notification Message" should be displayed

Scenario: Find copied scorecard
When I click on "Insights menu"
And I click on "Scorecards Link" 
And I click on "Search All Columns Input"
And I type "{name_of_copied_scorecard}"
Then "Filtered Out Message" should not be displayed