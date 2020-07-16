Feature: SUPSOFT-16820

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Browser: Login to Support Administrator
Given browser "Internet Explorer"
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
And I execute an action which only human can execute:
"""
Click on "Permission Force Unlock Button", however Force Unlock link may not be present every time.
It depends if the settings are locked by admin or not, and even if it is locked, it will be available only once, and if someone has unlocked it, so you will not see it)
"""
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
When I open "{environment.SupportSoft User Center portal.URL}"
And I set "Username" value to "Administrator.Username"
And I set "Password" value to "Administrator.Password"
And I click on "Login"
Then "Welcome to the Proactive Assist User Center " page should be displayed

Scenario: Browser: Navigate to Submit New Request page
When I click on "My Requests"
And I click on "New Request"
Then "Submit a New Request" page should be displayed
And I should see "" in "Short Description Textbox"
And I should see "" in "Long Description Textbox"
And I should see "Low" in "Severity Dropdown"
And I should see "" in "Registered Email Address Textbox"
And I get a value from "Registered Email Address Textbox" attribute "readonly" into "Registered Email Address Textbox Readonly"
And I should see "" in "Registered Email Address Textbox Readonly"
And I should see "" in "Other Email Address Textbox"
And I should see "Top" in "Request Type Top"
And I should see "Default" in "Request Type Dropdown"
And I should see "Search for Solutions" in "Search For Solutions Button"
And I should see "Submit Request" in "Submit Request Button"

Scenario: Browser: Select Request Type
When I set "Short Description Textbox" value to "short description"
And I set "Long Description Textbox" value to "long description"
And I click on "Request Type Top"
And I click on "Request Type Dropdown"
And I click on "Request Type Dropdown Test Type Item"
Then I get a value from "Password Property Textbox" attribute "readonly" into "Password Property Textbox Readonly"
And I should see "" in "Password Property Textbox Readonly"

Scenario: Browser: Submit Request
When I click on "Submit Request Button"
Then "My Requests" page should be displayed
And I should see "short description" in "My Requests Table Test Item Description"