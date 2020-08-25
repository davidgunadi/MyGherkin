Feature: STREETSMART-255 Company - Administration - Users / Create User / Consistent

As "Company Super Admin" user, I should be able to create a new user when I submit to create a user
This is consistent because The user information listed is consistent with the inserted information without loss or corruption data

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "StreetSmart CRT" from "https://confluence.devfactory.com/display/SAASOPS/Environment+description+YAML"
Given credentials "Company Super Admin"

Scenario: Login to MC Website as "Company Super Admin"
Given browser "Chrome"
When I open "{environment.Web Site MC.URL}"
And I set "Username textbox(in Login page)" value to "{credentials.Company Super Admin.proposed_fields.username}"
And I set "Password textbox(in Login page)" value to "{credentials.Company Super Admin.proposed_fields.password}"
And I set "Company ID textbox(in Login page)" value to "{credentials.Company Super Admin.proposed_fields.domain}"
And I click on "Login button(in Login page)"
Then "Logout" should be displayed

Scenario: Navigate to "Administration" -> "Users"
When I hover on "Administration (Menu in Top Bar)"
And I click on "Users (List Item under Administration)"
Then "Users" page should be displayed

Scenario: In the "Toolbar" click on "Create User"
When I click on "Create User Button"
Then "Create User Dialog" should be displayed

Scenario: Fill in User Details and Save
Given "GeneratedUsername" default value is "{random_string(8)}"
Given "GeneratedFirstName" default value is "First_{GeneratedUsername}"
Given "GeneratedLastName" default value is "Last_{GeneratedUsername}"
When I set "First Name Textbox (in Create User Dialog)" value to "{GeneratedFirstName}"
And I set "Last Name Textbox (in Create User Dialog)" value to "{GeneratedLastName}"
And I click on "Group Dropdown (in Create User Dialog)"
And I click on "Default (dropdown option)"
And I click on "Security Role Dropdown (in Create User Dialog)"
And I click on "Company Administrator (dropdown option)"
And I click on "Timezone Dropdown (in Create User Dialog)"
And I click on "UTC Casablanca (dropdown option)"
And I set "Username Textbox (in Create User Dialog)" value to "{GeneratedUsername}"
And I set "Web Password Textbox (in Create User Dialog)" value to "{CreatedUserPassword}"
And I set "Confirm Web Password Textbox (in Create User Dialog)" value to "{CreatedUserPassword}"
Then I remember a value from "value" attribute of "PIN Textbox (in Create User Dialog)" as "GeneratedPIN"
When I click on "Save & Close Button (in Dialog)"
Then "Row with GeneratedUsername" should be displayed
And I should see "{GeneratedUsername}" in "Row with GeneratedUsername"
And I should see "{GeneratedFirstName}" in "Row with GeneratedUsername"
And I should see "{GeneratedLastName}" in "Row with GeneratedUsername"
And I should see "{GeneratedPIN}" in "Row with GeneratedUsername"
And I should see "Default" in "Row with GeneratedUsername"
And I should see "Company Administrator" in "Row with GeneratedUsername"