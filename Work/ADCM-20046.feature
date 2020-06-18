Feature: ADCM-20046

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Develop Branch Enterprise ( Next Release Version )" from "https://confluence.devfactory.com/display/ADCM/DCM+Environments+Data+Structure"
Given credentials "DCM system admin default credentials"
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"

Scenario: Log in as DCM System Admin Default Credentials
Given browser "Chrome"
When I open "{environment.DCM UI.URL}"
And I set "{credentials.DCM system admin default credentials.username}" to "User Name field" value
And I set "{credentials.DCM system admin default credentials.password}" to "Password field" value
And I click on "Login button"
Then "Welcome" should be displayed

Scenario: Navigate to Party Tab
When I click on "Party Top Navigation Tab"
Then "Party Search Label" should be displayed

Scenario: Select Search Organization
When I click on "Search Person Dropdown (in Party Page)"
And I click on "Search Organization (Dropdown Item)"
Then "Create Organization Button" should be displayed

Scenario: Click Create Organization
When I click on "Create Organization Button"
Then "Create New (Header)" should be displayed

Scenario: Fill in the New Organization Form and Validate

Scenario: Save and Confirm Organization is Created