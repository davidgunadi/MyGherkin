Feature: SNSGCID-66377

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "development" from "https://confluence.devfactory.com/display/SEN/Sensage+EnvDS"
Given credentials "TEST-66377"

Scenario: Login
Given browser "Chrome"
When I open "{environment.analyzer-ui-single-node.URL}"
And I set "Username field" value to "{credentials.TEST-66377.username}"
And I set "Password field" value to "{credentials.TEST-66377.password}"
And I click on "Login button"
Then "Welcome message" should be displayed
And "Data Design menu" should be displayed

Scenario: Access Analytics Workbench
When I click on "Data Design menu"
And I click on "Analytics Workbench menu"
And I wait for "3" seconds
And I wait until "Loading Spinner" disappears
Then "Models tab" should be displayed

Scenario: Open results
When I set "Search Textbox (at bottom of page, in Analytics Workbench)" value to "Sample: Chart From Table: Pie and Bar Graph"
And I click on "Sample Chart From Table Pie and Bar Graph (Cell)"
And I click on "Models toolbar Play button"
And I wait until "Display model execution queue button with value 1" appears
And I click on "Display model execution queue button with value 1"
And I click on "Sample Chart From Table Pie and Bar Graph (Cell, in Analytics Model Execution Queue)"
And I click on "View results button (in Analytics Model Execution Queue)"
Then "Execution results for model Sample Chart From Table Pie and Bar Graph (Dialog)" should be displayed
And "Show all preview Checkbox (in Execution Results Dialog)" should be displayed
And "Output HTML (html file)" should be displayed
And "First Output - Https Link" should be displayed
And "Bar Chart (png file)" should be displayed
And "Second Output - Https Link" should be displayed
And "Pie Chart (png file)" should be displayed
And "Third Output - Https Link" should be displayed

Scenario: Open preview
When I click on "Show all preview Checkbox (in Execution Results Dialog)"
Then "First Output - HTML Table Preview" should be displayed
And "Second Output - Image Preview" should be displayed
And "Third Output - Image Preview" should be displayed

Scenario: Close preview
When I click on "Show all preview Checkbox (in Execution Results Dialog)"
Then "First Output - HTML Table Preview" should not be displayed
And "Second Output - Image Preview" should not be displayed
And "Third Output - Image Preview" should not be displayed

Scenario: Single preview
When I click on "First Output - Magnifier (Preview) Icon"
Then "First Output - HTML Table Preview" should be displayed
And "Second Output - Image Preview" should not be displayed
And "Third Output - Image Preview" should not be displayed

Scenario: Print single preview
When I click on "First Output - Print Icon"
And I switch to second window
Then "First Output - HTML Table Preview" should be displayed

Scenario: Download single preview
When I switch to main window and close others
And I click on "First Output - Arrow to the Right (Click to view or download the output file) Icon"
And I switch to second window
Then "HTML Table (in Second Window)" should be displayed

Scenario: Download link single preview
When I switch to main window and close others
And I click on "First Output - Https Link"
And I switch to second window
Then "HTML Table (in Second Window)" should be displayed

Scenario: Intermediate results
When I switch to main window and close others
And I click on "Show intermediate results"
Then "Output Table (Cell, in Row under Create Table, under Intermediate Results)" should be displayed
Then "Table (Cell, in Row under Create Table, under Intermediate Results)" should be displayed
Then "file/opt/sensage/tomcat/temp (Cell, in Row under Create Table, under Intermediate Results)" should be displayed