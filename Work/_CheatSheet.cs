//Examples Table
KAYAKOC-18044

//Upload
CRM-71603

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

// Remember Variable Value
I remember a value from ["<attribute>" attribute of] "<selector>" [in "<ui driver instance id>"] as "<variable>"

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
//                              DNN                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
DNN Persona Bar Frame
["//iframe[@id='personaBar-iframe']", ""]






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

Output Table (Cell, in Row under Create Table, under Intermediate Results): "//div[contains(@class,'execution-result')][.//h1[contains(text(),'Model name: Create Table')]]//td[text()='Output table']/following-sibling::td[text()='Output table']"
Table (Cell, in Row under Create Table, under Intermediate Results): "//div[contains(@class,'execution-result')][.//h1[contains(text(),'Model name: Create Table')]]td[text()='Table']"
"file/opt/sensage/tomcat/temp (Cell, in Row under Create Table, under Intermediate Results)": "//div[contains(@class,'execution-result')][.//h1[contains(text(),'Model name: Create Table')]]//td[contains(.,'file:/opt/sensage/tomcat/temp/')]"


Name Column (under Outputs for model Create Table, under Intermediate results): "//div[contains(@class,'execution-result')][./div/div/div/h1[contains(text(),'Model name: Create Table')]]//div[contains(@class,'output-container')]//tbody/tr[1]/td[1]"
Type Column (under Outputs for model Create Table, under Intermediate results): "//div[contains(@class,'execution-result')][./div/div/div/h1[contains(text(),'Model name: Create Table')]]//div[contains(@class,'output-container')]//tbody/tr[1]/td[2]"
Value Column (under Outputs for model Create Table, under Intermediate results): "//div[contains(@class,'execution-result')][./div/div/div/h1[contains(text(),'Model name: Create Table')]]//div[contains(@class,'output-container')]//tbody/tr[1]/td[3]/div/div"


//div[contains(@class,'execution-result')][.//h1[contains(text(),'Model name: Create Table')]]
//td[text()='Output table']
/following-sibling::td[text()='Table']
/following-sibling::td[contains(.,'file:/opt/sensage/tomcat/temp/')]




////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                             BOINT                                  //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure
//http://spadmin:Password%231@automation1
Directories - Services (in Footer): //div[contains(@class,'bz-footer-container')]//li/a[text()='Services']
["//iframe[@class='ms-dlgFrame']", ""]



Location Title Textbox: //input[@id='ctl00_PlaceHolderMain_EditModePanel_TextField1_ctl00_TextField']
Service Title Textbox: //input[@id='ctl00_PlaceHolderMain_EditModePanel_ctl01_ctl00_TextField']
Posted By Textbox: //div[@id='ctl00_PlaceHolderMain_EditModePanel_ctl02_ctl00_UserField_upLevelDiv']
Person Icon (for Posted By): //tr[contains(.,'Posted By')]//img[@alt='Check Names']
Show Roll Up Image on Page Checkbox: //input[@id='ctl00_PlaceHolderMain_EditModePanel_BooleanField2_ctl00_BooleanField']
Page Tab (in Sharepoint Ribbon): //span[@class='ms-cui-tt-span'][text()='Page']
Publish Tab (in Sharepoint Ribbon): //span[@class='ms-cui-tt-span'][text()='Publish']
Page Layout (in Sharepoint Ribbon): //a[contains(@id,'ChangePageLayout')]
Publish (in Sharepoint Ribbon): //a[contains(@id,'Publish-SelectedItem')]   
Service Page (under Page Layout Popup): //div[@title='Service Page']
Continue Button (in Publish Dialog): //input[@id='statechangedialog_okbutton']
Error - This page contains content or formatting that is not valid. You can find more information in the affected sections: //span[@class='ms-status-status'][contains(.,'Error')][contains(.,'This page contains content or formatting that is not valid. You can find more information in the affected sections')]
You must specify a value for this required field (under Posted By): //tr[contains(.,'Posted By')]//span[text()='You must specify a value for this required field.']
You must specify a value for this required field (under Service Title): //tr[contains(.,'Service Title')]//span[text()='You must specify a value for this required field.']


