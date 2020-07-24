Feature: SNSGCID-66252

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "end-to-end" from "https://confluence.devfactory.com/display/SEN/Sensage+EnvDS"
Given credentials "TEST-66252"

Scenario: Precondition - Populate data
Given HTTP request
When I execute GET request for "{environment.datasetpreload-single-node.URL}/TEST-66252"
Then "Preload finished" should be in response body

Scenario: Precondition - Clear Inbox to clear duplicate existing emaiils
Given browser "Chrome" as "Mailbox Site"
When I open "{environment.mailbox-single-node.URL}" in "Mailbox Site"
And I click on "Clear Inbox" in "Mailbox Site"
Then "Now receiving all emails" should be displayed in "Mailbox Site"

Scenario: Login to Environment and Access Data Design -> Analytics Workbench menu
Given browser "Chrome" as "Analyzer Site"
When I open "{environment.analyzer-ui-single-node.URL}" in "Analyzer Site"
And I set "{credentials.TEST-66252.username}" to "Username field" value in "Analyzer Site"
And I set "{credentials.TEST-66252.password}" to "Password field" value in "Analyzer Site"
And I click on "Login button" in "Analyzer Site"
When I click on "Data Design menu" in "Analyzer Site"
And I click on "Analytics Workbench menu" in "Analyzer Site"
Then "Analytics Workbench (Header)" should be displayed in "Analyzer Site"

Scenario: Click Create an analytic request button
When I click on "Pencil Icon (Create an analytic request) (in Analytics Workbench Page)" in "Analyzer Site"
Then "Analytic Request Dialog" should be displayed in "Analyzer Site"
And "Please describe the desired analytic function below Textarea (in Analytic Request Dialog)" should be displayed in "Analyzer Site"
And "Choose file Button (in Analytic Request Dialog)" should be displayed in "Analyzer Site"
And "Warning message (in Analytic Request Dialog)" should be displayed in "Analyzer Site"
And "Submit Button (Disabled) (in Analytic Request Dialog)" should be displayed in "Analyzer Site"
And "Reset Button (Enabled) (in Analytic Request Dialog)" should be displayed in "Analyzer Site"
And "Cancel Button (Enabled) (in Analytic Request Dialog)" should be displayed in "Analyzer Site"

Scenario: Write any message in the text area
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"
When I click on "Please describe the desired analytic function below Textarea (in Analytic Request Dialog)" in "Analyzer Site"
And I type "Message_{RandomValue}" in "Analyzer Site"
Then "Submit Button (Enabled) (in Analytic Request Dialog)" should be displayed in "Analyzer Site"

Scenario: Add File
When I upload a file "https://e2efiles.s3.amazonaws.com/htlgaij.txt" to "Choose file (Uploader)" in "Analyzer Site"
Then I should see "htlgaij.txt" in "Uploaded File Name Label (in Analytic Request Dialog)" in "Analyzer Site"


Scenario: Reset Form
When I click on "Reset Button (Enabled) (in Analytic Request Dialog)" in "Analyzer Site"
Then I should see "" in "Please describe the desired analytic function below Textarea (in Analytic Request Dialog)" in "Analyzer Site"
And I should see "No file chosen" in "Uploaded File Name Label (in Analytic Request Dialog)" in "Analyzer Site"

Scenario: Write a message and click Submit
Scenario: Check Email Received
Scenario: Check Email Message
Scenario: Check Email Attachment