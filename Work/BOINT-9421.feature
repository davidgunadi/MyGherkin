Feature: BOINT-6894

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Automation Staging" from "https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure"
Given credentials "sc_admin"

Scenario: Log in to Bonzai
Given browser "Chrome"
When I open "{environment.bonzai_home.Login URL}"
Then "Home" page should be displayed

Scenario: User navigates to the Services Directory site using the Directories -> Services footer link
When I click on "Directories - Services (in Footer)"
Then "Services" page should be displayed

Scenario: User creates a test page by clicking on Add a Page in the admin menu
When I click on "Gear Icon (on top right of the page)"
And I click on "Add a page"
Then "Page Name Textbox" should be displayed

Scenario: User provides a valid title and clicks on Create
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"
When I set "Page Name Textbox" value to "Page_{RandomValue}"
And I click on "Create"
Then "Page_{RandomValue}" page should be displayed

Scenario: User assigns a Service Page layout to the page by clicking on the Page tab of the Sharepoint Ribbon and selecting the layout from the Page Layouts menu
When I click on "Page Tab (in Sharepoint Ribbon)"
And I click on "Page Layout (in Sharepoint Ribbon)"
And I click on "Service Page (under Page Layout Popup)"
Then "Service Title Textbox" should be displayed

Scenario: User leaves the default values and tries to publish the page
When I click on "Publish Tab (in Sharepoint Ribbon)"
And I click on "Publish (in Sharepoint Ribbon)"
And I click on "Continue Button (in Publish Dialog)"
Then "Error - This page contains content or formatting that is not valid You can find more information in the affected sections" should be displayed
And "You must specify a value for this required field (under Posted By)" should be displayed

Scenario: User Clear the contents of Service Title, Enter a valid user in Posted By, Uncheck Show Rollup Image, and Publish the page
When I set "Service Title Textbox" value to ""
And I click on "Posted By Textbox"
And I type "administrator"
And I click on "Person Icon (for Posted By)"
And I wait until "BONZAI\Administrator (in Posted By Textbox)" appears
And I "uncheck" "Show Roll Up Image on Page Checkbox" checkbox
And I click on "Publish Tab (in Sharepoint Ribbon)"
And I click on "Publish (in Sharepoint Ribbon)"
And I click on "Continue Button (in Publish Dialog)"
Then "Error - This page contains content or formatting that is not valid You can find more information in the affected sections" should be displayed
And "You must specify a value for this required field (under Service Title)" should be displayed

Scenario: User Provide a valid title for Service Title, Clear the value of Posted By, Keep Show Rollup Image unchecked, and Publish the page
When I set "Service Title Textbox" value to "Page_{RandomValue}"
And I click on "Posted By Textbox"
And I press "BACK_SPACE"
And I press "BACK_SPACE"
And I click on "Publish Tab (in Sharepoint Ribbon)"
And I click on "Publish (in Sharepoint Ribbon)"
And I click on "Continue Button (in Publish Dialog)"
Then "Error - This page contains content or formatting that is not valid You can find more information in the affected sections" should be displayed
And "You must specify a value for this required field (under Posted By)" should be displayed

Scenario: Provide a value for the Posted By property by entering a username and clicking on the person icon
When I click on "Posted By Textbox"
And I type "administrator"
And I click on "Person Icon (for Posted By)"
Then "BONZAI\Administrator (in Posted By Textbox)" should be displayed

Scenario: Toggle the Show Rollup Image on Page to checked/enabled but leave the Rollup Image empty, and try to publish the page
When I "check" "Show Roll Up Image on Page Checkbox" checkbox
And I click on "Publish Tab (in Sharepoint Ribbon)"
And I click on "Publish (in Sharepoint Ribbon)"
And I click on "Continue Button (in Publish Dialog)"
Then "Error - This page contains content or formatting that is not valid You can find more information in the affected sections" should be displayed
And "Please select a Roll Up Image (under Show Roll Up Image on Page)" should be displayed

Scenario: Assign a rollup image using Bonzai Page Layout Rollup Image rendition by clicking on Insert and Image from Sharepoint and assigning an image from the Sharepoint library.
When I click on "Click here to insert a picture from SharePoint"
And I click on "Browse (for Selected Image)"
And I double click on "FAQ Image"
And I click on "OK Button (in Edit Image Properties Dialog)"
Then "FAQ Image Preview (in Roll Up Image)" should be displayed

Scenario: Publish the page by clicking on the Publish button and continuing on the confirmation popup
When I click on "Publish Tab (in Sharepoint Ribbon)"
And I click on "Publish (in Sharepoint Ribbon)"
And I click on "Continue Button (in Publish Dialog)"
Then "Publish Tab (in Sharepoint Ribbon)" should not be displayed

Scenario: User deletes the test page using the Delete Page button on the Page tab of the Sharepoint ribbon (If the ribbon is not visible, click on the Show Ribbon item in the Admin menu), and accepting the confirmation.
When I click on "Gear Icon (on top right of the page)"
And I click on "Edit page"
And I click on "Page Tab (in Sharepoint Ribbon)"
And I click on "Delete Page"
And I accept the alert box
Then "Services" page should be displayed

Scenario: User logs out of Bonzai using the Sign Out option of the user menu
When I click on "Username (on top right of the page)"
And I click on "Sign Out"
Then "Please close the browser to complete sign out" should be displayed