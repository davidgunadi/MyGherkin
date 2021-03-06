Feature: SUPSOFT-4003

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environment * QA : Make rdp to "SupportSoft Server"" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "* Administrator credential should be used."

Scenario: Browser: Login to SupportSoft Administrator portal
Given browser "Internet Explorer"
When I set "Administrator.username" to "Username In SA Login Page" value
And I set "Administrator.password" to "Password In SA Login Page" value
And I click on "Login Button In SA Login Page"
Then "Welcome to the Support Administrator" page should be displayed
And "Platform Configuration in SA Menu" should be displayed

Scenario: navigate to Build Packages page
When I click on "Platform Configuration In SA Menu" 
And I click on "Installation Management in SA Menu"
And I click on "Build Packages in SA Menu"
Then "Build Packages" page should be displayed
And "Create MSI Package Button in Build Packages" should be displayed

Scenario: create MSI Package
Given a stopwatch "Load Timer"
When I set "AAA Unique Package Name" to "MSI Package Name Textbox in Build Packages" value
And I set "AAA Unique Product Name" to "Product Name Textbox in Build Packages" value
And I "check" "Create as Client Package Checkbox in Build Packages" checkbox
And I "check" "Select All Checkbox for Admin Tools Under Select DNA for MSI Package in Build Packages" checkbox
And I reset the stopwatch "Load Timer"
And I start the stopwatch "Load Timer"
And I click on "Create MSI Package Button in Build Packages"
And I wait unless "Build completed without critical errors Message in Build Packages" appears
And I stop the stopwatch "Load Timer"
Then the stopwatch "Load Timer" value should be "10" sec or less