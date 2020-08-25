Feature: SUPSOFT-16765

As an administrator, I should be able to create new custom disposition, when I am in the support administrator portal.
This is consistent because Administrator is able to create new custom disposition and verify it while creating new request.

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Precondition - Create a new Request to be used for testing
Given browser "Internet Explorer"
When I execute scenario "SUPSOFT-17847"
Then scenario steps should complete successfully

Scenario: Precondition - Run SUPSOFT-16768 to access Dispositions Page
Given browser "Chrome"
When I execute scenario "SUPSOFT-16768"
Then scenario steps should complete successfully

Scenario: Click New
When I click on "New button in Dispositions page"
Then "textbox under 'Internal Status' column" should be displayed
And "Save button for new row" should be displayed
And "a dropdown under 'User Status' column" should be displayed
And "SELECT option in dropdown" should be displayed
And "Open option in dropdown" should be displayed
And "Closed option in dropdown" should be displayed

Scenario: Enter New Dispositions Details and Save
Given "DispositionName" default value is "Disposition_{random_string(6)}"
When I set "textbox under 'Internal Status' column" value to "{DispositionName}"
And I click on "a dropdown under 'User Status' column"
And I click on "Open option in dropdown"
And I click on "Save button for new row"
Then "Disposition with the name DispositionName" should be displayed

Scenario: Login to "Support Center Portal" as Admin
Given browser "Chrome"
When I open "{environment.SupportSoft Support Center portal.URL}"
And I set "{credentials.Administrator.username}" to "Username Textbox in SC Login Page" value
And I set "{credentials.Administrator.password}" to "Password Textbox in SC Login Page" value
And I click on "Login Button in SC Login Page"
And I wait until "Preferences page header" appears
Then "Preferences page header" should be displayed

Scenario: Navigate to "Analyst Request Queue" - "All - Open Tab"
When I click on "Manage Requests link in SC Menu"
And I click on "Analyst Request Queue in SC Menu"
And I click on "All - Open tab"
Then "the update link for the newly created request" should be displayed

Scenario: Click "Update" for the request created in Precondition "SUPSOFT-17847"
When I click on "the update link for the newly created request"
And I switch to second window
Then "Resolve Notify tab (in New Window)" should be displayed

Scenario: Select the 'Resolve/Notify' tab
When I click on "Resolve Notify tab (in New Window)"
Then "Disposition dropdown (in New Window)" should be displayed

Scenario: Verify Created Disposition is available under Disposition Dropdown 
When I click on "Disposition dropdown (in New Window)"
Then "DispositionName Option under Disposition Dropdown (in New Window)" should be displayed