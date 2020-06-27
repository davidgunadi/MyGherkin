Feature: PAUB-28531

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environment * Use the "UltraBand v7.x Stage - 1" environment and "UBView" endpoint for the target environment
   
   
 * Selectors * Username: //*[@id="username"]
    * Password: //*[@id="password"]
    * Login Button: //*[@id="login_button"]
    * Left Navigation Configuration: //*[@id="ubd-left-navmenu"]/li[5]
    * Left Navigation Configuration - Policy Manager: //*[@id="ubd-left-navmenu"]/li[6]/ul/li[2]/a
    * Policy Manager - Policies Tab: * //[@id="ubd-top-navmenu"]/a[3]
    * Policy Manager - Policies Tab - Add Button: //*[@id="add-button"]
    * Add Policy Form: /html/body/div[10]
    * Add Policy Form Name: //*[@id="pname"]
    * Add Policy Form Policy Type: //*[@id="policy_type"]
    * Add Policy Form Bandwidth: //*[@id="bandwidth_limit"]
    * Add Policy Form Add Button: /html/body/div[10]/div[3]/div/button[1]
    * Policies List: //*[@id="policies_list"]" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"

Scenario: Login
Given browser "Chrome"
When I open "{environments.UltraBand v7.x Stage - 1.endpoints.UBView.Login URL}"
And I set "Username" value to "{credentials.ubview-1.username}"
And I set "Password" value to "{credentials.ubview-1.password}"
And I click on "Login Button"
Then Status/Dashboard page should be displayed

Scenario: Navigate to the Policy Manager subsite
When I click "Left Navigation Configuration" 
And I click on "Left Navigation Configuration - Policy Manager"
Then Configuration/Policy Manager/Rules page should be displayed

Scenario: Navigate to the Policies tab
When I click "Policy Manager - Policies Tab"
Then Configuration/Policy Manager/Policies **page should be displayed

Scenario: Add new Policies
When I click "Policy Manager - Policies Tab - Add Button" 
And I wait until "Add Policy Form" appears
And I set "Add Policy Form Name" value to "E2ETestPolicy_SpeedLimit_1Mbps"
And I set "Add Policy Form Policy Type" value to "Bandwidth limit"
And I set "Add Policy Form Bandwidth" value to "1"
And I click Add Policy Form Add Button
Then I should see "E2ETestPolicy_SpeedLimit_1Mbps" at the end of the "Policies List"