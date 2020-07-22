Feature: JVANLT-5857

Access instance and login with CA user
CA user is logged in and Welcome to Jive page is displayed

User clicks on Avatar -> Community Analytics -> clicks on Engagement Dashboard dropdown and selects Community Usage Dashboard
Community Usage Dashboard is displayed and all reports are loaded

User observes and writes down current number of content created (type="Documents") in the current month
Number of content created (type="Documents") saved to paper/text editor

User clicks on Pencil -> Document -> enters some title and some body, selects "The community Community" as publish location -> Publish
Document created successfully and displayed on screen

User clicks on Avatar -> Community Analytics -> clicks on Engagement Dashboard dropdown and selects Community Usage Dashboard
Community Usage Dashboard is displayed and all reports are loaded

Check the current number of content created (type="Documents") in the current month
The count should be increased by one compared to value recorded in step 3
Scenario: Preconditions
Given environment from ""

