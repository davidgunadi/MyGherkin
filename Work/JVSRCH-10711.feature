Feature: JVSRCH-10711 Video created by User1 inside project is shown in that project activities list

As Jive User I should see video on project activities list when I just created a new video inside this project
This is consistent because Video created inside project is shown in that project activities list

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/JIVE/E2E+Environement+Information"
Given credentials "admin"

Scenario: Precondition to run JVSRCH-10519 and Create a Project
Given "SiteURL" default value is "{environment.MSI.Login URL}"
Given browser "Chrome"
When I execute scenario "JVSRCH-10519" with inputs "SiteURL" as "{SiteURL}" to capture outputs "projectName"
Then scenario steps should complete successfully

Scenario: Precondition to create user then wait to ensure user is active
Given browser "Chrome"
When I execute scenario "JVSRCH-10427" to capture outputs "Email", "Password"
Then scenario steps should complete successfully

Scenario: Login as the Created User
Given browser "Chrome"
When I open "{environment.MSI.Login URL}"
And I click on "UserName Textbox"
And I type slowly "{Email}"
And I click on "Password Textbox"
And I type slowly "{Password}"
And I click on "Login Button"
Then "Home Page - User Menu Icon" should be displayed

Scenario: Go to Groups Page
When I open "{environment.MSI.URL}groups"
Then "Browse - Places" page should be displayed

Scenario: Select Project Filter and Select the Project created in Precondition "JVSRCH-10519"
When I click on "Your Places - Projects link"
And I set "Search Textbox (in Projects Filter)" value to "{ProjectName}"
And I click on "Project with the name projectName (in Projects Filter)"
Then "{ProjectName}" page should be displayed

Scenario: Click Actions, then Video
When I click on "Actions dropdown"
And I click on "Video"
Then "Publish a video" page should be displayed

Scenario: Enter video Details and Publish
Given "RandomSuffix" default value is "{random_string(5)}"
And "VideoTitle" default value is "TestVideoR2E2 {RandomSuffix}"
And "VideoDescription" default value is "TestDescriptionR2E2 {RandomSuffix}"
And "VideoTag" default value is "TagR2E2_{RandomSuffix}"
When I click on "Embed Video Button"
And I set "https://www.youtube.com/watch?v=s4c3r084GvQ" to "Enter Embed URL input field" value
And I click on "Embed button to confirm"
And I wait until "Confirm Embed Video Button" disappears if displayed
And I set "{VideoTitle}" to "Video Title" value
And I set "{VideoDescription}" to "Video Description" value
And I click on "Tags"
And I type "{VideoTag}"
And I press "ENTER"
And I click on "Publish button in Publish a video page"
And I wait until "Add a comment button enabled in created video page" appears
Then "Created Video Page with Title" should be displayed

Scenario: Validate Video is Listed in the Project
When I click on "projectName Link in Top Left Breadcrumbs"
Then "Created Video Title In Your Content Page" should be displayed