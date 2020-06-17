Feature: ADCM-17180

# EnvDS Error: YAMLException: end of the stream or a document separator is expected at line 3, column 1:
    You can find the link of the doc ... 
    ^

Login into the DCM UI.
The DCM Welcome page is opened.

Go to the "Reports" tab.
The favorite reports page with the "RESULTS OF FAVORITE REPORT SEARCH" table is opened.

Click on the "SQL/OQL Reporting" sub tab on the left.
The "SQL/OQL Reporting" page is opened.

Click on the "Query Details" tab on the top.
The "Query Details" tab with the "Query" textarea field is opened in the page.

Check the "OQL" raido button in the "Query Type" field, write "select p.name from SCCMProduct p" in the "Query" text area and click on the "Verify & Execute Query" button.
It validates the query and executes it, then retrieves all product records in the database including the products created in the precondition steps. The records are shown in the "Execution Results" on the bottom of the page.

Click on the "Save Query" button.
A popup is opened and asked you the name of the query which you save.

Enter a query name(e.g."products1") in the popup and click on the "OK" button.
The popup window is closed and the query is saved and shown with the name that you enter in the "Query Name" column, "OQL" in the "Type" column in the "Queries" list in the "Query List" tab.
Scenario: Preconditions
Given environment "Login into the "Develop Branch Enterprise ( Next Release Version )" environment." from "https://confluence.devfactory.com/display/ADCM/DCM+QA+Environments"
Given credentials "Check the credentials of the "Develop Branch Enterprise ( Next Release Version )" environment."

