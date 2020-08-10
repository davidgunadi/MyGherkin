Feature: SCLOOPW-11328

As an admin, I can login into my account so that I can see the calendar events load fast

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "admin"

Scenario: Login to SchoolLoop website using precondition credentials and website url
Given browser "Chrome"
When I open "{environment.Gradebook.Login URL}"
And I set "Username" value to "{credentials.admin.username}"
And I set "Password" value to "{credentials.admin.password}"
And I click on "Login"
Then "Logout" should be displayed

Scenario: Verify Tooltip for the third icon	In the "Calendar" section, at right side
When I scroll to the element "View Month Icon (the third icon in Calendar section, on the top right hand side)"
And I hover on "View Month Icon (the third icon in Calendar section, on the top right hand side)"
Then I remember a value from "title" attribute of "View Month Icon (the third icon in Calendar section, on the top right hand side)" as "MonthTooltip"
And the value of "MonthTooltip" should be equal to "Click to view the month"

Scenario: Click on the icon in above step and verify page is opened in timely manner
Given a stopwatch "Timer"
When I start the stopwatch "Timer"
And I click on "View Month Icon (the third icon in Calendar section, on the top right hand side)"
Then "Month Calendar View (in Calendar Page)" should be displayed

Scenario: Click on the icon in above step and verify page is opened in timely manner
When I stop the stopwatch "Timer"
Then the stopwatch "Timer" value should be "5" sec or less