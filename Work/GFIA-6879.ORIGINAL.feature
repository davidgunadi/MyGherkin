Feature: GFIA-6879

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Given * environment: {environments.Deployed(.*)}" from "https://confluence.devfactory.com/pages/viewpage.action?pageId=451691297"
Given credentials "Given * credentials"

Scenario: Login to New UI 
Given browser "Chrome" 
When I open "{environment.URL}" 
And I click on "New-UI link" 
And I wait while "New UI login page" appears 
And I set "{credentials.ad_administrator.username}" to "New UI Username input" value 
And I set "{credentials.ad_administrator.password}" to "New UI Password input" value 
And I click on "New UI Login button"
Then "New UI Archiver application" should be displayed 
And "New UI ARCHIVE page" should be displayed

Scenario: Show at right
When I set "Show Preview Pane: Right" to "New UI Preview pane mode drop down on toolbar" value
Then "New UI Preview pane at right" should be displayed
And "New UI vertical splitter between items-pane and preview-pane" should be displayed

Scenario: Show at bottom
When I set "Show Preview Pane: Bottom" to "New UI Preview pane mode drop down on toolbar" value
Then "New UI Preview pane at bottom" should be displayed
And "New UI horizontal splitter between items-pane and preview-pane" should be displayed

Scenario: Hide
When I set "Hide Preview Pane" to "New UI Preview pane mode drop down on toolbar" value
Then "New UI Preview pane at right" should not be displayed
And "New UI Preview pane at bottom" should not be displayed