Feature: SUPSOFT-4043

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environment * QA : Make rdp to "SupportSoft Server"" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "* Administrator credential should be used."

Scenario: Browser: Login to Support Administrator
Given browser "Internet Explorer"
When I open "{environment.Support Administrator portal.URL}"
And I set "Administrator.Username" to "Username In SA Login Page" value
And I set "Administrator.Password" to "Password In SA Login Page" value
And I click on "Login Button In SA Login Page"
Then "Welcome to the Support Administrator" page should be displayed

Scenario: Browser: Navigate to Dynamic Content Preview Install Page
When I click on "Application Management in SA Menu" 
And I click on "Content in SA Menu"
And I click on "Configure Dynamic Content Preview Install in SA Menu"
Then "Configure Dynamic Content Preview Install" page should be displayed
And "MSI Package Dropdownlist in Configure Dynamic Content Preview Install" should be displayed
And "Save Button in Configure Dynamic Content Preview Install" should be displayed

Scenario: Browser: Select Dynamic Content Preview Install Package
Given a stopwatch "Save Timer"
When I click on "MSI Package Dropdownlist in Configure Dynamic Content Preview Install" 
And I click on "First Item of MSI Package Dropdownlist in Configure Dynamic Content Preview Install" 
And I reset the stopwatch "Save Timer"
And I start the stopwatch "Save Timer"
And I click on "Save Button in Configure Firefox Controls"
And I wait unless "Dynamic Content Preview Install successfully selected Message" appears
And I stop the stopwatch "Save Timer"
Then the stopwatch "Save Timer" value should be "5" sec or less