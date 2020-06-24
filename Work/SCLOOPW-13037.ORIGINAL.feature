Feature: SCLOOPW-13037

# EnvDS Error: href is not a confluence link

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* stage * URL: Staff2 Lisa School District
    * staff * credentials: staff gradebook
      
      
    * staff2 * credentials: Staff2 Lisa School District
      
      
   
   
 * Selectors * Username: //input[@id='login_name']
    * Password: //input[@id='password']
    * Login: //a[text()='Login']
    * My Website: //a[text()='My Website']
    * Manage Site: //a[text()='Manage Site']
    * Tools: //a[text()='Tools']
    * Manage Rights: //a[contains(text(),'Manage Rights')]
    * Add New Editor: //a[contains(text(), 'Add New Editor')]
    * Staff2 2: //input[@value='1551717857089']
    * Add Editor: //a[text()='Add Editor']
    * Current Editors and Contributors: //td[contains(text(), 'Staff2 2')]
    * My Sites: //a[text()='Staff2 2']" from "https://docs.google.com/spreadsheets/d/1CniJjZt3VpjkXDZXb5hfK7qLZs_MPWqLz07IpiP8IWQ/edit#gid=0"
Given credentials "N/A"

Scenario: Tasks: Login as Staff user
Given browser "Chrome" as "Staff_Browser"
When I open "{env.stage.url}" in "Staff_Browser"
And I set "Username" value to "{env.stage.staff.credentials.username}" in "Staff_Browser"
And I set "Password" value to "{env.stage.staff.credentials.password}" in "Staff_Browser"
And I click on "Login" in "Staff_Browser"
Then "Welcome Staff User!" page should be displayed in "Staff_Browser"

Scenario: Open Staff User web site
When I click on "My Website" in "Staff_Browser"
Then "Staff User" page should be displayed in "Staff_Browser"

Scenario: Open Manage Site
When I click on "Manage Site" in "Staff_Browser"
Then "User Site Center" page should be displayed in "Staff_Browser"

Scenario: Open Manage Rights
When I click on "Tools" in "Staff_Browser"
And I click on "Manage Rights" in "Staff_Browser"
Then "Assign Rights: Minisite" page should be displayed in "Staff_Browser"

Scenario: Add user as editor
When I click on "Add New Editor" in "Staff_Browser"
And I click on "Staff2 2" in "Staff_Browser"
And I click on "Add Editor" in "Staff_Browser"
Then I should see "Staff2 2" in "Current Editors and Contributors" in "Staff_Browser"

Scenario: Tasks: Login as Staff 2 user
Given browser "Chrome" as "Staff2_Browser"
When I open "{env.stage.url}" in "Staff2_Browser"
And I set "Username" value to "{env.stage.staff2.credentials.username}" in "Staff2_Browser"
And I set "Password" value to "{env.stage.staff2.credentials.password}" in "Staff2_Browser"
And I click on "Login" in "Staff2_Browser"
Then I should see "Staff User" in "My Sites" in "Staff2_Browser"