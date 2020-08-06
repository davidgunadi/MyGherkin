Feature: SUPSOFT-7981

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Navigate to "Support Administrator Portal" and Login as Admin
Given browser "Chrome"
When I open "{environment.SupportSoft Administrator portal.URL}"
And I set "{credentials.Administrator.username}" to "Username In SA Login Page" value
And I set "{credentials.Administrator.password}" to "Password In SA Login Page" value
And I click on "Login Button In SA Login Page"
Then "SupportSoft - Support Administrator" page should be displayed

Scenario: From the Support Administrator web portal, in left menu navigate to "Application Management"
When I click on "Application Management in SA Menu"
Then "Remote Assist in SA Menu (under Application Management)" should be displayed

Scenario: Navigate to "RemoteAssist" sub menu item in the left menu
When I click on "Remote Assist in SA Menu (under Application Management)"
Then "Preferences in SA Menu (under Remote Assist)" should be displayed

Scenario: Click on "Preferences" sub menu item in left menu and check content loaded within acceptable timeframe
Given a stopwatch "Timer"
When I click on "Preferences in SA Menu (under Remote Assist)"
And I start the stopwatch "Timer"
Then "RemoteAssist Preferences (Page Header)" should be displayed
And "User Tab (in RemoteAssist Preferences Page)" should be displayed
And "Analyst Tab (in RemoteAssist Preferences Page)" should be displayed
And "Key Name Table Header (in User - Preferences List)" should be displayed
And "Key Type Table Header (in User - Preferences List)" should be displayed
And "Key Value Table Header (in User - Preferences List)" should be displayed
When I stop the stopwatch "Timer"
Then the stopwatch "Timer" value should be "5" sec or less
And I remember a value from "value" attribute of "Key Name in First Row (in User - Preferences List)" as "FirstKeyName"

Scenario: Click on the pencil image button that exists on the first row of the "User - Preferences List" table to edit preference
When I click on "Edit Button for FirstKeyName"
Then "Key Value Textbox for FirstKeyName" should be displayed

Scenario: Update value to 1 and Save, ensure it is saved within acceptable timeframe
When I reset the stopwatch "Timer"
And I set "Key Value Textbox for FirstKeyName" value to "1"
And I start the stopwatch "Timer"
And I click on "Save Button for FirstKeyName"
And I wait until "Key Value Cell for FirstKeyName" appears
And I stop the stopwatch "Timer"
Then the stopwatch "Timer" value should be "5" sec or less
And I should see "1" in "Key Value Cell for FirstKeyName"

Scenario: Click on "Preferences" sub menu item in left menu and check content loaded
When I click on "Preferences in SA Menu (under Remote Assist)"
Then "RemoteAssist Preferences (Page Header)" should be displayed
And "User Tab (in RemoteAssist Preferences Page)" should be displayed
And "Analyst Tab (in RemoteAssist Preferences Page)" should be displayed
And "Key Name Table Header (in User - Preferences List)" should be displayed
And "Key Type Table Header (in User - Preferences List)" should be displayed
And "Key Value Table Header (in User - Preferences List)" should be displayed
And I should see "1" in "Key Value Cell for FirstKeyName"