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

//Page is Displayed (Work for Partial Page Name)
Then "Username Avatar" page should be displayed

//multiple iFrames
"Any row item": ["//iframe[@id='fr1']", "//iframe[@id='fr2']", "//iframe[@id='fr3']", "//tr[contains(@class, 'GridRow_Aptean')]"],

//set Date Time to variable
Given "currentTime" value is the current datetime "+0 milliseconds"

//save a value to variable
And I remember a value from ["title" atribute of] "selector" as "variableName"

//verify a selector contains a text
Then I should see "text" in "selector"

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


When I set "Channel Dropdown in Home page" value to "KMPS Trade Press Media Group"
And I set "Customer Dropdown in Home page" value to "KMPS TradePress Subscribers ( UAD / CIRC )"

When I set "Channel Dropdown in Home page" value to "Knowledge Marketing"
And I set "Customer Dropdown in Home page" value to "Knowledge Marketing Subscribers ( PRT / UAD / CIRC )"

UAD (Button in Main Page): //a[@class='btnProduct'][text()='UAD']
Filters (Navigation Menu): //a[contains(@class,'NavigationMenu')][text()='Filters']
Question Category (Navigation Menu): //a[contains(@class,'NavigationMenu')][text()='Question Category']
Question Category (Page Header): //span[contains(@id,'lblMenuSelected')][text()='Question Category']
Collapse All (in Question Category Menu): //a[text()='Collapse All']
Expand All (in Question Category Menu): //a[text()='Expand All']
The Line from Parent to Child (in Question Category Menu): //td[@class='rtlL rtlL3']

Sales View (Navigation Menu): //a[contains(@class,'NavigationMenu')][text()='Sales View']
Questions Category Table (in Sales View): //td[text()='Questions Category']
First Item in Question Category Table (in Sales View): //li[@class='rtLI rtFirst']/div/span[@class='rtIn']

















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




{"type": "dropdown",  "open": "//select[contains(@id, 'ddlCustomerID')]", "value": "//select[contains(@id, 'ddlCustomerID')]/option[text()='{value}']"}


////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              KAYAKOC                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/KAYAK/E2E+Environment+Data+Structure
Search Textbox (in Middle of Screen): //input[@name='searchquery']
Search Result Record, containing the word Test (in Search Results): //div[@class='kbsearch']/a[contains(text(),'Test')]
Knowledgebase (Link, at the top bar): //a[@class='toptoolbarlink'][text()='Knowledgebase']
List of Item (in Knowledgebase Page): //div[@class='list-table']
First Item under Knowledgebase Table: //div[contains(@class,'kbarticlecontainer')][1]//a

Tickets (Link in Top Menu): //div[@class='menutext'][text()='Tickets']
Manage Tickets (Link in Top Menu): //div[@class='topnavmenuitem'][text()='Manage Tickets']
SUBJECT (Grid Title): //td[@class='gridtabletitlerow'][contains(text(),'Subject')]
First Item Subject (in Manage Tickets Grid): //tr[contains(@id,'gridrowid_ticketmanagegrid')][1]//div[@class='subjectspancontainer']//a

Settings Link (on Top Menu): //div[contains(@class,'topnav')][text()='Settings']
Settings Link (on the Left Bar): //div[@class='BarItem'][@title='Settings']
Settings Tab (in Right Hand Panel): //div[@id='View_Settingstabs']
Date and time (in Settings List): //a[contains(@href,'Settings')][contains(.,'Date and time')]
Knowledgebase (in Settings List): //a[contains(@href,'Settings')][contains(.,'Knowledgebase')]


Apps (Link, in Left Menu): //div[contains(@class,'BarItem')][@title='Apps']
Logs (Link, in Left Menu): //div[contains(@class,'BarItem')][@title='Logs']
Diagnostics (Link, in Left Menu): //div[contains(@class,'BarItem')][@title='Diagnostics']
Error Log (Link, in Left Menu): //div[@class='BarOptionPad'][text()='Error Log']
PHP Info (Link, in Left Menu): //div[@class='BarOptionPad'][text()='PHP Info']