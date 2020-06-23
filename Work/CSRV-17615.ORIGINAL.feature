Feature: CSRV-17615

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "qa" from "https://confluence.devfactory.com/display/AURDF/E2E+Environment+Data+Structure"

Scenario: Create a new ticket
Given HTTP request
When I set header "Accept" to "application/json"
When I set header "Content-Type" to "application/json"
When I set body to '{"token": "{credentials.fogbugz.token}", "cmd": "new", "ixProject": "Code Server - Test 1", "sTitle": "Disney Trivia", "sEvent": "313 is Donald Duck s car registration number", "sCategory": "Bug"}'
When I execute POST request for "{environment.fogbugz.URL}"
Then request should complete successfully
Then response status should be "200"
Then I put the response into "{response}" as json

Scenario: Resolve ticket
Given "ticketId" is a jsonpath selected value "$.data.case.ixBug" from "response"
When I set header "Accept" to "application/json"
When I set header "Content-Type" to "application/json"
When I set body to '{ "accessToken": "{credentials.fogbugz.token}", "ticketingSystemUrl": "https://our.manuscript.com"}'
When I execute PUT request for "{environment.fogbugz-shim.URL}/fogbugz/issues/{ticketId}/resolve"
Then request should complete successfully
Then response status should be "200"

Scenario: Search ticket in FogBugz
When I set header "Accept" to "application/json"
When I set header "Content-Type" to "application/json"
When I set body to '{"cmd": "search", "token": "{credentials.fogbugz.token}", "q": "case: {ticketId}", "cols": "sStatus"}'
When I execute POST request for "{environment.fogbugz.URL}"
Then request should complete successfully
Then response status should be "200"
Then I put the response into "{searchresponse}" as json

Scenario: Check new ticket status
Given "status" is a jsonpath selected value "$.data.cases.[0].sStatus" from "searchresponse"
Then the value of "{status}" should be "Resolved (Fixed)"