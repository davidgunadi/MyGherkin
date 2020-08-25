Feature: STREETSMART-238 Admin - Companies - HIPAA - Enable

As a Root Super Admin, I want to be able to enable HIPAA for the company when I am in the administration dashboard
This is consistent because Root Super Admin should be able to Enable HIPAA to the company

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "StreetSmart CRT" from "https://confluence.devfactory.com/display/SAASOPS/Environment+description+YAML"
Given credentials "Root Super Admin"

Scenario: Precondition - Create a Company to Enable HIPAA On
Given browser "Chrome"
When I execute scenario "STREETSMART-242" to capture outputs "GeneratedCompanyName"
Then scenario steps should complete successfully

Scenario: Click on the Company generated in Precondition
When I click on "GeneratedCompanyName Record in Company Table"
Then "Popup Options for Company" should be displayed

Scenario: Click on "Enable HIPAA" from the list
When I click on "Enable HIPAA"
Then "Enable HIPAA Dialog" should be displayed

Scenario: Click OK
When I click on "OK Button (in Dialog)"
Then "HIPAA has been enabled successfully" should be displayed

Scenario: Click OK
When I click on "OK Button (in Dialog)"
Then "HIPAA has been enabled successfully" should not be displayed