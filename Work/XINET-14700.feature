Feature: XINET-14700

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "stage" from "https://confluence.devfactory.com/display/NOR/Xinet+Environment"
Given credentials "nativeadmin"

Scenario: Login to Xinet Server
Given browser "Chrome"
When I open "{environment.SERVER.URLCred}"
Then "summary" should be displayed

Scenario: Navigate to LOGGING -> Database
When I click on "Logging Header Tab"
And I click on "Database (sub header Link, under Logging)"
Then "Logs (in Logging Page)" should be displayed

Scenario: Stop Logging Refresh
When I click on "Stop Refresh Button"
Then "Resume Refresh Button" should be displayed

Scenario: Send API Request to GET Xinet Version
Given HTTP request
When I set header "Authorization" to "Basic bmF0aXZlYWRtaW46bmF0aXZlYWRtaW4="
When I execute GET request for "http://10.187.192.15//webnative/portalDI?action=version&debug=true"
Then request should complete successfully
And response status should be "200"

Scenario: Resume Refresh and Verify API Request Logs are Displayed
When I click on "Resume Refresh Button"
Then I should see "portalDI: Request values - name | val = [ action | version ]" in "Logs (in Logging Page)"
Then I should see "Request values - name | val = [ debug | true ]" in "Logs (in Logging Page)"