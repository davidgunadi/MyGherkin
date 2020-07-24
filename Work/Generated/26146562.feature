Feature: snsgcid-66252
Scenario: 'Analytics Workbench - Create an analytic request - [26146562]'
Given selectors
"""
 "x0": "descendant-or-self::app-login",
 "x1": "descendant-or-self::*[@name = 'username']",
 "x2": "descendant-or-self::*[@name = 'password']",
 "x3": "//button[normalize-space(.)='Login']",
 "x4": "//div[contains(@class,'df-sidebar__item--active')]//a[normalize-space(.)='Dashboard']",
 "x5": "//a[normalize-space(.)='Data Design']",
 "x6": "//a[normalize-space(.)='Analytics Workbench']",
 "x7": "(//*[contains(@class,'df-loader__container')])[1]",
 "x8": "descendant-or-self::*[@class and contains(concat(' ', normalize-space(@class), ' '), ' toolbar ')]/descendant-or-self::*/df-icon[@name = 'pencil']",
 "x9": "//h1[contains(text(),'Analytic Request')]",
 "x10": "//div[contains(@class,'df-input__infix')]/textarea",
 "x11": "//span[contains(text(), 'Submit')]/ancestor::button",
 "x12": "//input[contains(@class, 'file-upload__input')]",
 "x13": "//span[contains(text(), 'reportAutoExport.xml')]",
 "x14": "//span[contains(text(), 'Reset')]/ancestor::button"

"""
 Given browser 'Chrome'
 When I open 'https://se7-single.sensage.aureacentral.com:28096/datasets-preload/TEST-66252'
# Step:- "Open Analyzer URL in an incognito browser window. \
#				 Set Username and Password fields and click Login button \
#				 Access Data Design -> Analytics Workbench menu"
 When I open 'https://e2e-single.sensage.aureacentral.com:28201/analyzer'
 Then 'x0' should be displayed
 When I press 'LCTRL+a'
 When I set 'x1' value to " "
 When I set 'x1' value to 'TEST-66252'
 When I press 'LCTRL+a'
 When I set 'x2' value to " "
 When I set 'x2' value to 'TEST-66252'
 When I click on 'x3'
 Then 'x4' should be displayed
# Verification:- 'Analytics Workbench screen will be opened'
 When I click on 'x5'
 When I click on 'x6'
 Then 'x7' should be displayed
# Step:- 'Click Create an analytic request button'
 When I click on 'x8'
# Verification:- "Analytic Request modal window will open, displaying: \
#		    \"Please describe the desired analytic function below\" text area (required) \
#		    \"Choose file\" button \
#		    Warning message \
#		    Submit button (disabled) \
#		     Reset button (enabled) \
#		    Cancel button (enabled)"
 Then 'x9' should be displayed
 Then 'x10' should be displayed
# Step:- 'Write any message in the text area'
 When I press 'LCTRL+a'
 When I set 'x10' value to " "
 When I set 'x10' value to 'test_message_jDFbzi54Th'
# Verification:- 'Submit button will be enabled'
 Then 'x11' should be displayed
# Step:- 'Click Choose file button'
 When I set 'x12' value to '/Users/priyansusingh/codenation-projects/ignite-sensage-automation-ui/resources/reportAutoExport.xml'
# Verification:- '"Choose file" button'
 Then 'x13' should be displayed
# Step:- 'Click Reset button'
 When I click on 'x14'
# Verification:- 'Text area and file will be cleaned'
 Then 'x10' should be displayed
# Step:- "Write Message to administrator in the text area and choose a file with a few bytes length \
#				 Click Submit button"
 When I press 'LCTRL+a'
 When I set 'x10' value to " "
 When I set 'x10' value to 'test_message_jDFbzi54Th'
 Then 'x12' should be displayed
# Verification:- 'Modal window will close'
 Then 'x13' should be displayed
# Step:- "Open Mailbox URL in an incognito browser window. \
#				 Wait up to 1 minute until the email is displayed in the inbox"
# Verification:- "An email is displayed in the top of the list of the received messages. \
#				 The email subject will be \"Analytic Request - TEST-66252 sensage@server.domain\""
 Then 'x11' should be displayed
 Then 'x11' should be displayed
# Step:- 'Click in the email'
 When I click on 'x11'
# Verification:- 'Email content will be "Message to administrator"'
 Then 'x7' should be displayed
# Step:- 'Click in Attachments menu'
# Verification:- 'A zip file will be displayed'
 Then 'x9' should be displayed
