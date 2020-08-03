Feature: PAUB-19084

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred"

Scenario: Login into the UltraBand UBView website
Given browser "Chrome"
When I open "{environment.UBView.Login URL}"
And I set "username" value to "{credentials.UBView-Cred.username}"
And I set "password" value to "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Dashboard" page should be displayed

Scenario: Click on Configuration
When I click on "Configuration (in Left Menu)"
Then "Settings (in Left Menu)" should be displayed

Scenario: Go into Settings
When I click on "Settings (in Left Menu)"
Then "General Tab (in Settings)" should be displayed
And I remember a value from "class" attribute of "General Tab (in Settings)" as "GeneralTabClassStatus"
And the value of "GeneralTabClassStatus" should contain "active"
And I should see "%" in "Protocol filter threshold value"
And I should see "%" in "HTTP Service filter threshold value"
And I should see "%" in "Percentile limit value"
And "Interactive graphs (Enabled Option)" should be displayed
And "Interactive graphs (Disabled Option)" should be displayed
And "Graph height (Floating Option)" should be displayed
And "Graph height (Fixed Option)" should be displayed

Scenario: Go into Security Tab
# 10	Click on the 'Security' tab at the top.	A new page should load with other settings.
# 11	Verify that the "Enable password" setting is present.	The element should be visible, and a text box should be by its right side.
