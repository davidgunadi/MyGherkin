Feature: STREETSMART-212 Admin - Companies - Devices - Create - Accessible

As a Root Super Admin user, I should be able to create new devices and assign them to Users in Companies when I click Administration > Companies.
This is accessible because Device creation functionality should be reachable for Root Super Admin users

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "StreetSmart CRT" from "https://confluence.devfactory.com/display/SAASOPS/Environment+description+YAML"
Given credentials "Root Super Admin"

Scenario: Login to MC Website as "Root Super Admin"
Given browser "Chrome"
When I open "{environment.Web Site MC.URL}"
And I set "Username textbox(in Login page)" value to "{credentials.Root Super Admin.proposed_fields.username}"
And I set "Password textbox(in Login page)" value to "{credentials.Root Super Admin.proposed_fields.password}"
And I set "Company ID textbox(in Login page)" value to "{credentials.Root Super Admin.proposed_fields.domain}"
And I click on "Login button(in Login page)"
Then "Logout" should be displayed

Scenario: In the top menu click on "Administration > Companies"
When I hover on "ADMINISTRATION (Menu in Top left)"
And I click on "Company (List Item under ADMINISTRATION)"
Then "Companies List Table" should be displayed

Scenario: Click on the company with id 3034438 and select "Create User"
Given "GeneratedCompanyName" default value is "3034438"
When I click on "GeneratedCompanyName Record in Company Table"
And I click on "Create User (In Popup Menu)"
Then "User Details Section" should be displayed
And "Contact Information Section" should be displayed
And "Notification Information Section" should be displayed

Scenario: Fill in User Details as Mobile Worker, then Save
Given "GeneratedUsername" default value is "{random_string(8)}"
Given "GeneratedFirstName" default value is "First_{GeneratedUsername}"
Given "GeneratedLastName" default value is "Last_{GeneratedUsername}"
When I set "First Name Textbox (in Create User Dialog)" value to "{GeneratedFirstName}"
And I set "Last Name Textbox (in Create User Dialog)" value to "{GeneratedLastName}"
And I click on "Group Dropdown (in Create User Dialog)"
And I click on "Default (dropdown option)"
And I set "Security Role Dropdown (in Create User Dialog)" value to "Mobile Worker"
And I set "Timezone Dropdown (in Create User Dialog)" value to "UTC Casablanca"
And I set "Username Textbox (in Create User Dialog)" value to "{GeneratedUsername}"
And I set "Web Password Textbox (in Create User Dialog)" value to "{CreatedUserPassword}"
And I set "Confirm Web Password Textbox (in Create User Dialog)" value to "{CreatedUserPassword}"
And I set "Device Password Textbox (in Create User Dialog)" value to "{CreatedUserPassword}"
And I set "Confirm Device Password Textbox (in Create User Dialog)" value to "{CreatedUserPassword}"
Then I remember a value from "value" attribute of "PIN Textbox (in Create User Dialog)" as "GeneratedPIN"
When I click on "Save & Close Button (in Dialog)"
Then "Companies List Table" should be displayed

Scenario: View User for Company 3034438
When I click on "GeneratedCompanyName Record in Company Table"
And I click on "View Users (In Popup Menu)"
Then "Row with GeneratedUsername" should be displayed

Scenario: Edit Created User
When I click on "Row with GeneratedUsername"
And I click on "Edit User (In Popup Menu)"
Then "User Details Section" should be displayed
And "Contact Information Section" should be displayed
And "Notification Information Section" should be displayed

Scenario: Check the checkbox "Create Device"
When I "check" "Create Device Checkbox (in Create User Dialog)" checkbox
Then "Device Information Section" should be displayed

Scenario: Enter mobile details and Save
Given "RandomPhoneNumber" default value is "{date('YYMMDDmmss')}"
When I "check" "First Checkbox in SOC Code (in Create User Dialog)" checkbox
And I set "Device type Dropdown (in Create User Dialog)" value to "iPhone"
And I set "Description Textbox (in Create User Dialog)" value to "Test Description"
And I set "Phone Number Textbox (in Create User Dialog)" value to "{RandomPhoneNumber}"
When I click on "Save & Close Button (in Dialog)"
Then I should see "{RandomPhoneNumber}" in "Row with GeneratedUsername"