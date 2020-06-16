Feature: XINET-14713

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Automation QA" from "https://confluence.devfactory.com/display/NOR/Xinet+Environment"
Given credentials "nativeadmin"

Scenario: Login to Xinet Server
Given browser "Chrome"
When I open "{environment.SERVER.Login URL}"
Then "summary" should be displayed

Scenario: Verify Summary on Database tab
When I click on "Top Navigation - DATABASE"
And I click on "Sub Navigation - Admin"
And I click on "Page Navigation - Summary"
Then "Header - SERVER INFO" should be displayed