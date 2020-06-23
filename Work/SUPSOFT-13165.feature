Feature: SUPSOFT-13165

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"
Given credentials "Analyst"

Scenario: Navigate to "Support Center Web Portal"
Given browser "Internet Explorer"
When I open "{environment.SupportSoft Support Center portal.URL}"
And I set "{credentials.Analyst.username}" to "Username Textbox in SC Login Page" value
And I set "{credentials.Analyst.password}" to "Password Textbox in SC Login Page" value
And I click on "Login Button in SC Login Page"
Then "LiveAssist Menu Item in SC Left Menu" should be displayed

Scenario: Navigate to "Live Assist > Chat"
When I click on "LiveAssist Menu Item in SC Left Menu"
And I click on "Chat Sub Menu Item under Liveassist"
And I switch to second window
Then "CSR Chat Window" page should be displayed