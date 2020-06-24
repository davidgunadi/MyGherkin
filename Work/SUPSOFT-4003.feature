Feature: SUPSOFT-4003

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
And "Platform Configuration in SA Menu" should be displayed

Scenario: navigate to Build Packages page
When I click on "Platform Configuration in SA Menu"
And I click on "Installation Management in SA Menu"
And I click on "Build Packages in SA Menu"
Then "Build Packages (Header)" should be displayed
And "Create MSI Package Button in Build Packages" should be displayed

Scenario: create MSI Package
Given "UniqueName" default value is "{date('YYYYMMDDmmss')}"
Given a stopwatch "Load Timer"
When I set "MSI Package Name Textbox in Build Packages" value to "MSIPackageName_{UniqueName}"
And I set "Product Name Textbox in Build Packages" value to "ProdName_{UniqueName}"
And I click on "Create as Client Package Checkbox in Build Packages"
And I click on "Select All Checkbox for Admin Tools Under Select DNA for MSI Package in Build Packages"
And I reset the stopwatch "Load Timer"
And I start the stopwatch "Load Timer"
And I click on "Create MSI Package Button in Build Packages"
And I wait until "Build completed without critical errors Message in Build Packages" appears
And I stop the stopwatch "Load Timer"
Then the stopwatch "Load Timer" value should be "10" sec or less