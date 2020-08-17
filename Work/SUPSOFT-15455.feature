Feature: SUPSOFT-15455

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

Scenario: Select the target Content Folder (Pre-Conditions)
When I click on "Folder named SubFolderName in main panel in AC"
Then I should see "No Items present" in "Number of Items present message in the main content panel of AC"

Scenario: Click on the button "Workflow" (right sidebar)

Scenario: Select Workflow, Choose option 'This folder and all sub-folders', then Submit

Scenario: Select the sub-folder from the tree structure of folders

Scenario: Click on the button "Workflow" (right sidebar)