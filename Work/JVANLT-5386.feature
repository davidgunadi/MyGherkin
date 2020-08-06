Feature: JVANLT-5386

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Jive Analytics E2E" from "https://confluence.devfactory.com/display/EN/Jive+Analytics+-+E2E+Environment+Data"
Given credentials "caadmin"

Scenario: Login as Admin
Given browser "Chrome"
When I open "{environment.Jive Cloud.URL}"
And I set "Email Address input field" value to "{credentials.caadmin.username}"
And I set "Password input field" value to "{credentials.caadmin.password}"
And I click on "Sign in button"
Then "Welcome" page should be displayed

Scenario: Admin user navigates to Avatar icon -> Community Analytics
When I click on "Avatar icon"
And I click on "Community Analytics menu item"
Then "Chart (in Engagement Dashboard Page)" should be displayed

Scenario: Admin user navigates to Avatar icon -> Analytics Export
When I wait for "3" seconds
And I click on "Avatar icon"
And I click on "Analytics Export menu item"
Then "DES Explorer (Header)" should be displayed

Scenario: Admin user navigates BACK (browser button) then clicks on Avatar icon -> View Profile -> Insights
When I open "{environment.Jive Cloud.URL}"
And I click on "Avatar icon"
And I click on "View Profile menu item"
And I click on "Insights tab"
Then "Insights tab is loaded properly and data" should be displayed

Scenario: Admin user navigates to any Avatar icon -> Your Places -> Any Place -> Analytics
When I click on "Avatar icon"
And I click on "Your Places menu item"
And I click on "All Link (in Places Page)"
And I click on "First Place in the List"
And I click on "Analytics tab"
Then "Place Analytics tab is loaded and data" should be displayed

Scenario: Admin clicks on Avatar icon -> Your content -> opens any document in jive
When I click on "Avatar icon"
And I click on "Your Content menu item"
And I click on "All Link (in Content Page)"
And I click on "Documents Link (at the top bar in Content Page)"
And I click on "First Document in the List"
Then "Document Detail Header" should be displayed

Scenario: Admin user navigates to Impact metrics
When I hover on "Impact Metrics widget in bottom right corner of the Document"
When I click on "Impact Metrics widget in bottom right corner of the Document"
Then "Impact Metrics - Modal" should be displayed