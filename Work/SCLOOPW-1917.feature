Feature: SCLOOPW-1917

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Beckon Web App QA" from "https://confluence.devfactory.com/display/BEC/Manual+Testing+Environments"
Given credentials "beckonqa"
Given "currentDateTime" value is the current datetime "+0 milliseconds"

Scenario: Log in
Given browser "Chrome"
When I open "{environment.Web Application.Login URL}"
And I click on "Username Input"
And I type "{credentials.beckonqa.username}"
And I click on "Password Input"
And I type "{credentials.beckonqa.password}"
And I click on "Sign In Button"
Then "Logged In Icon Logo" should be displayed

Scenario: Navigate to Dashboards
When I click on "Insights menu"
And I click on "Dashboards Link"
Then "Available Dashboards (Heading)" should be displayed

Scenario: Create Dashboard
When I click on "Create New Dashboard"
And I click on "Dashboard Title (in Create Page)"
And I type slowly "BEC63_{currentDateTime}"
And I press "TAB"
And I click on "Dashboard Description (in Create Page)"
And I type slowly "Desc_{currentDateTime}"
And I press "TAB"
Then I should see "BEC63_{currentDateTime}" in "Dashboard Title (in Create Page)"
And I should see "Desc_{currentDateTime}" in "Dashboard Description (in Create Page)"

Scenario: Create Text Card
When I hover on "Plus Icon (in Create Page)"
And I click on "Add Text (in Create Page)"
Then "Add New Text Card Header (in Create Page)" should be displayed

Scenario: Populate and save Text Card
When I click on "Add New Text Card Text Editor (in Create Page)"
And I type slowly "Text Card_{currentDateTime}"
And I click on "Save button in add text card popup"
Then I should see "Text Card_{currentDateTime}" in "First Text Card in Dashboard (in Create Page)"