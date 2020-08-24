Feature: STREETSMART-256 Mission Control Home - login - Secure

As a valid user, I should be able to login in StreetSmart main page when I'm on StreetSmart login page
This is secure because User should be able to log in on StreetSmart main page with the valid credentials only

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "StreetSmart CRT" from "https://confluence.devfactory.com/display/SAASOPS/Environment+description+YAML"
Given credentials "Company Super Admin"

Scenario: Open login page
Given browser "Chrome"
When I open "{environment.Web Site MC.URL}"
Then "Streetsmart Login page" should be displayed

Scenario: Enter invalid credentials
When I set "Username textbox(in Login page)" value to "fakeuser"
And I set "Password textbox(in Login page)" value to "wrongPassw0rd"
And I set "Company ID textbox(in Login page)" value to "12345"
And I click on "Login button(in Login page)"
Then I should see "Invalid login." in "Error message"

Scenario: Enter valid credentials
When I set "Username textbox(in Login page)" value to "{credentials.Company Super Admin.proposed_fields.username}"
And I set "Password textbox(in Login page)" value to "{credentials.Company Super Admin.proposed_fields.password}"
And I set "Company ID textbox(in Login page)" value to "{credentials.Company Super Admin.proposed_fields.domain}"
And I click on "Login button(in Login page)"
Then I should see "Welcome" in "Top bar"