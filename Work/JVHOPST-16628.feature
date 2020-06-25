Feature: JVHOPST-19695

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Default SE7 environment" from "https://confluence.devfactory.com/x/g1nsGg"
Given credentials "regular_user1"

Scenario: Login as 'doll.tearsheet@aurea.com'
Given browser "Chrome"
When I open "{environment.Jive HOP web application.URL}"
And I click on "Email Address input field"
And I type "{credentials.regular_user1.username}"
And I click on "Password input field"
And I type "{credentials.regular_user1.password}"
And I click on "Sign in button"
Then "Main" page should be displayed

Scenario: Open Create Event Page
When I click on "Pencil icon"
And I click on "Event link"
Then "Create a new event" page should be displayed

Scenario: Create a Event
Given "NextMonthDateInMMDYYYY" default value is "{date('MM/D/YYYY','30 days')}"
Given "NextMonthDateInMMMDYYYY" default value is "{date('MMM D','30 days')}"
When I set "Event title" value to "TestEvent"
And I set "Event Location" value to "zoom"
And I click on "The Main Community (Label)"
And I set "Start date" value to "{NextMonthDateInMMDYYYY}"
And I click on "Create event - button"
Then "TestEvent | Main" page should be displayed
And I should see "{NextMonthDateInMMMDYYYY}" in "Start Time Value"