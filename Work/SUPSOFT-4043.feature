Feature: SUPSOFT-4043

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Browser: Login to Support Administrator
Given browser "Internet Explorer"
When I open "{environment.SupportSoft Administrator portal.URL}"
And I set "{credentials.Administrator.username}" to "Username In SA Login Page" value
And I set "{credentials.Administrator.password}" to "Password In SA Login Page" value
And I click on "Login Button In SA Login Page"
Then "SupportSoft - Support Administrator" page should be displayed

Scenario: Browser: Navigate to Dynamic Content Preview Install Page
When I click on "Application Management in SA Menu"
And I click on "Content in SA Menu"
And I click on "Configure Dynamic Content Preview Install in SA Menu"
Then "Configure Dynamic Content Preview Install (Header)" should be displayed
And "MSI Package Dropdownlist in Configure Dynamic Content Preview Install" should be displayed
And "Save Button in Configure Dynamic Content Preview Install" should be displayed

Scenario: Browser: Select Dynamic Content Preview Install Package
Given a stopwatch "Save Timer"
When I click on "MSI Package Dropdownlist in Configure Dynamic Content Preview Install"
And I click on "First Item of MSI Package Dropdownlist in Configure Dynamic Content Preview Install"
And I click on "Save Button in Configure Firefox Controls"
And I start the stopwatch "Save Timer"
And I wait until "Dynamic Content Preview Install successfully selected Message" appears
And I stop the stopwatch "Save Timer"
Then the stopwatch "Save Timer" value should be "10" sec or less