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
When I click on "Admin Menu Icon"
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
Then "Error - This page contains content or formatting that is not valid. You can find more information in the affected sections" should be displayed
And "You must specify a value for this required field (under Posted By)" should be displayed

Scenario: User Clear the contents of Service Title, Enter a valid user in Posted By, Uncheck Show Rollup Image, and Publish the page
When I set "Service Title Textbox" value to ""
And I click on "Posted By Textbox"
And I type "administrator"
And I click on "Person Icon (for Posted By)"



Scenario: User performs the following for the required fields in the Metadata tab and tries to publish by clicking the Publish button and continuing on the comment popup:
Provide a valid title for Service Title
Clear the value of Posted By
Keep Show Rollup Image unchecked

Scenario: Provide a value for the Posted By property by entering a username and clicking on the person icon

Scenario: Toggle the Show Rollup Image on Page to checked/enabled but leave the Rollup Image empty, and try to publish the page

Scenario: Assign a rollup image using Bonzai Page Layout Rollup Image rendition by clicking on Insert and Image from Sharepoint and assigning an image from the Sharepoint library. The Image Rendition is selected in the dropdown below the Selected image field of the popup

Scenario: Publish the page by clicking on the Publish button and continuing on the confirmation popup

Scenario: User deletes the test page using the Delete Page button on the Page tab of the Sharepoint ribbon (If the ribbon is not visible, click on the Show Ribbon item in the Admin menu), and accepting the confirmation.

Scenario: User logs out of Bonzai using the Sign Out option of the user menu