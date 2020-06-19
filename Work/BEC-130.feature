Feature: BEC-130

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Beckon Web App QA" from "https://confluence.devfactory.com/display/BEC/Manual+Testing+Environments"
Given credentials "beckonqa"

Scenario: Log in
Given browser "Chrome"
Given "currentDateTime" value is the current datetime "+0 milliseconds"
When I open "{environment.Web Application.Login URL}"
And I click on "Username Input"
And I type "{credentials.beckonqa.username}"
And I click on "Password Input"
And I type "{credentials.beckonqa.password}"
And I click on "Sign In Button"
Then "Logged In Icon Logo" should be displayed

Scenario: Navigate to Calculated Metrics page
When I click on "Model Menu"
And I click on "Calculated Metrics Link"
Then "Calculated Metrics (Header)" should be displayed

Scenario: Navigate to new calculated metric page 
When I click on "Create New Calculated Metric"
Then "New Calculated Metrics Title" should be displayed

Scenario: Enter calculated metric name
When I click on "New Calculated Metrics Title"
And I type slowly "TestCalcMetric_{currentDateTime}"
And I press "ENTER"
Then I should see "TestCalcMetric_{currentDateTime}" in "Human ID Textbox"

Scenario: Enter calculated metric description
When I click on "New Calculated Metrics Description"
And I type slowly "Desc_{currentDateTime}"
And I press "ENTER"
Then I should see "Desc_{currentDateTime}" in "New Calculated Metrics Description"

Scenario: Click on Format dropdown
When I click on "Format Dropdown (in Calculated Metrics Page)"
Then "Format Dropdown Item - CURRENCY" should be displayed
Then "Format Dropdown Item - DECIMAL" should be displayed
Then "Format Dropdown Item - PERCENTAGE" should be displayed

Scenario: Select Format
When I click on "Format Dropdown Item - DECIMAL"
Then I should see "DECIMAL" in "Format Dropdown (in Calculated Metrics Page)"

Scenario: Select Frequency
When I click on "Frequency Dropdown (in Calculated Metrics Page)"
And I click on "Frequency Dropdown Item - Monthly"
Then I should see "Monthly" in "Frequency Dropdown (in Calculated Metrics Page)"

Scenario: Click on Goal dropdown
When I click on "Goal Dropdown (in Calculated Metrics Page)"
Then "Goal Dropdown Item - MINIMIZE" should be displayed
Then "Goal Dropdown Item - MAXIMIZE" should be displayed

Scenario: Select Goal
When I click on "Goal Dropdown Item - MAXIMIZE"
Then I should see "MAXIMIZE" in "Goal Dropdown (in Calculated Metrics Page)"

Scenario: Click on Priority dropdown
When I click on "Priority Dropdown (in Calculated Metrics Page)"
Then "Priority Dropdown Item - PRIMARY" should be displayed
Then "Priority Dropdown Item - STANDARD" should be displayed
Then "Priority Dropdown Item - HIDDEN" should be displayed

Scenario: Select Priority
When I click on "Priority Dropdown Item - STANDARD"
Then I should see "STANDARD" in "Priority Dropdown (in Calculated Metrics Page)"

Scenario: Select Operations
When I click on "Operations Dropdown (in Calculated Metrics Page)"
And I click on "Search Field in Dropdown"
And I type "Division"
And I click on "Operations Dropdown - Operations > Division"
And I click on "Numerator Dropdown (in Calculated Metrics Page)"
And I click on "Search Field in Dropdown"
And I type "[B] Avg paid"
And I click on "First Item in Dropdown"
And I click on "Denominator Dropdown (in Calculated Metrics Page)"
And I click on "Search Field in Dropdown"
And I type "[B] Avg paid"
And I click on "Second Item in Dropdown"
And I click on "Save Button (in Calculated Metrics Page)"
Then "Calculated Metrics (Header)" should be displayed
And I should see "TestCalcMetric_{currentDateTime}" in "Save Success Message (after Saving Calculated Metrics Page)"

Scenario: Search for created calculated metric
When I click on "Search All Columns Input"
And I type "TestCalcMetric_{currentDateTime}"
Then I should see "TestCalcMetric_{currentDateTime}" in "Name Column In First Row Of Calculated Metrics Table"