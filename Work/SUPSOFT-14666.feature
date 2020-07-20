Feature: SUPSOFT-14666

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Browser: Login to User Center
Given browser "Internet Explorer"
When I open "{environment.SupportSoft User Center portal.URLLogin}"
And I set "Username in UC Login Page" value to "{credentials.Administrator.username}"
And I set "Password in UC Login Page" value to "{credentials.Administrator.password}"
And I click on "Login Button in UC Login Page"
Then "Proactive Assist User Center" page should be displayed