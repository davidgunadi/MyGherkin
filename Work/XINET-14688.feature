Feature: XINET-14688

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "stage" from "https://confluence.devfactory.com/display/NOR/Xinet+Environment"
Given credentials "nativeadmin"

Scenario: Login to Xinet Server
Given browser "Chrome"
When I open "{environment.SERVER.URLCred}"
Then "summary" should be displayed

Scenario: Navigate to DATABASE -> Admin -> backup
When I click on "Database Header Tab"
And I click on "Admin Tab In Database Menu"
And I click on "backup Tab (under Admin)"
