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
And I set "product1" to "Name Textbox (in Create New Product Form)" value
And I set "product desc" to "Description Textbox (in Create New Product Form)" value
And I set "1542" to "CUSIP Textbox (in Create New Product Form)" value
And I click on "Product Type Dropdown (in Create New Product Form)"
And I click on "DIS - Disability (Dropdown Option)"
And I click on "Jurisdiction(s) Dropdown (in Create New Product Form)"
And I click on "Alabama (Dropdown Option)"



select a value(e.g. DIS-Disablity) in the "Product Type" drop-down field,
select a value(e.g. Alabama) in the "Jurisdiction(s)" drop-down field.
Then click on the "Validate" button in the page.	
The "VALIDATING...SUCCESSFUL" message is shown in the page near the "Validate" button.

Scenario: 
Click on the "Save" button.	
It saves a new product record in the database, the "Create New Product" page is closed, the product field values are displayed in the "RESULTS OF PRODUCT SEARCH" in the page.
