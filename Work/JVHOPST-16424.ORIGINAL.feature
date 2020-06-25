Feature: JVHOPST-16424

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environments: * Name:Default SE7 environment
    * Type: QA
   
   
 * Credentials: * Username: username
    * Password: password
   
   
 * Selectors * Email Address: //*[@id='username01']
    * Password: //*[@id='password01']
    * Sign in button: //*[@id='jive-login-button']
    * Application landing: "application landing page for the user. it may be any page wrt user/server configuration, like News, Main, etc. that proves the user is logged in, i.e. avatar icon for the user is displayed on the top right"
    * News tab and I click on + icon on the News page: //*[@id='jive-navbar-link-news']
    * OK, Got it button from the New Stream page under Create custom streams for..heading: //*[@id='j-builder-help-splash']
    * New stream field and enter the custom stream name in the field, eg: Group stream: //*[@id='New Stream-label-id']
    * Search field and enter the group name in the Search field 
      
      eg: Community Group for storing All types of contents in the search field: //*[@id='j-stream-edit-search-textfield']
    * Add button under the group name under the places: //*[@id='button-addstream-container-1019']
    * Done button: //*[@id='stream-header']
    * Search icon: //*[@id='j-nav-search']
    * Community Group for storing All types of contents name from the search result: //*[@id='__generated_id_7']
    * Actions dropdown and select Project menu item: //*[@id='jive-place-link-actions']
    * Name (Required) field and enter the project name into the input field, eg: group project: //*[@id='jive-place-name-input']
    * Description text area input field and enter a project description, eg: This is the project created in the group: //*[@name='description']
    * Tags input field and enter a value in the field: //*[@id='input_tags']
    * Preview button: //*[@id='js-about-apply']
    * Create Project button from the bottom-left corner: //*[@id='save']
    * News tab and click on the custom stream created in step 2: //*[@id='jive-navbar-link-news']" from "https://confluence.devfactory.com/display/EN/Jive+HOP+Standard+E2E+Environment+Data"
Given credentials "Select the user account based on the instructions from the "Data prerequisites" row."

Scenario: Login as an admin user
Given browser "Chrome"
When I open "Default SE7 environment"
And I click on "Email Address"
And I type "doll.tearsheet@aurea.com" 
And I click on "Password"
And I type "valid Password"
And I click on "Sign in button"
Then "Application landing" page should be displayed

Scenario: Create a custom stream and add a group to the custom stream
When I click on "News tab and I click on + icon on the News page" 
And I click on "OK, Got it button from the New Stream page under Create custom streams for..heading"
And I click on "New stream field and enter the custom stream name in the field, eg: Group stream"
And I click on "Search field and enter the group name in the Search field, eg: Community Group for storing All types of contents in the search field"
And I click on "Add button under the group name under the places "
And I click on "Done button"
Then "newly created custom stream" page should be displayed

Scenario: Open a group page add in the custom stream in step 2
When I click on "Search icon" 
And I type "'Community Group for storing All types of contents' in the search field"
And I click on "Community Group for storing All types of contents name from the search result"
Then "selected group" page should be displayed

Scenario: Create a project in the Group
When I click on "Actions dropdown and select Project menu item"
And I click on "Name (Required) field and enter the project name into the input field, eg: group project"
And I click on "Description text area input field and enter a project description, eg: This is the project created in the group"
And I click on "Tags input field and enter a value in the field"
And I press "Enter" 
And I click on "Preview button" 
And I click on "Create Project button from the bottom-left corner"
Then I should see "project is created inside the group and displayed" in "project activity page"

Scenario: Verify the project added in the group displayed in the custom stream created in step 2
When I click on "News tab and click on the custom stream created in step 2"
Then I should see "the notification about the created project on step 4 is displayed" in "Social News section of the custom stream created in step 2."