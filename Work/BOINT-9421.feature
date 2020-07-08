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

Scenario: User provides a valid title and clicks on Create

Scenario: User assigns a Service Page layout to the page by clicking on the Page tab of the Sharepoint Ribbon and selecting the layout from the Page Layouts menu

Scenario: User leaves the default values and tries to publish the page by clicking on the Publish button on the Sharepoint Ribbon, and clicking Continue on the comment modal that appears.

Scenario: User performs the following for the required fields in the Metadata tab and tries to publish by clicking the Publish button and continuing on the comment popup: Clear the contents of Service Title, Enter a valid user in Posted By (enter a username and click on the person icon to validate. Your own username may be used.), Uncheck Show Rollup Image

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