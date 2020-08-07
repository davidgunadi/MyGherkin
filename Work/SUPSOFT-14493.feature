Feature: SUPSOFT-14493

As an administrator, I should be able to delete a generated code in less than 4 seconds, when I am in the Support Center Web portal.
This is fast because Generated code should be removed from the table in less than 4 seconds.

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Precondition - Run SUPSOFT-17692 to generate a new user with code
Given browser "Chrome"
When I execute scenario "SUPSOFT-17692" to capture outputs "GeneratedRandomUser"
Then scenario steps should complete successfully

Scenario: Delete Generated Code for User
Given a stopwatch "Timer"
When I click on "Delete Icon for GeneratedRandomUser in Generate Connection Code Table"
And I start the stopwatch "Timer"
And I wait until "GeneratedRandomUser in Generate Connection Code Table" disappears
And I stop the stopwatch "Timer"
Then "GeneratedRandomUser in Generate Connection Code Table" should not be displayed
And the stopwatch "Timer" value should be "4" sec or less