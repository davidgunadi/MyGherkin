Feature: SUPSOFT-16607

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Navigate to "Support Administrator Portal" and Login as Admin
Given browser "Internet Explorer"
Given "FourDigitRandom" default value is "{random_number(1000,9999)}"
Given "EmergencyWithFourDigitNumber" default value is "Emergency_{FourDigitRandom}"
When I execute scenario "SUPSOFT-17844" with inputs "FourDigitRandom" as "{FourDigitRandom}", "EmergencyWithFourDigitNumber" as "Emergency_{FourDigitRandom}"
Then scenario steps should complete successfully

Scenario: Navigate to Severity Levels
When I click on "Severity Levels in SA Menu"
Then "New Button (in Severity Levels)" should be displayed
And "Cancel Button (in Severity Levels)" should be displayed
And "Edit Button (for First Record) (in Severity Levels)" should be displayed
And "Delete Button (for First Record) (in Severity Levels)" should be displayed
And I remember a value from "Value Cell (for First Record) (in Severity Levels)" as "ValueRowOne"
And I remember a value from "Value Cell (for Second Record) (in Severity Levels)" as "ValueRowTwo"
And the value of "ValueRowOne" should be greater than "{ValueRowTwo}"

Scenario: Delete Severity Level
When I click on "Delete Button for EmergencyWithFourDigitNumber (in Severity Levels)"
Then I remember the alert text as "AlertMessage"
And the value of "AlertMessage" should be "Are you sure you want to delete this item?"

Scenario: Confirm Delete Operation
When I accept the alert box
Then "EmergencyWithFourDigitNumber (in Severity Column)" should not be displayed
And I remember a value from "Value Cell (for First Record) (in Severity Levels)" as "ValueRowOne"
And I remember a value from "Value Cell (for Second Record) (in Severity Levels)" as "ValueRowTwo"
And the value of "ValueRowOne" should be greater than "{ValueRowTwo}"

Scenario: Verify Deleted Scenario is not present in "Service Level Agreements"
When I click on "Service Level Agreements in SA Menu"
Then "EmergencyWithFourDigitNumber (in Average Time to First Response Table)" should not be displayed
And "EmergencyWithFourDigitNumber (in Average Time to Close Table)" should not be displayed