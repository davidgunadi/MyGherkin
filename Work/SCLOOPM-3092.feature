Feature: SCLOOPM-3092

As a student, I want to be able to access my calendar when I need to create new event
This is accessible because student should be able to access his/her calendar

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "stu65"

Scenario: Login to Site as Student
Given browser "Chrome"
When I open "{environment.Gradebook.Login URL}"
And I set "Username" value to "{credentials.stu65.username}"
And I set "Password" value to "{credentials.stu65.password}"
And I click on "Login"
Then "VANESSA Alonzo Portal" page should be displayed

Scenario: Access My Calendar
When I click on "My Calendar"
Then "Calendar" page should be displayed

Scenario: Click on "Add Events"
When I click on "Add Events Drop-down"
Then "General Event Option" should be displayed
And "Personal Item Option" should be displayed

Scenario: Select General event"
When I click on "General Event Option"
Then "New Event" page should be displayed

Scenario: Enter Details and Publish
Given "GeneratedEventTitle" default value is "Event_{random_string(6)}"
And "TomorrowDate" default value is "{date('MM/DD/YYYY','1 days')}"
When I set "Event Title" value to "{GeneratedEventTitle}"
And I click on "Description"
And I type "Sample Description"
And I "check" "Website Checkbox Inside Audience" checkbox
And I "check" "Groups Checkbox Inside Audience" checkbox
And I set "the 'Start Time - Hours' dropdown in the 'WHEN AND WHERE' section on 'New Event' page" value to "10 am"
And I set "the 'End Time - Hours' dropdown in the 'WHEN AND WHERE' section on 'New Event' page" value to "10 pm"
And I set "the 'Date' dropdown in the 'WHEN AND WHERE' section on 'New Event' page" value to "{TomorrowDate}"
And I click on "Publish Button on Events Page"
Then "Event Published Success Message" should be displayed