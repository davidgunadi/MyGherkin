Feature: CSRV-17615

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "qa" from "https://confluence.devfactory.com/display/AURDF/E2E+Environment+Data+Structure"
Given credentials "fogbugz"

Scenario: Create a new ticket
Given HTTP request
When I execute GET request for "https://our.manuscript.com/f/api/0/jsonapi"
Then request should complete successfully

Scenario: Create a new ticket
Given HTTP request as "curl"
When I set header "Content-Type" to "application/json" in "curl"
When I set header "Accept-Charset" to "utf-8" in "curl"
When I set body in "curl" to:
"""
{
    "token": "m5lu83bf84sbn6qrdngrc74viluva0",
    "cmd": "new",
    "ixProject": "Code Server - Test 1",
    "sTitle": "Disney Trivia",
    "sEvent": "313 is Donald Duck s car registration number",
    "sCategory": "Bug"
}
"""
When I execute POST request for "https://our.manuscript.com/f/api/0/jsonapi" in "curl"
Then request in "curl" should complete successfully
And response status should be "200"
And I put the response into "JsonResponse1" as json




Feature: CSRV-17615

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "qa" from "https://confluence.devfactory.com/display/AURDF/E2E+Environment+Data+Structure"
Given credentials "fogbugz"

Scenario: Create a new ticket
Given HTTP request
When I set header "Accept" to "application/json"
When I set header "Content-Type" to "application/json"
When I set body to:
"""
{
    "token": "m5lu83bf84sbn6qrdngrc74viluva0",
    "cmd": "new",
    "ixProject": "Code Server - Test 1",
    "sTitle": "Disney Trivia",
    "sEvent": "313 is Donald Duck s car registration number",
    "sCategory": "Bug"
}
"""
When I execute POST request for "https://our.manuscript.com/f/api/0/jsonapi"
Then request should complete successfully
And response status should be "200"
And I put the response into "JsonResponse1" as json