Feature: SUPSOFT-17687

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Login to Support Center
Given browser "Chrome"
When I open "{environment.SupportSoft Support Center portal.URL}"
And I set "{credentials.Administrator.username}" to "Username Textbox in SC Login Page" value
And I set "{credentials.Administrator.password}" to "Password Textbox in SC Login Page" value
And I click on "Login Button in SC Login Page"
Then "Preferences page header" should be displayed

Scenario: Navigate to Request Queue page
When I click on "Manage Requests link in SC Menu"
And I click on "Analyst Request Queue in SC Menu"
Then "Request Queue page" should be displayed

Scenario: Navigate to All - Open tab
When I click on "All - Open tab"
#Then I should see "Request Description" in "Request Description Label"
Then I should see "update" in "the update link for the newly created request"

Scenario: Navigate to Request Details page
When I click on "the update link for the newly created request"
And I switch to second window
Then "Request Details (Page Header)" should be displayed

Scenario: Navigate to Attachments page
When I click on "Attachment Button (in Request Details)"
And I switch to third window
Then "Attachments" page should be displayed

Scenario: Upload file
When I upload a file "https://e2efiles.s3.amazonaws.com/htlgaij.txt" to "Browse Button (in Attachments Popup)"
And I wait for "1" minutes
When I set "File Name Textbox" value to "File Path"
And I click on "Open Button"
Then "Attachments" window should be displayed

Scenario: Start uploading
When I click on "Upload Button"
Then "Upload Status" page should be displayed
And I should see file upload progress bar.

Scenario: UI: Wait for upload
When I wait while "Upload Success Status" appears
And I press "ALT+F4"
Then "Attachments" window should be displayed

Scenario: UI: Close Attachments window
When I press "ALT+F4"
Then "Request Details" window should be displayed