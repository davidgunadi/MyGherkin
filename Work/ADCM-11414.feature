Feature: ADCM-11414

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Develop Branch Enterprise ( Next Release Version )" from "https://confluence.devfactory.com/display/ADCM/DCM+Environments+Data+Structure"
Given credentials "DCM system admin default credentials"

Scenario: Log in as DCM System Admin Default Credentials
Given browser "Chrome"
When I open "{environment.DCM UI.URL}"
And I set "{credentials.DCM system admin default credentials.username}" to "User Name field" value
And I set "{credentials.DCM system admin default credentials.password}" to "Password field" value
And I click on "Login button"
Then "Welcome" should be displayed

Scenario: Navigate to Hierarchy
When I click on "Hierarchy Top Navigation Tab"
And I refresh the page
Then "Hierarchy Search Label" should be displayed

Scenario: Open "Product Search"
When I click on "Product Search (in Sidebar)"
And I refresh the page
Then "Product Hierarchy Search Label" should be displayed

Scenario: Select "Search Product" in the Search Dropdown
When I click on "Search Dropdown (in Product Search)"
And I click on "Search Product (Dropdown Option)"
Then "New Product Button" should be displayed

Scenario: Click on New Product
When I click on "New Product Button"
Then "Create New (Header)" should be displayed

Scenario: Fill in New Product Form and Validate
When I set "product1" to "Name Textbox (in Create New Product Form)" value
And I set "product desc" to "Description Textbox (in Create New Product Form)" value
And I set "1542" to "CUSIP Textbox (in Create New Product Form)" value
And I click on "Product Type Dropdown (in Create New Product Form)"
And I click on "DIS - Disability (Dropdown Option)"
And I click on "Jurisdiction(s) Dropdown (in Create New Product Form)"
And I click on "Alabama (Dropdown Option)"
And I click on "Validate Button"
Then "Validating Successful Message" should be displayed

Scenario: Click Save and Validate
When I click on "Save Button"
Then "Product1 in First Row in Result of Product Search Grid" should be displayed