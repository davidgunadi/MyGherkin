// Dummy Ticket
https://jira.devfactory.com/browse/TS-5834

// Select a dropdown value - This uses the value attribute in an option
And I set "en_CA" to "the 'User Locale' sub-section dropdown list" value

//Type into textbox
And I set "<selector>" value to "XXX"

//Click
And I click on "Login Button"

//isDisplayed
Then "Username Avatar" should be displayed

//Page is Displayed
Then "Username Avatar" page should be displayed

//multiple iFrames
"Any row item": ["//iframe[@id='fr1']", "//iframe[@id='fr2']", "//iframe[@id='fr3']", "//tr[contains(@class, 'GridRow_Aptean')]"],

//set Date Time to variable
Given "currentTime" value is the current datetime "+0 milliseconds"

//save a value to variable
And I remember a value from ["title" atribute of] "selector" as "variableName"

//verify a selector contains a text
Then I should see "{text}" in "selector"

//Create Random Text
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"

//Date
Given "NextMonthDateInMMDDYYYY" default value is "{date('MM/DD/YYYY','30 days')}"

// Set Window Size
And I set window size to "1280x1024"

// Remember Alert Text and Validate
Then I remember the alert text as "AlertMessage"
And the value of "AlertMessage" should be "Are you sure you want to backup the database?"



////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                             CRM                                    //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
ACRM Main Frame
["//iframe[@id='mainFrame']", ""]
CRM Work 1
["//iframe[@id='mainFrame']", "//iframe[@id='work1']", ".u8-queryeditor-infoarea-header"]


////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                             ADCM                                   //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/ADCM/DCM+Environments+Data+Structure
ADCM Frame Container - CacheframeX - Subpage
["//frame[@name='container']", "//iframe[@id='cacheframe0']", "//frame[@name='subpage']", ""]
ADCM Frame Container - CacheframeX - Proppage
["//frame[@name='container']", "//iframe[@id='cacheframe0']", "//frame[@name='proppage']", ""]
ADCM Left Menu Link
["//frame[@name='sidebar']", ""]


////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                         GFI Archiver                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
https://confluence.devfactory.com/display/GFIA/Yaml+Environments




////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                             ECN                                   //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/KM/KMECN+E2E+Environment+Data+Structure


////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                             BOINT                                  //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure
//http://spadmin:Password%231@automation1


////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              DNN                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
DNN Persona Bar Frame
["//iframe[@id='personaBar-iframe']", ""]


////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              SUPSOFT                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Supsoft LeftFrame
["//frame[@name='mainAdmin']", "//frame[@name='sadLeftFrame']", ""]
Supsoft RightFrame
["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", ""]



////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              JVHOPST                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/EN/Jive+HOP+Standard+E2E+Environment+Data






////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              PAUB                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure

Configuration (in Left Menu): //ul[@id='ubd-left-navmenu']//li[text()='Configuration']
Policy Manager (in Left Menu)://ul[@id='ubd-left-navmenu']//a[text()='Policy Manager']
Policies (Top Menu Link, in Policy Manager Page): //div[@id='ubd-top-navmenu']/a[text()='Policies']
Name Textbox (in Add Policy Popup): //input[@id='pname']
Policy type Dropdown (in Add Policy Popup): //select[@id='policy_type']
Bandwidth Limit (in Add Policy Popup): //input[@id='bandwidth_limit']
E2ETestPolicy_SpeedLimit_1Mbps (in the last row of Policy Table)://table[@id='policies_list']/tbody/tr[last()]/td[normalize-space(text())='E2ETestPolicy_SpeedLimit_1Mbps']
Checkbox (for E2ETestPolicy_SpeedLimit_1Mbps): //table[@id='policies_list']/tbody/tr[contains(.,"E2ETestPolicy_SpeedLimit_1Mbps")]//input[@type='checkbox']



Add Button (for List): //div[@id='list_buttons']//span[@class='ui-button-text'][text()='Add']
Delete Button (for List): //div[@id='list_buttons']//span[@class='ui-button-text'][text()='Delete']
Add Button (in Popup): //div[@class='ui-dialog-buttonset']//span[@class='ui-button-text'][text()='Add']
Delete Confirmation Button (in Popup): //div[@id='delete_one_confirmation']/following-sibling::div//span[@class='ui-button-text'][text()='Delete']

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              XINET                                 //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/NOR/Xinet+Environment
["//iframe[@id='waFrame']", ""]
["//iframe[@id='ldif']", "//pre"]

Logs (in Logging Page): ["//iframe[@id='ldif']", "//pre"]
Stop Refresh Button: //input[@value='Stop Refresh']
Resume Refresh Button: //input[@value='Resume Refresh']
