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
When I set header "User-Agent" to "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36 XWNP / 18.0"
When I set header "Accept" to "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,/;q=0.8,application/signed-exchange;v=b3"
When I set header "Accept-Language" to "en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7"
When I set header "Accept-Encoding" to "gzip, deflate"
When I execute GET request for "http://10.187.192.15//webnative/portalDI?action=version&debug=true"
Then request should complete successfully
And response status should be "200"

Scenario: Resume Refresh and Verify API Request Logs are Displayed
When I click on "Resume Refresh Button"
Then I should see "portalDI: Request values - name | val = [ action | version ]" in "Logs (in Logging Page)"
And I should see "Request values - name | val = [ debug | true ]" in "Logs (in Logging Page)"