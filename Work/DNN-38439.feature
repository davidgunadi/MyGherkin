Feature: DNN-38439

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

Scenario: Add a new site
When I hover on "MANAGE menu"
And I click on "Sites menu item"
And I click on "Add New Site"
And I set "subsite" to "Title" value
And I click on "Directory radio button"
And I click on "Create Site"
And I wait until "subsite (the record in Sites Page)" appears
Then "subsite (the record in Sites Page)" should be displayed

Scenario: Verify My Website settings
When I hover on "My Website (the record in Sites Page)"
And I click on "Site Settings icon (for My Website)"
Then I should see "My Website" in "Site Title"

Scenario: Verify subsite settings
When I click on "BACK TO SITES link at the top"
And I wait until "Sites panel" appears
And I hover on "subsite (the record in Sites Page)"
And I click on "Site Settings icon of subsite site"
And I wait unless "Site Settings panel" appears
Then I should see "subsite" in "Site Title"

Scenario: Cleanup
When I click on "BACK TO SITES link at the top"
And I hover on "subsite (the record in Sites Page)"
And I click on "Delete Site icon of subsite site"
And I click on "Yes (confirmation button)"
Then "subsite (the record in Sites Page)" should not be displayed
When I hover on "DNN logo at the top left"
And I click on "Logout in Evoq Logo menu"
Then "Login link" should be displayed