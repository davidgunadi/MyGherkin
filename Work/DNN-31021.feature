Feature: DNN-31021

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

Scenario: Add an illegal URL to a page
When I hover on "CONTENT menu"
And I click on "Pages menu item"
And I click on "Advanced tab"
And I click on "SEO Tab"
And I click on "Add URL (in Advanced SEO Page)"
And I click on "URL Path Textbox"
And I set "/" to "URL Path Textbox" value
And I type "(test)"
And I click on "Save Button (in URL Table)"
Then I should see "The Page URL entered contains characters which cannot be used in a URL" in "Invalid URL Error Dialog"

Scenario: Verify suggested URL
When I wait unless "Invalid URL Error Dialog" appears
Then I should see "/-test" in "URL Path Textbox"

Scenario: Accept suggested URL
When I click on "Save Button (in URL Table)"
Then "Test Record (in URL Table)" should be displayed

Scenario: Cleanup
When I click on "Delete Icon (for Test Record in URL Table)"
And I click on "Delete button"
And I click on "Close Persona Bar button"
And I wait unless "Close Persona Bar button" appears
And I hover on "DNN logo at the top left"
And I click on "Logout in Evoq Logo menu"
Then "Login link" should be displayed