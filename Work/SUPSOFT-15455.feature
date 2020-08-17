Feature: SUPSOFT-15455

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Precondition - Run SUPSOFT-18410 to create a Workflow
Given browser "Chrome"
When I execute scenario "SUPSOFT-18410" to capture outputs "NewWorkflow"
Then scenario steps should complete successfully

Scenario: Precondition - Run SUPSOFT-15026 to create a new content Folder
Given browser "Chrome"
When I execute scenario "SUPSOFT-18410" to capture outputs "FolderName"
Then scenario steps should complete successfully

Scenario: Precondition - Create Sub-Folder under the one created in previous step
Given browser "Chrome"
When I open "{environment.SupportSoft Author Center portal.URL}"
And I set "Username In AC Login Page" value to "{credentials.Administrator.username}"
And I set "Password In AC Login Page" value to "{credentials.Administrator.password}"
And I click on "Login Button In AC Login Page"
And I click on "Manage Content in Top AC Menu"

Scenario: Go to the functionality "Manage Content"


Scenario: Select the target Content Folder (Pre-Conditions)

Scenario: Click on the button "Workflow" (right sidebar)

Scenario: Select Workflow, Choose option 'This folder and all sub-folders', then Submit

Scenario: Select the sub-folder from the tree structure of folders

Scenario: Click on the button "Workflow" (right sidebar)