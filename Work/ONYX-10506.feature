Feature: ONYX-10506

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "SE7 Automation QA" from "https://confluence.devfactory.com/display/AVOLIN/Onyx+Environments"
Given credentials "OEP"

Scenario: Open OEP homepage
Given browser "Chrome"
When I open "{environment.OEP.URL}"
Then "Onyx Customer Management" page should be displayed

Scenario: Login
When I set "{credentials.OEP.username}" to "OEP User ID" value
And I set "{credentials.OEP.password}" to "OEP Password" value
And I click on "SIGN IN"
Then "Custom action page" should be displayed

Scenario: Define action to enter the system
When I set "{credentials.OEP.type}" to "OEP User Type" value
And I click on "GO"
Then "application_main page" should be displayed