Feature: SUPSOFT-15455

As an Admin user, I should be able to to assign a Workflow to the current Content Folder and all sub-folders when I use the Author Center
This is configurable because Admin can configure a workflow to folder and sub-folder

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Precondition - Run SUPSOFT-18410 to create a Workflow
Given browser "Internet Explorer"
When I execute scenario "SUPSOFT-18410" to capture outputs "NewWorkflow"
Then scenario steps should complete successfully

Scenario: Precondition - Run SUPSOFT-15026 to create a new content Folder
Given browser "Internet Explorer"
When I execute scenario "SUPSOFT-15026" to capture outputs "FolderName"
Then scenario steps should complete successfully

Scenario: Precondition - Create Sub-Folder under the one created in previous step
Given "SubFolderName" default value is "Sub_{FolderName}"
When I click on "NEW button in the right sidebar of AC"
And I click on "Folder content type in Create Content in AC"
And I set "Folder Name text box in New Folder in AC" value to "{SubFolderName}"
And I click on "ADD button in New Folder in AC"	
Then "Folder named SubFolderName in main panel in AC" should be displayed

Scenario: Click on the button "Workflow" (right sidebar)
When I click on "WORKFLOW button in the right sidebar of AC"
Then "Target workflow from the list of available workflows" should be displayed
And "This folder only radio option" should be displayed
And "This folder and all sub-folders radio option" should be displayed

Scenario: Select Workflow, Choose option 'This folder and all sub-folders', then Submit
When I click on "Dropdown for the list of available workflows"
And I click on "Target workflow from the list of available workflows"
And I click on "This folder and all sub-folders radio option"
And I click on "Submit button in associate workflow section"
Then "Submitted Successfully message" should be displayed

Scenario: Select the sub-folder from the tree structure of folders
When I click on "Back button in associate workflow section"
And I click on "Folder named SubFolderName in main panel in AC"
Then I should see "No Items present" in "Number of Items present message in the main content panel of AC"

Scenario: Click on the button "Workflow" (right sidebar)
When I click on "WORKFLOW button in the right sidebar of AC"
Then I should see "{NewWorkflow}" in "Dropdown for the list of available workflows"