Feature: SCLOOPW-7857

As a Parent I should be able to see progress report when using the website
This is accessible because Parent should be able to access progress report

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "par65"

Scenario: Login to Site
Given browser "Chrome"
When I open "{environment.Gradebook.Login URL}"
And I set "Username" value to "{credentials.par65.username}"
And I set "Password" value to "{credentials.par65.password}"
And I click on "Login"
Then "par65 Alonzo's Portal" page should be displayed

Scenario: Click Progress Report for ENG 3 SPR P
When I click on "Progress Report for ENG 3 SPR P"
Then "Progress Report" page should be displayed

Scenario: Click All Progress Report dropdown
When I click on "All Progress Report Dropdown"
Then "Option 'FALL - 12/31/18' under All Progress Reports Dropdown" should be displayed

Scenario: Click FALL - 12/31/18, Click go
When I click on "Option 'FALL - 12/31/18' under All Progress Reports Dropdown"
And I click on "Progress Report Go Button"
Then "Assessment Table (in Progress Report Page)" should be displayed
And "Cell containing the date '7/12/18'" should be displayed