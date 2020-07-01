Feature: KAYAKOC-11606

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Staging" from "https://confluence.devfactory.com/display/KAYAK/E2E+Environment+Data+Structure"
Given credentials "qa-admin" and "qa-staff"

Scenario: Go to Support Center
Given browser "Chrome"
When I open "{environment.staging-visitor.URL}"
Then "Kayako" page should be displayed

Scenario: Test the search widget
When I set "Search Textbox (in Middle of Screen)" value to "test"
And I press "ENTER"
Then "Search Result Record, containing the word Test (in Search Results)" should be displayed
And I remember a value from "Search Result Record, containing the word Test (in Search Results)" as "SearchResultRecord"

Scenario: Click on a news article
When I click on "Search Result Record, containing the word Test (in Search Results)"
Then "{SearchResultRecord}" page should be displayed

Scenario: Go to Support Center > Knowledge Base
When I click on "Knowledgebase (Link, at the top bar)"
Then "List of Item (in Knowledgebase Page)" should be displayed

Scenario: Click on an article
When I click on "Search Result Record, containing the word Test (in Search Results)"
Then "{SearchResultRecord}" page should be displayed