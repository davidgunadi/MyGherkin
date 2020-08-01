Feature: JVANLT-5386

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Jive Analytics E2E" from "https://confluence.devfactory.com/display/EN/Jive+Analytics+-+E2E+Environment+Data"
Given credentials "ca user"

Scenario: Login as Admin
Given browser "Chrome"
When I open "{environment.Jive Cloud.URL}"
And I set "Email Address input field" value to "{credentials.ca user.username}"
And I set "Password input field" value to "{credentials.ca user.password}"
And I click on "Sign in button"
Then "Welcome" page should be displayed

Scenario: Admin user navigates to Avatar icon -> Community Analytics
When I click on "Avatar icon"
And I click on "Community Analytics menu item"
#url contains analytics
#id=j-user-interaction-chart

Scenario: Admin user navigates to Avatar icon -> Analytics Export
#Page is loaded properly

Scenario: Admin user navigates BACK (browser button) then clicks on Avatar icon -> View Profile -> Insights
#Page is loaded properly and displays some data

Scenario: Admin user navigates to any Avatar icon -> Your Places -> Any Place -> Analytics
#	Place Analytics page is loaded and displays some data

Scenario: Admin clicks on Avatar icon -> Your content -> opens any document in jive
#Document is opened

Scenario: Admin user navigates to Impact metrics
#Impact metrics popup dialog is opened and it displays some data