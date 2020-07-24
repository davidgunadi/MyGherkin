Feature: snsgcid-68963
Scenario: 'Report Schedules - Report Schedules Permissions - Edit Permission for a group - [26133266]'
Given selectors
"""
 "x0": "descendant-or-self::app-login",
 "x1": "descendant-or-self::*[@name = 'username']",
 "x2": "descendant-or-self::*[@name = 'password']",
 "x3": "//button[normalize-space(.)='Login']",
 "x4": "//div[contains(@class,'df-sidebar__item--active')]//a[normalize-space(.)='Dashboard']",
 "x5": "//a[normalize-space(.)='Scheduler']",
 "x6": "//a[normalize-space(.)='Schedules']",
 "x7": "(//*[contains(@class,'df-loader__container')])[1]",
 "x8": "//span[contains(text(), 'TEST-68963-SCHEDULE')]/ancestor::tr//df-checkbox",
 "x9": "descendant-or-self::*[@name = 'lock']",
 "x10": "//span[normalize-space(text())='Users and Groups']/parent::div [contains(@class, 'df-grid-column__cell-content')]//input",
 "x11": "//span[normalize-space(text())='View']/parent::div//df-checkbox",
 "x12": "//span[contains(text(),'Save')]",
 "x13": "descendant-or-self::*[@class and contains(concat(' ', normalize-space(@class), ' '), ' df-user-profile__wrapper ')]",
 "x14": " //button[normalize-space(.)='Logout']",
 "x15": "descendant-or-self::app-schedules"

"""



# Step:- "Select TEST-68963-SCHEDULE report schedule \
#        Click \'Edit permissions\' button"
 When I click on 'x8'
 When I click on 'x9'
# Verification:- 'A new modal window will pop-up, and will display the permissions for the report schedule selected'
 Then 'x7' should be displayed
# Step:- 'Filter rows using header filter of "Users and Groups" with value TEST-68963-GROUP'
# Verification:- "A single row will be displayed \
#        View, Edit and Delete permissions will be unchecked."
 When I set 'x10' value to 'TTEST-68963-GROUP'
 When I press 'ENTER'
# Step:- "Check \"View\" permission \
#        Click \'Save\' button"
# Verification:- 'Modal window will close'
 Then 'x11' should be displayed
# Step:- "Open environment URL in an incognito browser window \
#        Set Username and Password fields; with TEST - 68963 - USER1 credentials; and; click; Login; button; \
#        Navigate; to; Report; Schedules; from; the; menu; \'Scheduler\' - > \'Schedules\'; "
 When I click on 'x11'
 When I click on 'x12'
 When I click on 'x13'
 When I click on 'x14'
 Then 'x7' should be displayed
 When I press 'LCTRL+a'
 When I set 'x1' value to " "
 When I set 'x1' value to 'TEST-68963-USER1'
 When I press 'LCTRL+a'
 When I set 'x2' value to " "
 When I set 'x2' value to 'TEST-68963-USER1'
 When I click on 'x3'
 Then 'x4' should be displayed
# Verification:- '"Report Schedules" tab is opened and TEST-68963-SCHEDULE report schedule is displayed'
 When I click on 'x5'
 When I click on 'x6'
 Then 'x7' should be displayed
 Then 'x15' should be displayed
# Step:- 'Select the report schedule'
 When I click on 'x8'
# Verification:- '"Edit" button remains disabled'
 Then 'x9' should be displayed



Lock Icon (Edit permissions button) (In Scheduler Page): //button[.//df-icon[@name='lock']]
TEST-68963-GROUP Record: //td[contains(@class,'df-grid-table-body__cell')][contains(.,'TEST-68963-GROUP')]