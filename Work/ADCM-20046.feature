Feature: ADCM-20046

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Develop Branch Enterprise ( Next Release Version )" from "https://confluence.devfactory.com/display/ADCM/DCM+Environments+Data+Structure"
Given credentials "DCM system admin default credentials"
Given "currentDateInMMDDYYYY" default value is "{date('MMDDYYYY')}"
Given "TaxID" default value is "{date('MMDDhhmmss')}"

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
When I set "TestOrganization1" to "Name (in Create New Organization Form)" value
And I click on "Appointing Company Checkbox (in Create New Organization Form)"
And I click on "Contract Kit Provider Checkbox (in Create New Organization Form)"
And I click on "Distributor Checkbox (in Create New Organization Form)"
And I set "{TaxID}" to "Tax ID/SSN (in Create New Organization Form)" value
And I click on "Synchronize with PDB (in Create New Organization Form)"
And I click on "No (Dropdown Option)"
And I click on "Agency Formation Date (in Create New Organization Form)"
And I type "{currentDateInMMDDYYYY}"
And I set "1234" to "DTCC ID (in Create New Organization Form)" value
And I set "123456" to "National Producer Number (in Create New Organization Form)" value
And I set "Entrepreneur" to "Doing Business As (in Create New Organization Form)" value
And I click on "Comm Mode to Try First (in Create New Organization Form)"
And I click on "Mailing (Dropdown Option)"
And I set "1234,NE" to "Street1 (in Create New Organization Form)" value
And I set "Wall Street" to "Street2 (in Create New Organization Form)" value
And I set "Aden" to "Street3 (in Create New Organization Form)" value
And I set "Utah" to "City (in Create New Organization Form)" value
And I set "112332" to "ZipCode (in Create New Organization Form)" value
And I set "9988776655" to "Phone Number (in Create New Organization Form)" value
And I set "9988776655" to "Cell Phone Number (in Create New Organization Form)" value
And I set "12323442" to "Fax Number (in Create New Organization Form)" value
And I set "asd@test.com" to "Email Address (in Create New Organization Form)" value
And I set "23211" to "Pager Number (in Create New Organization Form)" value
And I click on "Validate Button"
Then "Validating Successful Message" should be displayed

Scenario: Click Save and Validate
When I click on "Save Button"
Then "TestOrganization1 in First Row in Result of Party Search" should be displayed