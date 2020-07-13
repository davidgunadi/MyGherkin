Feature: KAYAKOC-11606

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Manual QA" from "https://confluence.devfactory.com/display/KAYAK/E2E+Environment+Data+Structure"
Given credentials "qa-admin" and "qa-staff"

Scenario: Go to Support Center
Given browser "Chrome"
When I open "{environment.qa-visitor.URL}"
Then "Kayako" page should be displayed

Scenario: Test the search widget
When I set "Search Textbox (in Middle of Screen)" value to "test"
And I press "ENTER"
Then "First Search Result Record (in Search Results)" should be displayed
And I remember a value from "First Search Result Record (in Search Results)" as "SearchResultRecord"

Scenario: Click on a news article
When I click on "First Search Result Record (in Search Results)"
Then "{SearchResultRecord}" page should be displayed

Scenario: Go to Support Center > Knowledge Base
When I click on "Knowledgebase (Link, at the top bar)"
Then "List of Item (in Knowledgebase Page)" should be displayed
And I remember a value from "First Item under Knowledgebase Table" as "KBRecord"

Scenario: Click on an article
When I click on "First Item under Knowledgebase Table"
Then "{KBRecord}" page should be displayed

Scenario: Go to Staff
When I open "{environment.qa-staff.URL}"
And I set "staff-login-user" value to "{credentials.qa-staff.username}"
And I set "staff-login-password" value to "{credentials.qa-staff.password}"
And I click on "staff-login-submit"
Then "Dashboard" page should be displayed

Scenario: Go to Staff > Tickets > Manage Tickets
When I click on "Tickets (Link in Top Menu)"
And I click on "Manage Tickets (Link in Top Menu)"
Then "SUBJECT (Grid Title)" should be displayed
And I remember a value from "First Item Subject (in Manage Tickets Grid)" as "TicketRecord"

Scenario: Click on a ticket
When I click on "First Item Subject (in Manage Tickets Grid)"
Then "{TicketRecord}" page should be displayed

Scenario: Go to Admin
When I open "{environment.qa-staff.URL}"
And I set "admin-login-user" value to "{credentials.qa-admin.username}"
And I set "admin-login-password" value to "{credentials.qa-admin.password}"
And I click on "admin-login-submit"
Then "Dashboard" page should be displayed

Scenario: Go to Admin > Settings
When I click on "Settings Link (on Top Menu)"
Then "Settings Tab (in Right Hand Panel)" should be displayed

Scenario: Validate some links on the settings menu
When I click on "Date and time (in Settings List)"
Then "Settings > Date and time" page should be displayed

Scenario: Validate some links on the settings menu
When I click on "Settings Link (on Top Menu)"
And I click on "Knowledgebase (in Settings List)"
Then "Settings > Knowledgebase" page should be displayed

Scenario: Validate some links on the left side menu
When I click on "Apps (Link, in Left Menu)"
Then "Apps" page should be displayed

Scenario: Validate some links on the left side menu
When I click on "Logs (Link, in Left Menu)"
And I wait until "Error Log (Link, in Left Menu)" appears
And I click on "Error Log (Link, in Left Menu)"
Then "Error Log" page should be displayed

Scenario: Go to Diagnostics > PHP Info
When I click on "Diagnostics (Link, in Left Menu)"
And I wait until "PHP Info (Link, in Left Menu)" appears
And I click on "PHP Info (Link, in Left Menu)"
Then "PHP Info" page should be displayed
a