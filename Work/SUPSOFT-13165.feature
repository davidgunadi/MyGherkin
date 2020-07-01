Feature: SUPSOFT-13165

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator" and "Analyst"

Scenario: Navigate to "Support Center Web Portal" and Login as Analyst
Given browser "Internet Explorer BrowserStack" as "Analyst Instance"
When I open "{environment.SupportSoft Support Center portal.URL}" in "Analyst Instance"
And I set "{credentials.Analyst.username}" to "Username Textbox in SC Login Page" value in "Analyst Instance"
And I set "{credentials.Analyst.password}" to "Password Textbox in SC Login Page" value in "Analyst Instance"
And I click on "Login Button in SC Login Page" in "Analyst Instance"
Then "LiveAssist Menu Item in SC Left Menu" should be displayed in "Analyst Instance"

Scenario: Navigate to "Live Assist > Chat" then Logout
When I click on "LiveAssist Menu Item in SC Left Menu" in "Analyst Instance"
And I click on "Chat Sub Menu Item under Liveassist" in "Analyst Instance"
And I switch to second window in "Analyst Instance"
Then "CSR Chat Window" page should be displayed in "Analyst Instance"

Scenario: Login as Admin
Given browser "Internet Explorer BrowserStack" as "Admin Instance"
When I open "{environment.SupportSoft Support Center portal.URL}" in "Admin Instance"
When I set "{credentials.Administrator.username}" to "Username Textbox in SC Login Page" value in "Admin Instance"
And I set "{credentials.Administrator.password}" to "Password Textbox in SC Login Page" value in "Admin Instance"
And I click on "Login Button in SC Login Page" in "Admin Instance"
Then "LiveAssist Menu Item in SC Left Menu" should be displayed in "Admin Instance"

Scenario: Go to "LiveAssist > Analyst Monitor"
When I click on "LiveAssist Menu Item in SC Left Menu" in "Admin Instance"
And I click on "Analyst Monitor Sub Menu Item under Liveassist" in "Admin Instance"
Then "Analyst Monitor (Heading)" should be displayed in "Admin Instance"
And "Status Filter Listbox (in Analyst Monitor)" should be displayed in "Admin Instance"
And "Available Option (in Status Filter Listbox)" should be displayed in "Admin Instance"
And "Unavailable Option (in Status Filter Listbox)" should be displayed in "Admin Instance"
And "Full Name (Table Header, in Analyst Monitor)" should be displayed in "Admin Instance"
And "Login Name (Table Header, in Analyst Monitor)" should be displayed in "Admin Instance"
And "Chat Window (Table Header, in Analyst Monitor)" should be displayed in "Admin Instance"
And "Status (Table Header, in Analyst Monitor)" should be displayed in "Admin Instance"
And "Refresh Button (in Analyst Monitor)" should be displayed in "Admin Instance"
And "Analyst (Cell, in Agent Window Status Table)" should be displayed in "Admin Instance"

Scenario: Select "Available" in "Status Filter" textbox and click on "Refresh" button in "Admin Instance"
When I set "Status Filter Listbox (in Analyst Monitor)" value to "Available" in "Admin Instance"
And I click on "Refresh Button (in Analyst Monitor)" in "Admin Instance"
Then "Analyst (Cell, in Agent Window Status Table)" should not be displayed in "Admin Instance"

Scenario: Select "Unavailable" in "Status Filter" textbox and click on "Refresh" button in "Admin Instance"
When I set "Status Filter Listbox (in Analyst Monitor)" value to "Unavailable" in "Admin Instance"
And I click on "Refresh Button (in Analyst Monitor)" in "Admin Instance"
Then "Analyst (Cell, in Agent Window Status Table)" should be displayed in "Admin Instance"