Feature: SUPSOFT-3971

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Navigate to "Support Administrator Portal" and Login as Admin
Given browser "Chrome"
When I open "{environment.SupportSoft Administrator portal.URL}"
And I set "{credentials.Administrator.username}" to "Username In SA Login Page" value
And I set "{credentials.Administrator.password}" to "Password In SA Login Page" value
And I click on "Login Button In SA Login Page"
Then "SupportSoft - Support Administrator" page should be displayed

Scenario: Navigate to the section 'Reporting', open the functionality for 'New Report'
When I click on "Reporting in SA Menu"
And I click on "New Report in SA Menu"
Then "Report Detail Header (New Report)" should be displayed
And "Report XML Textarea in New Report" should be displayed
And "Save Button in New Report" should be displayed
And "Cancel Button in New Report" should be displayed

Scenario: Create a new report
Given "ReportXml" value is:
"""
<SPRTReport realtimeok="1" standard="0" version="6.0.0.1" id="1609e9b1-310f-4263-afe2-7754ad337ca8">
<Name>Test Report</Name>
<Description>Test Report Description</Description>
<Path>Account Manager</Path>
<Query mssql="true" oracle="false" db2="true">
<![CDATA[SELECT group_name "Group" FROM sprt_am_product_group ]]>
</Query>
</SPRTReport>
"""
When I set "Report XML Textarea in New Report" value to "{ReportXml}"
And I click on "Save Button in New Report"
Then "Report Saved Message in New Report" should be displayed

Scenario: Navigate to the section 'Reporting', open the functionality for newly created report
When I click on "Account Manager in SA Menu"
And I click on "Newly Created Test Report in SA Menu"
Then "Report Detail Header (Test Report)" should be displayed
And "Run Report Now Button in Test Report" should be displayed
And "Delete Button in Test Report" should be displayed

Scenario: Run newly created report
When I click on "Run Report Now Button in Test Report"
Then "Result Table With Group Column in Test Result" should be displayed
And "Back Button in Test Report" should be displayed

Scenario: Navigate back and see saved report is displayed
When I click on "Back Button in Test Report"
Then "Report Detail Header (Test Report)" should be displayed
And "Saved Reports Section in Test Report" should be displayed
And "ChooseToView DropdownList in Test Report" should be displayed
And "Delete Run Link in Test Report" should be displayed
And "Save Run Link in Test Report" should be displayed

Scenario: Delete newly created report
When I click on "Delete Button in Test Report"
And I accept the alert box by clicking on "OK"
Then "Edit Options Legend in Report Information" should be displayed
And "New Report Button in Report Information" should be displayed
And "Default Settings Button in Report Information" should be displayed