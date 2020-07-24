Feature: snsgcid-69343
Scenario: 'Report Execution - Date time quick filter result in result grid - [26174548]'
Given selectors
"""
 "x0": "descendant-or-self::app-login",
 "x1": "descendant-or-self::*[@name = 'username']",
 "x2": "descendant-or-self::*[@name = 'password']",
 "x3": "//button[normalize-space(.)='Login']",
 "x4": "//div[contains(@class,'df-sidebar__item--active')]//a[normalize-space(.)='Dashboard']",
 "x5": "//a[normalize-space(.)='Data Design']",
 "x6": "//a[normalize-space(.)='Reports']",
 "x7": "//tr[1]/td[contains(@class,'df-grid__selection-column')]",
 "x8": "//button[contains(@class,'btn-primary text-light')]"

"""
 Given browser 'Chrome'
 When I open 'https://e2e-single.sensage.aureacentral.com:28201/analyzer'
# Step:- "Open environment URL in an incognito browser window. \
#				 Set Username and Password fields and click \"Login\" button \
#				 Access menu \"Data Design -> Reports\" \
#				 Select \"TEST-69343-REPORT\" report in the report list \
#				 Click \"Run\" dropdown \
#				 Click \"Run once\" option \
#				 Wait until \"Status\" column for the report \"TEST-69343-REPORT\" displays \"DONE\" \
#				 Select the report in the list. \
#				 Click \"View\" button"
 When I open 'https://e2e-single.sensage.aureacentral.com:28201/analyzer'
 Then 'x0' should be displayed
 When I press 'LCTRL+a'
 When I set 'x1' value to " "
 When I set 'x1' value to 'TEST-69343'
 When I press 'LCTRL+a'
 When I set 'x2' value to " "
 When I set 'x2' value to 'TEST-69343'
 Then 'x3' should be displayed
 When I click on 'x3'
 Then 'x4' should be displayed
 When I click on 'x5'
 When I click on 'x6'
# Verification:- '"TEST-69343-REPORT" report execution results screen is displayed'
 Then 'x7' should be displayed
# Step:- 'Hover the mouse over the first row, in the "ts" column'
# Verification:- 'A filter icon is displayed in the cell'
# Step:- 'Click filter icon'
# Verification:- '"Quick Filter" options are displayed: "Minute", "Hour", "Day", "week", "month"'
 Then 'x7' should be displayed
 Then 'x8' should be displayed
 Then 'x8' should be displayed
# Step:- 'Click "Minute" option'
 When I click on 'x8'
# Verification:- "\"ts\" filter (input text below the column header) is populated with a date\ \
#        range from second 0 to second 59 of the minute of the selected \"ts\" field \
#				 Only results within the selected date minute of the \"ts\" field will be displayed"
 Then the value of 'actualTimeRange' should contain '${timeRange.start.format(Constants.fullFormatDate)} TO ${timeRange.end.format(Constants.fullFormatDate)}'
# Step:- "Remove \"ts\" filter by clicking (x) in the filter field \
#				 Hover the mouse over the first row, in the \"ts\" column \
#				 Click filter icon \
#				 Click \"Hour\" option"
# Verification:- "\"ts\" filter (input text below the column header) is populated with a date\ \
#        range from minute and second 00:00 to minute and second 59:59 of the hour of the selected \"ts\" field \
#				 Only results within the selected date hour of the \"ts\" field will be displayed"
 Then the value of 'actualTimeRange' should contain '${timeRange.start.format(Constants.fullFormatDate)} TO ${timeRange.end.format(Constants.fullFormatDate)}'
# Step:- "Remove \"ts\" filter by clicking (x) in the filter field \
#				 Hover the mouse over the first row, in the \"ts\" column \
#				 Click filter icon \
#				 Click \"Day\" option"
# Verification:- "\"ts\" filter (input text below the column header) is populated with a date\ \
#        range from 00:00:00 to 23:59:59 of the day of the selected \"ts\" field \
#				 Only results within the selected date day of the \"ts\" field will be displayed"
 Then the value of 'actualTimeRange' should contain '${timeRange.start.format(Constants.fullFormatDate)} TO ${timeRange.end.format(Constants.fullFormatDate)}'
# Step:- "Remove \"ts\" filter by clicking (x) in the filter field \
#				 Hover the mouse over the first row, in the \"ts\" column \
#				 Click filter icon \
#				 Click \"week\" option"
# Verification:- "\"ts\" filter (input text below the column header) is populated with a date\ \
#        range from 00:00:00 of the first day of the week to 23:59:59 of the last day of the week, of the selected \"ts\" field \
#				 Only results within the selected date week of the \"ts\" field will be displayed"
 Then the value of 'actualTimeRange' should contain '${timeRange.start.format(Constants.fullFormatDate)} TO ${timeRange.end.format(Constants.fullFormatDate)}'
# Step:- "Remove \"ts\" filter by clicking (x) in the filter field \
#				 Hover the mouse over the first row, in the \"ts\" column \
#				 Click filter icon \
#				 Click \"month\" option"
# Verification:- "\"ts\" filter (input text below the column header) is populated with a date\ \
#        range from 00:00:00 of the first day of the month to 23:59:59 of the last day of the month, of the selected \"ts\" field \
#				 Only results within the selected date month of the \"ts\" field will be displayed"
 Then the value of 'actualTimeRange' should contain '${timeRange.start.format(Constants.fullFormatDate)} TO ${timeRange.end.format(Constants.fullFormatDate)}'
