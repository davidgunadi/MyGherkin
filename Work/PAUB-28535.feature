Feature: PAUB-28535

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred"

Scenario: Run precondition PAUB-28484
When I execute scenario "PAUB-28484" to capture outputs "CategoryName"
Then scenario steps should complete successfully

Scenario: Run precondition PAUB-28486
When I execute scenario "PAUB-28486"
Then scenario steps should complete successfully

Scenario: Login into the UltraBand UBView website
Given browser "Chrome"
When I open "{environment.UBView.Login URL}"
And I set "username" value to "{credentials.UBView-Cred.username}"
And I set "password" value to "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Dashboard" page should be displayed

Scenario: Click on Configuration, on the left-side menu
When I click on "Configuration (in Left Menu)"
Then "Left Navigation Configuration - Cluster Configuration" should be displayed
And "Left Navigation Configuration - Policy Manager" should be displayed
And "Left Navigation Configuration - License Manager" should be displayed

Scenario: Click on Policy Manager, on the menu item list that expanded after the step above
When I click on "Left Navigation Configuration - Policy Manager"
Then I remember a value from "class" attribute of "Policy Manager - Rules Tab" as "RulesTabStatus"
And the value of "RulesTabStatus" should contain "active"

Scenario: Click on Add button
When I click on "Policy Manager - Rules Tab - Add Button"
Then "Add Rule Form" should be displayed

Scenario: Set Name = E2ETestRule_Nintendo
Given "RandomRuleName" default value is "E2ETestRule_Nintendo_{date('YYYYMMDDmmss')}"
When I set "Name Textbox (in Add Rule Dialog)" value to "{RandomRuleName}"
Then I should see "{RandomRuleName}" in "Name Textbox (in Add Rule Dialog)"

Scenario: Click on "Add category" drop-down box
When I click on "Add category Dropdown (in Add Rule Dialog)"
Then "Service (Option in Add Category Dropdown)" should be displayed

Scenario: Click on the option labeled "Service"
When I click on "Service (Option in Add Category Dropdown)"
Then "Select Category Textbox under Service" should be displayed

Scenario: In the textbox under Service, add the Category that was created in prcondition PAUB-28484
When I click on "Select Category Textbox under Service"
And I type "{CategoryName}"
And I press "ENTER"
Then I should see "{CategoryName}" in "Category Name Displayed Inside the Textbox under Service"

Scenario: Click on "Add policy" drop-down box
Given "PolicyNameCreatedInPAUB28486" default value is "E2ETest_Policy_AdmissionBlockNotFound404"
When I click on "Add policy Dropdown (in Add Rule Dialog)"
Then "PolicyNameCreatedInPAUB28486 (in Add Policy Dropdown)" should be displayed

Scenario: In the dropdown under Admission Section, click on the Policy that was created in prcondition PAUB-28486
When I click on "PolicyNameCreatedInPAUB28486 (in Add Policy Dropdown)"
Then "PolicyNameCreatedInPAUB28486 (shown in a box under Add Policy Dropdown)" should be displayed

Scenario: Click on Add
When I click on "Add Rule Form - Add button"
Then "Rule is Added Message" should be displayed
And "Rule with the name RandomRuleName in Rule Table" should be displayed