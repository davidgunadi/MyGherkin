Feature: SUPSOFT-16820

As an administrator, I should be able to define Class properties of input type 'Passsword' for Request Classes when I am extending the forms to create new Requests in the application User Center
This is consistent because Defining Class Properties of input type 'Password' for Request Classes works properly as specified in the E2E.

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator" and "db_user"

Scenario: Precondition - Unlock the DB instead of using "Force Unlock" in scenario "Browser: Set Request Type permissions"
Given DB connection to "SupportSoft Database"
When I execute multiline query:
"""
update sprt_registry set keyvalue = N'' where keypath = N'Software\SupportSoft\Permissions' and keyname = N'PermLockData';
"""
Then queries should complete successfully

Scenario: Browser: Login to Support Administrator
Given browser "Chrome"
When I open "{environment.SupportSoft Administrator portal.URL}"
And I set "{credentials.Administrator.username}" to "Username In SA Login Page" value
And I set "{credentials.Administrator.password}" to "Password In SA Login Page" value
And I click on "Login Button In SA Login Page"
Then "SupportSoft - Support Administrator" page should be displayed

Scenario: Browser: Navigate to Define Class page
When I click on "Application Management in SA Menu"
And I click on "RequestAssist in SA Menu"
And I click on "Classes in SA Menu"
And I click on "Define Class in SA Menu"
Then "Define Class (Header)" should be displayed

Scenario: Browser: Define new Request Class
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"
Given "TestClassRandomValue" default value is "TestClass_{RandomValue}"
When I set "Request Class Textbox (in Define Class)" value to "{TestClassRandomValue}"
And I set "Description Textbox (in Request Class Properties Table)" value to "Password"
And I set "Read-only" to "New Request Attributes Dropdown (in Request Class Properties Table)" value
And I set "password" to "Input Type Dropdown (in Request Class Properties Table)" value
And I click on "Request Details Attributes Dropdown (in Request Class Properties Table)"
And I type "Read-only"
And I press "TAB"
And I click on "Update Button (in Request Class Properties Table)"
And I click on "Save Button (in Define Class)"
Then "Request Class has been saved" should be displayed

Scenario: Browser: Navigate to Types page
When I click on "Types in SA Menu"
Then "Types (Header)" should be displayed

Scenario: Browser: Navigate to Edit Request Type page
When I click on "New Button in Types"
Then "Edit Request Type (Header)" should be displayed

Scenario: Browser: Create and configure a new Request Type
Given "TestTypeRandomValue" default value is "TestType_{RandomValue}"
When I set "Request Type (Textbox, in Edit Request Type Form)" value to "{TestTypeRandomValue}"
And I click on "Available Classes (Listbox, in Edit Request Type Form)"
And I type "{TestClassRandomValue}"
And I click on "Right Arrow Button (to move item from Available Class to Selected Class)"
And I click on "Save Button (in Edit Request Type Form)"
Then "Request type has been saved" should be displayed

Scenario: Browser: Set Request Type permissions
When I click on "Set Permissions Button (in Edit Request Type Form)"
And I switch to second window
And I click on "Request Type close (in Component Listbox)"
And I click on "Tier 1 Analysts (in Group Listbox)"
And I hold "CTRL" and click on "Users (in Group Listbox)"
And I click on "Request Type create (in Component Listbox)"
And I click on "Tier 1 Analysts (in Group Listbox)"
And I hold "CTRL" and click on "Users (in Group Listbox)"
And I click on "Request Type edit (in Component Listbox)"
And I click on "Tier 1 Analysts (in Group Listbox)"
And I hold "CTRL" and click on "Users (in Group Listbox)"
And I click on "Request Type route (in Component Listbox)"
And I click on "Tier 1 Analysts (in Group Listbox)"
And I hold "CTRL" and click on "Users (in Group Listbox)"
And I click on "Request Type view (in Component Listbox)"
And I click on "Tier 1 Analysts (in Group Listbox)"
And I hold "CTRL" and click on "Users (in Group Listbox)"
And I click on "Save Button (in Permissions Dialog)"
And I switch to main window and close others
Then "Edit Request Type (Header)" should be displayed

Scenario: Browser: Login to User Center
When I open "{environment.SupportSoft User Center portal.URLLogin}"
And I set "Username in UC Login Page" value to "{credentials.Administrator.username}"
And I set "Password in UC Login Page" value to "{credentials.Administrator.password}"
And I click on "Login Button in UC Login Page"
Then "Proactive Assist User Center" page should be displayed

Scenario: Browser: Navigate to Submit New Request page
When I click on "My Requests"
And I click on "New Request (in Request Page)"
Then "Submit a New Request Header (in Request Page)" should be displayed
And I should see "" in "Short Description Textbox (in Request Page)"
And I should see "" in "Long Description Textbox (in Request Page)"
And I should see "Low" in "Severity Dropdown (in Request Page)"
And I should see "admin" in "Registered Email Address Textbox (in Request Page)"
And I should see "" in "Other Email Address Textbox (in Request Page)"
And "Top Link (in Request Page)" should be displayed
And I should see "Default" in "Request Type Dropdown (in Request Page)"
And "Search for Solutions Button (in Request Page)" should be displayed
And "Submit Request Button (in Request Page)" should be displayed

Scenario: Browser: Select Request Type
Given "ShortDescRandomValue" default value is "ShortDesc_{RandomValue}"
Given "LongDescRandomValue" default value is "LongDesc_{RandomValue}"
When I set "Short Description Textbox (in Request Page)" value to "{ShortDescRandomValue}"
And I click on "Long Description Textbox (in Request Page)"
And I type "{LongDescRandomValue}"
And I click on "Top Link (in Request Page)"
And I click on "Request Type Dropdown (in Request Page)"
And I type "{TestTypeRandomValue}"
And I press "ENTER"
Then "Checkbox yes (in Request Page)" should be displayed
And I remember a value from "checked" attribute of "Checkbox yes (in Request Page)" as "CheckboxyesStatus"
And the value of "CheckboxyesStatus" should be empty
And "Checkbox YES (in Request Page)" should be displayed
And I remember a value from "checked" attribute of "Checkbox YES (in Request Page)" as "CheckboxyesStatus"
And the value of "CheckboxYESStatus" should be empty
And "Checkbox Yes (in Request Page)" should be displayed
And I remember a value from "checked" attribute of "Checkbox Yes (in Request Page)" as "CheckboxyesStatus"
And the value of "CheckboxYesStatus" should be empty
And "Checkbox Required with a Star Sign next to it (in Request Page)" should be displayed
And "Checkbox ReadOnly in readonly mode (in Request Page)" should be displayed

Scenario: Browser: Submit Request
When I click on "Submit Request Button (in Request Page)"
Then I should see "{ShortDescRandomValue}" in "ShortDescRandomValue (under Description Column in Requests Table)"