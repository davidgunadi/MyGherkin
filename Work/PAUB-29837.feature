Feature: PAUB-29837

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred"

Scenario: Login
Given browser "Chrome"
When I open "{environment.UBView.Login URL}"
And I set "username" value to "{credentials.UBView-Cred.username}"
And I set "password" value to "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Dashboard" page should be displayed

Scenario: Navigate To Upload Files
When I click on "Maintenance Link"
And I click on "Upload Files (under Maintenance)"
Then "Choose File (in Upload Files)" should be displayed

Scenario: Upload File
When I upload a file "https://e2efiles.s3.amazonaws.com/htlgaij.txt" to "Choose File (in Upload Files)"
And I click on "Upload (in Upload Files)"
Then I should see "htlgaij.txt" in "File uploaded successfully message"