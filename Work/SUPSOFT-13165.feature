Feature: SUPSOFT-13165

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"
Given credentials "Analyst"

Scenario: Navigate to "Support Center Web Portal" and Login as Analyst
Given browser "Internet Explorer"
When I open "{environment.SupportSoft Support Center portal.URL}"
And I set "{credentials.Analyst.username}" to "Username Textbox in SC Login Page" value
And I set "{credentials.Analyst.password}" to "Password Textbox in SC Login Page" value
And I click on "Login Button in SC Login Page"
Then "LiveAssist Menu Item in SC Left Menu" should be displayed

Scenario: Navigate to "Live Assist > Chat" then Logout
When I click on "LiveAssist Menu Item in SC Left Menu"
And I click on "Chat Sub Menu Item under Liveassist"
And I click on "Logout Button in Top Menu (for Support Center)"
#And I switch to second window
#Then "CSR Chat Window" page should be displayed

Scenario: Login as Admin
#When I switch to main window
#And I click on "LiveAssist Menu Item in SC Left Menu"
#And I click on "Logout Button in Top Menu (for Support Center)
#When I open "{environment.SupportSoft Support Center portal.URL}"
When I set "{credentials.Administrator.username}" to "Username Textbox in SC Login Page" value
And I set "{credentials.Administrator.password}" to "Password Textbox in SC Login Page" value
And I click on "Login Button in SC Login Page"
Then "LiveAssist Menu Item in SC Left Menu" should be displayed

Scenario: Go to "LiveAssist > Analyst Monitor"
When I click on "LiveAssist Menu Item in SC Left Menu"
And I click on "Analyst Monitor Sub Menu Item under Liveassist"
Then "Analyst Monitor (Heading)" should be displayed
And "Status Filter Listbox (in Analyst Monitor)" should be displayed
And "Available Option (in Status Filter Listbox)" should be displayed
And "Unavailable Option (in Status Filter Listbox)" should be displayed
And "Full Name (Table Header, in Analyst Monitor)" should be displayed
And "Login Name (Table Header, in Analyst Monitor)" should be displayed
And "Chat Window (Table Header, in Analyst Monitor)" should be displayed
And "Status (Table Header, in Analyst Monitor)" should be displayed
And "Refresh Button (in Analyst Monitor)" should be displayed
And "Analyst (Cell, in Agent Window Status Table)" should be displayed

Scenario: Select "Available" in "Status Filter" textbox and click on "Refresh" button
When I click on "Available Option (in Status Filter Listbox)"
And I click on "Refresh Button (in Analyst Monitor)"
Then "Analyst (Cell, in Agent Window Status Table)" should not be displayed

Scenario: Select "Unavailable" in "Status Filter" textbox and click on "Refresh" button
When I click on "Unavailable Option (in Status Filter Listbox)"
And I click on "Refresh Button (in Analyst Monitor)"
Then "Analyst (Cell, in Agent Window Status Table)" should be displayed