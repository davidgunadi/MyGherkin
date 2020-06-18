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

Scenario: Go to Party

Scenario: Select Search Organization

Scenario: Click Create Organization and Validate

Scenario: Save and Confirm Organization is Created