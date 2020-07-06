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







And "Show all preview" should be displayed
And I should see "Output HTML (.html file)" in "First output parameter"
And "First output parameter link address" should be displayed
And I should see "Bar Chart (.png file)" in "Second output parameter"
And "Second output parameter link address" should be displayed
And I should see "Pie Chart (.png file)" in "Third output parameter"
And "Third output parameter link address" should be displayed

Scenario: Open preview
When I "check" "Show all preview" checkbox
Then "First parameter HTML table preview" should be displayed
And "Second parameter image preview" should be displayed
And "Third parameter image preview " should be displayed

Scenario: Close preview
When I "uncheck" "Show all preview" checkbox
Then "First parameter HTML table preview" should not be displayed
And "Second parameter image preview" should not be displayed
And "Third parameter image preview " should not be displayed

Scenario: Single preview
When I click on "First output parameter magnifier icon"
Then "First parameter HTML table preview" should be displayed
And "Second parameter image preview" should not be displayed
And "Third parameter image preview " should not be displayed

Scenario: Single preview in fullscreen
When I click on "First output parameter 'Fullscreen' button"
Then "First parameter HTML table preview in fullscreen mode" should be displayed

Scenario: Exit single preview in fullscreen
When I click on "First output parameter 'Fullscreen' button"
Then "First parameter HTML table preview in fullscreen mode" should not be displayed

Scenario: Print single preview
When I click on "First output parameter 'Print' button"
And I switch to window "Print Window"
Then "HTML table print content" should be displayed

Scenario: Download single preview
When I switch to main window
And I click on "First output parameter 'Click to view or download the output file' button"
And I switch to window "Download Window"
Then "HTML table" should be displayed

Scenario: Download link single preview
When I switch to main window
And I click on "First output parameter link address"
And I switch to window "Download Window"
Then "HTML table" should be displayed

Scenario: Intermediate results
When I switch to main window
And I "check" "Show intermediate results" checkbox
And I scroll to the element "Intermediate results"
Then I should see "Output table" in "Outputs for model: Create Table intermediate result, Name column"
And I should see "Table" in "Outputs for model: Create Table intermediate result, Type column"
And "Outputs for model: Create Table intermediate result, Value column with a value starting with file:///opt/sensage/tomcat/temp" should be displayed