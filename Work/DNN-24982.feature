Feature: DNN-24982

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
Then "DNN logo at the top left" should be displayed

Scenario: Navigate to Settings > Connector
When I hover on "SETTINGS menu"
And I click on "Connectors menu item"
Then "Connectors (Header)" should be displayed
And "ZENDESK Connector" should be displayed

Scenario: Click "Connect" next to ZENDESK
When I click on "Connect Button (for ZENDESK)"
Then "Zendesk URL Textbox" should be displayed
Then "Agent Email Textbox" should be displayed
Then "Agent Password Textbox" should be displayed
Then "Save Button (for ZENDESK)" should be displayed

Scenario: Fill in Zendesk Details and Save
When I click on "Zendesk URL Textbox"
And I type "aurea.zendesk.com"
And I click on "Agent Email Textbox"
And I type "dineshkumar.karmankar@aurea.com"
And I click on "Agent Password Textbox"
And I type "Pass1234"
And I click on "Save Button (for ZENDESK)"
Then "Item Successfully Saved Message" should be displayed
And "Green Tick Mark (for ZENDESK)" should be displayed

Scenario: Open Settings
When I click on "Settings Button (for ZENDESK)"
Then "Zendesk Advanced Settings Title" should be displayed
Then "Auto Ticket Creation Settings Field" should be displayed
Then "Selected Fields Field" should be displayed
Then "Select Additional Fields Field" should be displayed

Scenario: Save Advanced Settings
When I click on "Save Button (in Advanced Settings Dialog)"
Then "Advanced settings saved succesfully" should be displayed

Scenario: Close Advanced Settings Dialog
When I click on "Cancel Button (in Advanced Settings Dialog)"
Then "Zendesk Advanced Settings Title" should not be displayed

Scenario: Click Cancel in Zendesk Dialog
When I click on "Cancel Button (for ZENDESK)"
Then "Zendesk URL Textbox" should not be displayed

Scenario: Cleanup - Reset Zendesk Status
When I click on "Edit Button (for ZENDESK)"
When I click on "Zendesk URL Textbox"
And I set "Zendesk URL Textbox" value to ""
And I set "Agent Email Textbox" value to ""
And I set "Agent Password Textbox" value to ""
And I click on "Save Button (for ZENDESK)"
Then "Item Successfully Saved Message" should be displayed

Scenario: Cleanup - Logout
When I hover on "DNN logo at the top left"
And I click on "Logout in Evoq Logo menu"
Then "Login link" should be displayed