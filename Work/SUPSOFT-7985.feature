Feature: SUPSOFT-7985

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "db_user"

Scenario: Run Precondition E2E
When I execute scenario "SUPSOFT-7981" to capture outputs "FirstKeyName"
Then scenario steps should complete successfully

Scenario: Run Select Preferences Query
Given DB "SQL Server" connection to "SupportSoft Database"
When I execute multiline query:
"""
SELECT * FROM sprt_assist_preferences WITH (NOLOCK) where pref_keypath = N'Software\SupportSoft\RA\User' ORDER BY pref_keyname ASC;
"""
Then queries should complete successfully
And I put the result set into "QueryResult"
And "QueryResultPrefKeyName" is a jsonpath selected value "$[0].pref_keyname" from "QueryResult"
And "QueryResultPrefInt" is a jsonpath selected value "$[0].pref_int" from "QueryResult"
Then the value of "QueryResultPrefKeyName" should be equal to '{FirstKeyName}'
Then the value of "QueryResultPrefInt" should be equal to '1'