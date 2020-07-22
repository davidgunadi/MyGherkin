Feature: JVANLT-5865

Access instance and login with CA user
CA user is logged in and home page is displayed

User clicks on Avatar -> Community Analytics -> clicks on Engagement Dashboard dropdown and selects Community Usage Dashboard
Community Usage Dashboard is displayed and all reports are loaded

User observes and writes down current number of content created (type="Videos") in the current month
Number of content created (type="Videos") saved to paper/text editor

User clicks on Pencil -> Video -> pastes some youtube video url (e.g. https://www.youtube.com/watch?v=EngW7tLk6R8), clicks Import, waits for video to be loaded, enters some title and some body, selects Community as publish location -> Publish
Video created successfully and displayed on screen

User clicks on Avatar -> Community Analytics -> clicks on Engagement Dashboard dropdown and selects Community Usage Dashboard
Community Usage Dashboard is displayed and all reports are loaded

Check the current number of content created (type="Videos") in the current month
The count should be increased by one compared to value recorded in step 3
Scenario: Preconditions
Given environment from ""

