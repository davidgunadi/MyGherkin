Feature: STREETSMART-101 Settings - Edit Values of a Row - Consistent

As Company Admin user, I should be able to change the value of one of the rows when I navigate to Settings
This is consistent because The user information listed is consistent to the inserted information without loss or corruption data

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

Scenario: Navigate to Administration -> Settings
When I hover on "Administration (Menu in Top Bar)"
And I click on "Settings (List Item under Administration)"
Then "Settings" page should be displayed
And "Communication tab" should be displayed
And "Custom Header tab" should be displayed
And "Hours of Operation tab" should be displayed
And "Jobs tab" should be displayed
And "Peripherals tab" should be displayed
And "Personalization tab" should be displayed
And "Reports tab" should be displayed
And "Security tab" should be displayed
And "Terminology tab" should be displayed
And "Timesheets1 tab" should be displayed
And "Timesheets2 tab" should be displayed
And "Tracking tab" should be displayed

Scenario: On the "Communication" tab hover to the right; Click on "Edit"
When I click on "Communication tab"
And I hover on "Value Column of 'Notification Dialog Beep Frequency (Seconds)' Row"
And I click on "Edit Link in Value Column of 'Notification Dialog Beep Frequency (Seconds)' Row"
Then "Edit Setting Value Dialog" should be displayed
And "Name Label (in Edit Settings Value Dialog)" should be displayed
And "Value Textbox (in Edit Setting Value Dialog)" should be displayed
And I remember a value from "value" attribute of "Value Textbox (in Edit Setting Value Dialog)" as "OriginalValue"

Scenario: Change the Value for a non - existing Value; Click "Save & Close" button
Given "RandomTwoDigitNumber" default value is "{random_number(10,99)}"
When I set "Value Textbox (in Edit Setting Value Dialog)" value to "{RandomTwoDigitNumber}"
And I click on "Save & Close"
Then I should see "{RandomTwoDigitNumber}" in "Value Column of 'Notification Dialog Beep Frequency (Seconds)' Row"

Scenario: Cleanup - Revert Value to Existing One
When I hover on "Value Column of 'Notification Dialog Beep Frequency (Seconds)' Row"
And I click on "Edit Link in Value Column of 'Notification Dialog Beep Frequency (Seconds)' Row"
And I set "Value Textbox (in Edit Setting Value Dialog)" value to "{OriginalValue}"
And I click on "Save & Close"
Then I should see "{OriginalValue}" in "Value Column of 'Notification Dialog Beep Frequency (Seconds)' Row"