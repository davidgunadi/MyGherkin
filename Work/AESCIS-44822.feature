Feature: AESCIS-44822

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "CIS STG Environment" from "https://confluence.devfactory.com/pages/viewpage.action?pageId=413214385"
Given credentials "WebsiteCredsSTG"

Scenario: Login
Given browser "Chrome"
When I open "{environment.Stream CSR Web site.URL}"
And I set "User Name" value to "{credentials.WebsiteCredsSTG.username}"
And I set "Password" value to "{credentials.WebsiteCredsSTG.password}"
And I click on "Login"









# Original
Feature: AESCIS-44822

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environment: CIS STG Environment
 * Selectors * Navbar * Quick Search: /html[1]/body[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/div[1]/div[1]/div[1]/input[1]
       * Search Button: /html[1]/body[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/div[1]/button[1]
      
      
    * Account Summary * Edit Rate: /html[1]/body[1]/div[3]/form[1]/div[5]/div[7]/div[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[2]/div[1]/table[1]/tbody[1]/tr[6]/td[2]/a[2]/span[1]
      
      
    * Rate Management * Fixed Rate Plan: /html[1]/body[1]/form[1]/div[3]/div[1]/table[1]/tbody[1]/tr[1]/td[2]/div[3]/div[1]/table[1]/tbody[1]/tr[1]/td[1]
       * Rate Amount Input: /html[1]/body[1]/form[1]/div[3]/div[1]/table[1]/tbody[1]/tr[1]/td[2]/div[4]/div[1]/table[1]/tbody[1]/tr[2]/td[4]/input[1]
       * Save: /html[1]/body[1]/form[1]/div[2]/div[2]/button[2]/i[1]
       * Rate Tansition Table: /html[1]/body[1]/form[1]/div[3]/div[3]/table[1]/tbody[1]/tr[1]/td[1]/table[1]/tbody[1]/tr[1]/td[9]/div[1]/table[1]
       * Expand Rate Transition: /html[1]/body[1]/form[1]/div[3]/div[3]/table[1]/tbody[1]/tr[1]/td[1]/table[1]/tbody[1]/tr[2]/td[1]/img[1]
       * Rate Details Table: /html[1]/body[1]/form[1]/div[3]/div[3]/table[1]/tbody[1]/tr[1]/td[1]/table[1]/tbody[1]/tr[3]/td[1]/div[1]/table[1]
       * Rate Amount Cell: /html[1]/body[1]/form[1]/div[3]/div[3]/table[1]/tbody[1]/tr[1]/td[1]/table[1]/tbody[1]/tr[3]/td[1]/div[1]/table[1]/tbody[1]/tr[3]/td[9]/div[1]" from "https://confluence.devfactory.com/pages/viewpage.action?pageId=413214385"
Given credentials "N/A"

Scenario: Login
Given browser "Chrome"
When I execute scenario "AESCIS-36583"
Then scenario steps should complete successfully

Scenario: Navigate to Account Summary Page
Given browser "Chrome"
When I set "Quick Search" to "4001935479" value
And I click on "Search Button"
Then "Account Summary" page should be displayed

Scenario: Navigate to Rate Management
Given browser "Chrome"
When I click on "Edit Rate"
Then "Rate Management" page should be displayed

Scenario: Add New Rate Transition
Given browser "Chrome"
When I click on "Fixed Rate Plan"
And I set "Rate Amount Input" to "0.06480" value
And I click on "Save"
Then "Rate Management page" should not be displayed

Scenario: Verify Rate Transition
Given browser "Chrome"
When I click on "Edit Rate"
Then "Rate Management" page should be displayed 
And I should see "Rate Transition Record" in "Rate Transition Table"

Scenario: Verify Rate Details
Given browser "Chrome"
When I click on "Expand Rate Transition"
Then "Rate Details Table" should be displayed
And I should see "0.06480" in "Rate Amount Cell"