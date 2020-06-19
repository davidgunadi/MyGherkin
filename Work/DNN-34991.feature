Feature: DNN-34991

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Evoq Engage (Automation)" from "https://confluence.devfactory.com/display/DNN/Environment+Data+Structure"
Given credentials "dnnhost"

Scenario: Log in
Given browser "Chrome"
When I open "{environment.Site.URL}"
And I click on "Login link"
And I set "{credentials.dnnhost.username}" to "Username" value
And I set "{credentials.dnnhost.password}" to "Password" value
And I click on "Login button"
Then "Evoq logo" should be displayed

Scenario: Navigate to Settings > Connector
When I hover on "SETTINGS menu"
And I click on "Connectors menu item"
Then "Connectors (Header)" should be displayed
And "ZENDESK Connector" should be displayed

Scenario: Precondition - Connect to Zendesk
When I click on "Connect Button (for ZENDESK)"
And I click on "Zendesk URL Textbox"
And I type "aurea.zendesk.com"
And I click on "Agent Email Textbox"
And I type "dineshkumar.karmankar@aurea.com"
And I click on "Agent Password Textbox"
And I type "Pass1234"
And I click on "Save Button (for ZENDESK)"
Then "Item Successfully Saved Message" should be displayed
And "Green Tick Mark (for ZENDESK)" should be displayed
When I click on "Cancel Button (for ZENDESK)"
Then "Zendesk Advanced Settings Title" should not be displayed

Scenario: Click Edit next to ZENDESK
When I click on "Edit Button (for ZENDESK)"
Then "Zendesk URL Textbox" should be displayed
And "Agent Email Textbox" should be displayed
And "Agent Password Textbox" should be displayed
And "Save Button (for ZENDESK)" should be displayed
And "Settings Button (for ZENDESK)" should be displayed
And "Cancel Button (for ZENDESK)" should be displayed

Scenario: Clear all 3 panel fields and click Save
When I set "Zendesk URL Textbox" value to ""
And I set "Agent Email Textbox" value to ""
And I set "Agent Password Textbox" value to ""
And I wait for "1" seconds
And I click on "Save Button (for ZENDESK)"
Then "Item Successfully Saved Message" should be displayed
And "Green Tick Mark (for ZENDESK)" should not be displayed

Scenario: Click Cancel
When I click on "Cancel Button (for ZENDESK)"
Then "Zendesk Advanced Settings Title" should not be displayed
And "Connect Button (for ZENDESK)" should be displayed

Scenario: Logout
When I hover on "DNN logo at the top left"
And I click on "Logout in Evoq Logo menu"
Then "Login link" should be displayed