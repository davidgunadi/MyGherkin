Feature: PAUB-29838

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred"

Scenario: Log in as padmin
Given browser "Chrome"
When I open "{environment.UBView.Login URL}"
And I set "username" value to "{credentials.UBView-Cred.username}"
And I set "password" value to "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Dashboard" page should be displayed

Scenario: Navigate In Maintenance Functionalities
Given "Today" default value is "{date('YYMMDD')}"
When I click on "Maintenance Link"
And I click on "Logs (under Maintenance)"
And I click on "Export Logs (in Logs Page)"
And I wait until "operation executed" appears
And I wait until the file downloaded
Then I remember the downloaded filename as "downloadedFileName"
And the file "{downloadedFileName}" should be downloaded
And the value of "downloadedFileName" should contain "system_logs_{Today}"