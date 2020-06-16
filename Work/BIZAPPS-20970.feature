Feature: BIZAPPS-20970

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "BiznessApps UA (fakeprod)" from "https://confluence.devfactory.com/display/BIZ/Environment+Data+Structure"
Given credentials "zegerfitness"

Scenario: Login to CMS
Given browser "Chrome"
When I open "{environment.Zegerfitness.Login URL}"
And I set "{credentials.zegerfitness.username}" to "Email" value
And I set "{credentials.zegerfitness.password}" to "Password" value
And I click on "Login Button"
Then "Username Avatar" should be displayed

Scenario: Expand create menu
When I click on "Create Option in side menu"
Then "Build option in sub-menu" should be displayed
And "Design option in sub-menu" should be displayed

Scenario: Open build section
When I click on "Build option in sub-menu"
Then "Build page" should be displayed

Scenario: Open feature list
When I click on "Add Button (in Build Page)"
Then "Add Feature Dialog (in Build Page)" should be displayed

Scenario: Select reservation feature
When I click on "Reservation Item (in Add Feature Dialog)"
And I click on "Select > (in Add Feature Dialog)"
Then "Screen / Feature Name (in Add Feature Dialog)" should be displayed

Scenario: Enter feature name
When I click on "Name Textbox (in Add Feature Dialog)"
And I type "{Reservation}"
Then I should see "{Reservation}" in "Name Textbox (in Add Feature Dialog)"

Scenario: Add feature
When I click on "Add Button (in Add Feature Dialog)"
Then "Add Feature Dialog (in Build Page)" should not be displayed
Then "Reservation Item (in Build Page, with status Active)" should be displayed

Scenario: Clean Up Steps - Delete "Reservation"
When I hover on "Reservation Item (in Build Page, with status Active)"
And I click on "Make Inactive Button for Reservation Item (in Build Page)"
Then "Reservation Item (in Build Page, with status Inactive)" should be displayed