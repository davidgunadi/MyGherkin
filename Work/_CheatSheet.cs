// Dummy Ticket
https://jira.devfactory.com/browse/TS-5834

// Select a dropdown value - This uses the value attribute in an option
And I set "value" to "selector" value

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

// Custom Selector
{"type": "dropdown",  "open": "//select[contains(@id, 'ddlCustomerID')]", "value": "//select[contains(@id, 'ddlCustomerID')]/option[text()='{value}']"}

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

Search Button (in Summary Page): ["//iframe[@id='waFrame']", "//input[@value='Search']"]
Search Textbox (in Summary Page): ["//iframe[@id='waFrame']", "//form[@name='searchForm']//input[@type='text']"]
Search Result Record (in Summary Page): ["//iframe[@id='waFrame']", "//a[@class='DIRLIST']"]







////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              KAYAKOC                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/KAYAK/E2E+Environment+Data+Structure





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
Then I should see "Knowledge Marketing" in "Selected Channel Dropdown option in Home page"
And I should see "Knowledge Marketing Subscribers ( PRT / UAD / CIRC )" in "Selected Customer Dropdown option in Home page"

Form Designer (Button in Main Page): //a[@class='btnProduct'][text()='Form Designer']
Group Filter Textbox (under Active Forms): //input[@id='GroupName']
Group Filter Dropdown (under Active Forms): //div[@id='SearchPanel']//label[text()='Group:']/following-sibling::span[@aria-owns='GroupSearchCriteria_listbox']
contains (dropdown option for Group): //div[@id='GroupSearchCriteria-list']//div[text()='contains']
starts with (dropdown option for Group): //div[@id='GroupSearchCriteria-list']//li[text()='starts with']
equals (dropdown option for Group): //div[@id='GroupSearchCriteria-list']//li[text()='equals']
ends with (dropdown option for Group): //div[@id='GroupSearchCriteria-list']//li[text()='ends with']
Search Button (under Active Forms): //input[@id='search']
Group Cell (in First Row, under Active Forms Grid): //div[@id='ActiveForms']//tbody/tr[1]/td[3]

Logout Link: //a[text()='Logout']




////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              NORTHP                                //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/NOR/Telescope+-+Testing+environments+-+Data+Structure+Environments
["//iframe[@id='fieldsearchframe']", ""]
["//iframe[@id='contentframe']", ""]



////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              SENSAGE                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/SEN/Sensage+EnvDS
Search Textbox (at bottom of page, in Analytics Workbench): //input[@id='df-input-5']
Sample Chart From Table Pie and Bar Graph (Cell): //div[@container='body'][contains(text(),'Chart From Table')][contains(text(),'Pie and Bar Graph')]




Sample Chart From Table Pie and Bar Graph (Cell, in Analytics Model Execution Queue): //div[@role='dialog']//span[contains(text(),'Chart From Table')][contains(text(),'Pie and Bar Graph')]
View results button (in Analytics Model Execution Queue): //span[@class='df-button__content'][contains(text(),'View results')]
Execution results for model Sample Chart From Table Pie and Bar Graph (Dialog): //h1[contains(text(),'Execution results for model')][contains(text(),'Chart From Table')][contains(text(),'Pie and Bar Graph')]

Show all preview Checkbox (in Execution Results Dialog): //button[contains(.,'Show all preview')]
Output HTML (.html file): //div[@class='row'][contains(.,'Output HTML')][contains(.,'(.html file)')]
Bar Chart (.png file): //div[@class='row'][contains(.,'Bar Chart')][contains(.,'(.png file)')]
Pie Chart (.png file): //div[@class='row'][contains(.,'Pie Chart')][contains(.,'(.png file)')]
First Output - Https Link: //div[contains(@class,'output-container')]/div[1]//a[@class='p-3'][contains(@href,'https://dev-single.sensage.aureacentral.com:28093/api/files/')]
Second Output - Https Link: //div[contains(@class,'output-container')]/div[2]//a[@class='p-3'][contains(@href,'https://dev-single.sensage.aureacentral.com:28093/api/files/')]
Third Output - Https Link: //div[contains(@class,'output-container')]/div[3]//a[@class='p-3'][contains(@href,'https://dev-single.sensage.aureacentral.com:28093/api/files/')]
First Output - HTML Table Preview: ["//iframe[@class='w-100 ng-star-inserted']", "//table"]
Second Output - Image Preview: //div[2]/app-output-preview/div[contains(@class,'output-preview')]//img[@class='mw-100 ng-star-inserted']
Third Output - Image Preview: //div[3]/app-output-preview/div[contains(@class,'output-preview')]//img[@class='mw-100 ng-star-inserted']

First Output - Magnifier Icon: //div[1]/app-output-preview//df-icon[contains(@class,'fa-search')]
First Output - Expand (Fullscreen) Icon: //div[1]/app-output-preview//df-icon[contains(@class,'fa-expand')]
First Output - In Fullscreen Mode: //div[1]/app-output-preview/div[contains(@class,'df-fullscreen--expanded')]


First Output - Print Icon: //div[1]/app-output-preview//df-icon[contains(@class,'fa-print')]


First Output - Arrow to the Right (Click to view or download the output file) Icon: //div[1]/app-output-preview//df-icon[contains(@class,'fa-share')]
HTML Table (in Second Window): //table