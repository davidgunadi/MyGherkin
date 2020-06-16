Feature: BEC-77

# EnvDS Error: href is not a confluence link

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* environment: * URL: https://app/.{env_type}.projectbeckon.com/
    * Credentials: Beckon App Admin
   
   
 * Selectors: * Username: //input[@id="login"]
    * Password: //input[@id="password"]
    * Sign-in: //div[@data-test-id="Sign In"]
    * User icon: //div[contains(@class, "top-nav__account-icon")]
    * My Accounts: //a[@ui-sref="profile.accounts"]
    * APPLICATION SUPPORT ACCOUNTS: //li[@data-test-id="profile.accounts.applicationSupportAccounts-link"]
    * Search Box: //input[@ng-model="searchBoxState.masterSearchBox"]
    * Turner row: //span[contains(text(), "617690791")]
    * Brand logo: //div[contains(div/div/img/@ng-src, "621772343")]
    * Groups: //a[@ui-sref="company.companyUsers.groups.list"]
    * Turner Standard users: //span[contains(text(), "Turner Standard users")]
    * ADD USERS: //div[@data-test-id="ADD USERS"]
    * Cuong: //tr[contains(., "Cuong") and contains(., "Account Admin")]
    * Eva: //tr[contains(., "Eva")]
    * ADD TO GROUP: //div[@data-test-id="ADD TO GROUP"]
    * Group User List: //div[@id="user-group-details-add-user"]
    * User Group Role: //button[@data-test-id="dropdownLink"]
    * Account Admin: //span[@data-test-id="Account Admin"]
    * Group Name: //div[@id="user-group-name"]/span
    * Group Name Input: //div[@id="user-group-name"]/div/input
    * Main Content: //div[@id="main-content-container"]
    * Back Arrow: //div[@icon="arrowLeft"]
    * GROUPS: //table[@class="ng-scope"]
    * Turner Standard users3: //span[contains(text(), "Turner Standard users3")]
    * Cuong delete: //tr[contains(., "Cuong")]/td/span[@index="8"]
    * Eva delete: //tr[contains(., "Eva")]/td/span[@index="8"]
    * CONFIRM: //div[@data-test-id="Confirm"]
    * Group Details Header: //div[contains(@class, "user-group-details-header")]/div/span[contains(@class, "ng-binding")]" from "https://docs.google.com/document/d/1bXMV7Kf7gcoByIm0FbDMUxrYC3JcEe_oySIdTxUI0GI/edit#heading=h.qj0uxz34vyhs"
Given credentials "There is a reference for a user with AppAdmin role <Pre-condition Credentials 1>. There are 3 possibles non-prod environments:

env=uat" and "used only for automated testing

env=qaenv" and "used for QA team testing

env=stage" and "used for testing before releases (staging)"

Scenario: Access to beckon environment 
When I open "{env.URL}"
Then "Login" page should be displayed

Scenario: Login
When I set "Username" value to "{env.credentials.username}"
And I set "Password" value to "{env.credentials.password}"
And I click on "Sign-in"
Then "Beckon home" page should be displayed

Scenario: Switch page to MY ACCOUNTS 
When I click on "User icon"
And I click on "My Accounts"
Then "MY ACCOUNTS" page should be displayed

Scenario: Show Turner home page 
When I click on "APPLICATION SUPPORT ACCOUNTS"
And I set "Search Box" value to "Turner" 
And I click on "Turner row"
Then "Turner home" page should be displayed

Scenario: Switch page to User Management GROUPS 
When I click on "Brand logo"
And I click on "Groups"
Then "GROUPS" page should be displayed

Scenario: Show group details
When I click on "Turner Standard users"
Then "Turner Standard users" page should be displayed

Scenario: Add users
When I click on "ADD USERS"
And I "check" "Cuong" checkbox
And I "check" "Eva" checkbox
And I click on "ADD TO GROUP"
Then I should see "Daniel" in "Group User List"
And I should see "Erin" in "Group User List"

Scenario: Edit group role
When I click on "User Group Role"
And I click on "Account Admin"
Then I should see "Account Admin" in "User Group Role"

Scenario: Edit group name
When I click on "Group Name" 
And I set "Group Name Input" value to "Turner Standard users2"
And I click on "Main Content"
Then I should see "Turner Standard users2" in "Group Name"

Scenario: Edit group name
When I click on "Group Name"
And I set "Group Name Input" value to "Turner Standard users3"
And I click on "Main Content"
Then I should see "Turner Standard users3" in "Group Name"

Scenario: Back to User Management GROUPS page
When I click on "Back Arrow"
Then "GROUPS" page should be displayed

Scenario: Search new group
When I set "Search Box" value to "Turner Standard users3"
Then I should see "Turner Standard users3" in "GROUPS" 
And I should see "a few seconds ago" in "GROUPS"

Scenario: Show group details
When I click on "Turner Standard users3"
Then "Turner Standard users3" page should be displayed

Scenario: Edit group name
When I click on "Group Name" 
And I set "Group Name Input" value to "Turner Standard users"
And I click on "Main Content"
Then I should see "Turner Standard users" in "Group Name"

Scenario: Delete users
When I click on "Cuong delete" button
And I click on "CONFIRM"
And I click on "Eva delete" button
And I click on "CONFIRM"
Then I should see "46 Users" in "Group Details Header"