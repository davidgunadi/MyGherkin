Feature: SCLOOPW-1917

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "teacher3"

Scenario: Access Site
Given browser "Chrome"
When I open "{environment.Teacher Usage District.URL}"
Then "Teacher Usage Stats Districts (Header)" should be displayed

Scenario: Select Any District
When I click on "District Name (First Item)"
And I switch to second window
Then "Report Date" should be displayed

Scenario: Sort by School Header
When I click on "SCHOOLS (Table Header)"
Then "SCHOOLS (Sorted Descending)" should be displayed

Scenario: Sort by School Header Again
When I click on "SCHOOLS (Table Header)"
Then "SCHOOLS (Sorted Ascending)" should be displayed

Scenario: Check Teacher's Help Text
When I hover on "Question Mark Icon (for TEACHERS)"
Then "Question Mark Icon Help Text (for TEACHERS)" should be displayed

Scenario: Check Published Within Dropdown
When I click on "Published within dropdown"
Then "7 DAYS (Published within dropdown value)" should be displayed
And "14 DAYS (Published within dropdown value)" should be displayed