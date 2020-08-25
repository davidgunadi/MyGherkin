Feature: STREETSMART-98 My Settings - Redirected to login Page - Secure

As a Company Admin user, I should get redirected to Login page when the session is lost and I try to open My Settings
This is secure because User should get redirected to login when the session is lost

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "StreetSmart CRT" from "https://confluence.devfactory.com/display/SAASOPS/Environment+description+YAML"
Given credentials "Company Super Admin"

Scenario: Login to MC Website as "Company Super Admin"
Given browser "Chrome"
When I open "{environment.Web Site MC.URL}"
And I set "Username textbox(in Login page)" value to "{credentials.Company Super Admin.proposed_fields.username}"
And I set "Password textbox(in Login page)" value to "{credentials.Company Super Admin.proposed_fields.password}"
And I set "Company ID textbox(in Login page)" value to "{credentials.Company Super Admin.proposed_fields.domain}"
And I click on "Login button(in Login page)"
Then "Logout" should be displayed

Scenario: Navigate to My Settings at the right top of the page
When I click on "My Settings"
Then "Jobs tab" should be displayed
And "Peripherals tab" should be displayed
And "Personalization tab" should be displayed
And "Reports tab" should be displayed
And "Security tab" should be displayed
And "Terminology tab" should be displayed
And I remember current url as "DirectURL"

Scenario: Copy URL and open it in Incognito Window
Given browser "Chrome" as "Incognito Window"
When I open "{DirectURL}" in "Incognito Window"
Then "Login" page should be displayed in "Incognito Window"
And "You have to log in before inputting an address into the Address Bar" should be displayed in "Incognito Window"