Find it at, containing VarRandomPage: ["//iframe[@class='ms-dlgFrame']", "//input[@id='//input[@id='ctl00_PlaceHolderMain_createButton']']"]

BONZAI\Administrator (in Posted By Textbox): //span[@id='content'][contains(text(),'administrator')]
Please select a Roll Up Image (under Show Roll Up Image on Page): //span[@role='alert'][text()='Please select a Roll Up Image']


Click here to insert a picture from SharePoint: //a[contains(@id,'AddAssetPromptLink')]
Browse (for Selected Image): ["//iframe[@class='ms-dlgFrame']", "//input[@id='ctl00_PlaceHolderDialogBodySection_PlaceHolderDialogBodyMainSection_ctl01_assetSelectedImage_PickerLaunchButton']"]
FAQ Image: ["//iframe[@class='ms-dlgFrame']", "//div[text()='FAQ']"]
OK Button (in Edit Image Properties Dialog): ["//iframe[@class='ms-dlgFrame']", "//input[@id='ctl00_OkButton']"]
FAQ Image Preview (in Roll Up Image): //img[contains(@src,'FAQ')]
Username (on top right of the page): //span[contains(@class,'username')]










////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              SUPSOFT                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Supsoft LeftFrame
["//frame[@name='mainAdmin']", "//frame[@name='sadLeftFrame']", ""]
Supsoft RightFrame
["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", ""]


Severity Levels in SA Menu: ["//frame[@name='mainAdmin']", "//frame[@name='sadLeftFrame']", "//a[contains(@href,'rrn_severity')]"]
Service Level Agreements in SA Menu: ["//frame[@name='mainAdmin']", "//frame[@name='sadLeftFrame']", "//a[contains(@href,'slalevels')]"]

New Button (in Severity Levels): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//button[text()='New']"]
Cancel Button (in Severity Levels): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//button[text()='Cancel']"]
Edit Button (for First Record) (in Severity Levels): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//table//tr[3]//a[contains(@href,'edit')]"]
Delete Button (for First Record) (in Severity Levels): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//table//tr[3]//a[contains(@href,'delete')]"]
Value Cell (for First Record) (in Severity Levels): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//table//tr[3]//td[4]"]
Value Cell (for Second Record) (in Severity Levels): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//table//tr[4]//td[4]"]

Save Button (in Severity Levels): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//input[@value='Save']"]
Severity Textbox (in Severity Levels): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//input[@name='keyname']"]
Value Textbox (in Severity Levels): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//input[@name='keyvalue']"]
Emergency (in Severity Column): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[text()='Emergency']"]



Average Time to First Response(Minutes) Table: ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[@class='clsTableHeader'][contains(.,'Average Time to First Response(Minutes)')]"]
Average Time to Close(Minutes) Table: ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[@class='clsTableHeader'][contains(.,'Average Time to Close(Minutes)')]"]
Emergency (in Average Time to First Response Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//tbody[contains(.,'Average Time to First Response(Minutes)')]//td[normalize-space(text())='Emergency']"]
Emergency (in Average Time to Close Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//tbody[contains(.,'Average Time to Close(Minutes)')]//td[normalize-space(text())='Emergency']"]
Edit Icon for Emergency (in Average Time to First Response Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "(//tbody[contains(.,"Average Time to First Response(Minutes)")]//tr[./td[normalize-space(text())='Emergency']]//a[contains(@href,'edit')]"]
Edit Icon for Emergency (in Average Time to Close Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//tbody[contains(.,"Average Time to Close(Minutes)")]//tr[./td[normalize-space(text())='Emergency']]//a[contains(@href,'edit')]"]