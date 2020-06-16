Feature: BEC-130

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environments: * Beckon Web App QA
    * Beckon Web App Staging
   
   
 * Selectors * Username Input: //*[@id="login"]
    * Password Input: //*[@id="password"]
    * Sign In Button: //div[contains(text(), 'Sign In')]
    * Model menu: //div[contains(text(),'MODEL')]
    * Calculated Metrics link: //a[contains(text(),'Calculated Metrics')]
    * Create new calculated metric button: //div[text()='CREATE NEW CALCULATED METRIC']
    * New Calculated Metric title: //div[@empty-label='Click to add title']
    * Human Id field: //input[@label='Human Id']
    * Click to add description: //div[@empty-label='Click to add description']
    * Description: //div[@empty-label='Click to add description']
    * Format dropdown: //label[text()='Format']/following-sibling::div[contains(@class, 'dropdown')]
    * Dropdown items: //div[contains(@class, 'dropdown open')]//span[contains(@class, 'dropdown-item')]
    * Decimal option: //li//span[text()='DECIMAL']
    * Frequency dropdown: //label[text()='Frequency']/following-sibling::div[contains(@class, 'dropdown')]
    * Monthly option: //li//span[text()='Monthly']
    * Goal dropdown: //label[text()='Goal']/following-sibling::div[contains(@class, 'dropdown')]
    * Maximize option: //li//span[text()='MAXIMIZE']
    * Priority dropdown: //label[text()='Priority']/following-sibling::div[contains(@class, 'dropdown')]
    * Standard option: //div[contains(@class, 'dropdown open')]//li//span[text()='STANDARD']
    * Operations dropdown: //label[text()='Operations (required)']/following-sibling::div//a[contains(@class, 'dropdown')]
    * Dropdown search field: //div[contains(@class, 'open')]//div[contains(@class, 'dropdown-menu')]//input[@type='text']
    * Operations > Division: //a[contains(text(), 'Operations > ')]/strong[text()='Division']
    * Numerator dropdown: //div[contains(text(), 'Numerator')]//a[contains(@class, 'dropdown-toggle')]
    * First item in dropdown: (//div[contains(@class, 'open')]//div[contains(@class, 'dropdown-menu')]//li)[1]
    * Second item in dropdown: (//div[contains(@class, 'open')]//div[contains(@class, 'dropdown-menu')]//li)[2]
    * Denominator dropdown: //div[contains(text(), 'Denominator')]//a[contains(@class, 'dropdown-toggle')]
    * Save button: //a[text()='Save']
    * Save success message: //span[contains(text(), 'Your calculated metric') and contains(text(), 'was saved')]
    * Calculated metrics search field: //input[contains(@class, 'masterSearchBox')]
    * Calculated metrics names: //table//tbody//tr//td[1]/a/span" from "https://confluence.devfactory.com/display/BEC/Manual+Testing+Environments"
Given credentials "beckonqa"

Scenario: Log in
Given browser "Chrome"
When I open "<environment.endpoints.web application.Login URL>"
And I click on "Username Input"
And I type "<credentials.username>"
And I click on "Password Input"
And I type "<credentials.password>"
And I click on "Sign In Button"
Then "BECKON" page should be displayed

Scenario: Navigate to Calculated Metrics page
When I hover on "Model menu"
And I click on "Calculated Metrics link"
Then "CALCULATED METRICS" page should be displayed

Scenario: Navigate to new calculated metric page 
When I click on "Create new calculated metric button"
Then "NEW CALCULATED METRIC" page should be displayed

Scenario: Enter calculated metric name
When I click on "New Calculated Metric title"
And I type "Test Calculated Metric - <Current date and time, ex: 6/4/2020 23:30>"
And I press "ENTER"
Then I should see "Test Calculated Metric - <Current date and time, ex: 6/4/2020 23:30>" in "Human Id field"
And I put a value from "New Calculated Metric title" into "New_Calculated_Metric_Name"

Scenario: Enter calculated metric description
When I click on "Click to add description"
And I type "Test Calculated Metric Description"
And I press "ENTER"
Then I should see "Test Calculated Metric Description" in "Description"

Scenario: Click on Format dropdown
When I click on "Format dropdown"
Then I should see "CURRENCY" in "Dropdown items"
And I should see "DECIMAL" in "Dropdown items"
And I should see "PERCENTAGE" in "Dropdown items"

Scenario: Select Format
When I click on "Decimal option"
Then I should see "DECIMAL" in "Format dropdown"

Scenario: Select Frequency
When I click on "Frequency dropdown"
And I click on "Monthly option"
Then I should see "Monthly" in "Format dropdown"

Scenario: Click on Goal dropdown
When I click on "Goal dropdown"
Then I should see "MINIMIZE" in "Dropdown items"
And I should see "MAXIMIZE" in "Dropdown items"

Scenario: Select Goal
When I click on "Maximize option"
Then I should see "MAXIMIZE" in "Goal dropdown"

Scenario: Click on Priority dropdown
When I click on "Priority dropdown"
Then I should see "PRIMARY" in "Dropdown items"
AND I should see "STANDARD" in "Dropdown items"
AND I should see "HIDDEN" in "Dropdown items"

Scenario: Select Priority
When I click on "Standard option"
Then I should see "STANDARD" in "Priority dropdown"

Scenario: Select Operations
When I click on "Operations dropdown"
And I click on "Dropdown search field"
And I type "Division"
And I click on "Operations > Division"
And I click on "Numerator dropdown"
And I click on "Dropdown search field"
And I type "[B] Avg paid"
And I click on "First item in dropdown"
And I click on "Denominator dropdown"
And I click on "Dropdown search field"
And I type "[B] Avg paid"
And I click on "Second item in dropdown"
And I click on "Save button"
Then "CALCULATED METRICS" page should be displayed
And I should see "Your calculated metric <New_Calculated_Metric_Name> was saved." in "Save success message"

Scenario: Search for created calculated metric
When I click on "Calculated metrics search field"
And I type "<New_Calculated_Metric_Name>"
Then I should see "<New_Calculated_Metric_Name>" in "Calculated metrics names"