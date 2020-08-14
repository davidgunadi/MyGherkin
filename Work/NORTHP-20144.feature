Feature: NORTHP-20144

As an Admin user, I should be able to see a named conversion when I create a named conversion WMV to AVI.
This is consistent because In this E2E we get the same result as expected

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Telescope Web Server QA" from "https://confluence.devfactory.com/display/NOR/Telescope+-+Testing+environments+-+Data+Structure+Environments"
Given credentials "telescopetswebqa"

Scenario: Login to the TSAdmin
Given browser "Chrome"
When I open "{environment.TSAdmin application.URL}"
And I click on "Connect To"
And I click on "TSAdmin - Administer - qnps_npsqadb option from dropdown"
And I set "{credentials.telescopetswebqa.username}" to "Username" value
And I set "{credentials.telescopetswebqa.password}" to "Password" value
And I click on "TSAdmin - Login"
Then "TeleScope Administrator" page should be displayed
And "TSAdmin - Logout" should be displayed

Scenario: Open named conversions page
When I click on "TSAdmin - Named Conversions button"
Then "TeleScope Administrator - Named Conversions" page should be displayed

Scenario: Click on Add button
When I click on "TSAdmin - Named Conversions - Add button"
Then "TeleScope Administrator - Named Conversion Detail" page should be displayed

Scenario: Set file type
When I set "WMV" to "TSAdmin - Named Conversions - File types input" value
And I click on "TSAdmin - Named Conversions - Define Conversion button"
Then "TeleScope Administrator - Conversion Options" page should be displayed

Scenario: Define conversion options
When I set "AVI(Windows Video) - Transformation Platform" to "TSAdmin - Named Conversions - Convert to selector" value
And I click on "TSAdmin - Named Conversions - Conversion options OK button"
Then "TeleScope Administrator - Named Conversion Detail" page should be displayed
And I should see "(WMV)>AVI.TRANSFORM" in "TSAdmin - Named Conversions - Conversion string explanation label"

Scenario: fill up the fields and create a conversion
Given "GeneratedConversionName" default value is "{random_string(8)}"
When I set "100" to "TSAdmin - Named Conversions - Converted size input" value
And I set "{GeneratedConversionName}" to "TSAdmin - Named Conversions - Conversion name input" value
And I "check" "TSAdmin - Named Conversions - Visibility select all checkbox" checkbox
And I click on "TSAdmin - Named Conversions - Save button"
And I accept the alert box if displayed
Then "TeleScope Administrator - Named Conversions" page should be displayed
And "Cell with the value GeneratedConversionName in the Conversions Table" should be displayed

Scenario: Logout
When I click on "TSAdmin - Logout"
Then "Username" should be displayed