Feature: GFIA-6879

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Development" from "https://confluence.devfactory.com/pages/viewpage.action?pageId=451691297"
Given credentials "ad_administrator"

Scenario: Login to New UI
Given browser "Chrome"
When I open "{environment.Deployed-1.URL}"
And I click on "New-UI link"
And I wait until "newui-username-input" appears
And I set "{credentials.ad_administrator.username}" to "newui-username-input" value
And I set "{credentials.ad_administrator.password}" to "newui-password-input" value
And I click on "newui-login-button"
Then "User Icon on Top Right of Page (in NewUI)" should be displayed
And "Archive Page (in NewUI)" should be displayed

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