Feature: SUPSOFT-3936

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Execute SUPSOFT-3940 to create a Business Unit
Given browser "Chrome"
When I execute scenario "SUPSOFT-3940" to capture outputs "BusinessUnitRandomValue"
Then scenario steps should complete successfully
And "Cell with the name BusinessUnitRandomValue" should be displayed

Scenario: Navigate to Application Management>Account Manager>Configure Business Unit in the left menu
When I click on "Configure Business Unit in SA Menu"
Then "Select Business Unit (Header)" should be displayed
And "Select Business Unit Tab" should be displayed
And "PolicyConfiguration Tab" should be displayed
And "Question Settings Tab" should be displayed
And "Policy Questions Tab" should be displayed
And I remember a value from "class" attribute of "Select Business Unit Tab" as "SelectBusinessUnitTabStatus"
And the value of "SelectBusinessUnitTabStatus" should contain "tabStripSel"
And "Option in Listbox with the name BusinessUnitRandomValue" should be displayed
And "OK Button (in Configure Business Unit Page)" should be displayed

Scenario: Select business unit from prerequisites and click on "OK" button
When I click on "Option in Listbox with the name BusinessUnitRandomValue"
And I click on "OK Button (in Configure Business Unit Page)"
Then I remember a value from "class" attribute of "PolicyConfiguration Tab" as "PolicyConfigurationTabStatus"
And the value of "PolicyConfigurationTabStatus" should contain "tabStripSel"
And "Reset Password Checkbox (in PolicyConfiguration)" should be displayed
And "Unlock Account Checkbox (in PolicyConfiguration)" should be displayed
And "Save Button (in Configure Business Unit Page)" should be displayed
And "Cancel Button (in Configure Business Unit Page)" should be displayed

Scenario: Click on "Question Settings" Tab
When I click on "Question Settings Tab"
Then I remember a value from "class" attribute of "Question Settings Tab" as "QuestionSettingsTabStatus"
And the value of "QuestionSettingsTabStatus" should contain "tabStripSel"
And "Number of Policy Questions Textbox" should be displayed
And "Number of User-defined Questions Textbox" should be displayed
And "Minimum Number of Answers to Validate (User flow) Textbox" should be displayed
And "Minimum Number of Answers to Validate (Analyst flow) Textbox" should be displayed
And "Save Button (in Configure Business Unit Page)" should be displayed
And "Cancel Button (in Configure Business Unit Page)" should be displayed
And I remember a value from "value" attribute of "Number of Policy Questions Textbox" as "OriginalNoPolicyQuestion"
And I remember a value from "value" attribute of "Number of User-defined Questions Textbox" as "OriginalNoUserDefinedQuestion"
And I remember a value from "value" attribute of "Minimum Number of Answers to Validate (User flow) Textbox" as "OriginalMinValidateUser"
And I remember a value from "value" attribute of "Minimum Number of Answers to Validate (Analyst flow) Textbox" as "OriginalMinValidateAnalyst"

Scenario: Update value as per restriction rules and Save
When I set "Number of Policy Questions Textbox" value to "3"
And I set "Number of User-defined Questions Textbox" value to "3"
And I set "Minimum Number of Answers to Validate (User flow) Textbox" value to "3"
And I set "Minimum Number of Answers to Validate (Analyst flow) Textbox" value to "3"
And I click on "Save Button (in Configure Business Unit Page)"
Then "Successfully Updated Message (in Configure Business Unit Page)" should be displayed

Scenario: Return fields values to initial values and Save
When I set "Number of Policy Questions Textbox" value to "{OriginalNoPolicyQuestion}"
And I set "Number of User-defined Questions Textbox" value to "{OriginalNoUserDefinedQuestion}"
And I set "Minimum Number of Answers to Validate (User flow) Textbox" value to "{OriginalMinValidateUser}"
And I set "Minimum Number of Answers to Validate (Analyst flow) Textbox" value to "{OriginalMinValidateAnalyst}"
And I click on "Save Button (in Configure Business Unit Page)"
Then "Successfully Updated Message (in Configure Business Unit Page)" should be displayed