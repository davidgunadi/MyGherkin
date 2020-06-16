Feature: DNN-34072

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

Scenario: Create a portal
When I hover on "MANAGE menu"
And I click on "Sites menu item"
And I click on "Add New Site"
And I click on "Title"
And I type "subsite"
And I click on "Directory (Radio Button Label)"
And I click on "Assign Current User as Administrator toggle"
And I click on "Administrator User Name (in Add New Site Form)"
And I type "subsiteadmin"
And I click on "First Name (in Add New Site Form)"
And I type "Subsite"
And I click on "Last Name (in Add New Site Form)"
And I type "Admin"
And I click on "Email (in Add New Site Form)"
And I type "subsiteadmin@change.me"
And I click on "Password (in Add New Site Form)"
And I type "Pass1234"
And I click on "Confirm Password (in Add New Site Form)"
And I type "Pass1234"
And I click on "Create Site"
And I wait while "subsite (the record in Sites Page)" appears
Then "subsite (the record in Sites Page)" should be displayed

Scenario: Cleanup Part 1
When I hover on "subsite (the record in Sites Page)"
And I click on "Delete Site icon of subsite site"
And I click on "Yes (confirmation button)"
Then "subsite (the record in Sites Page)" should not be displayed

Scenario: Cleanup Part 2
When I click on "Close Persona Bar button"
And I wait unless "Close Persona Bar button" appears
And I hover on "DNN logo at the top left"
And I click on "Logout in Evoq Logo menu"
Then "Login link" should be displayed