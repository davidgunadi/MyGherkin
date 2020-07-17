//Examples Table
KAYAKOC-18044

//Upload
CRM-71603

// Dummy Ticket
https://jira.devfactory.com/browse/TS-5834

//Check checkbox
When I "check" "<selector>" checkbox
When I "uncheck" "<selector>" checkbox

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

// Execute Scenario
When I execute scenario "NORTHP-16902" with inputs "urlsearch" as "TSWeb - Advanced Search - Save search name input"

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
//                                  PAUB                              //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure
Logical View (under Status): //li/a[text()='Logical View']
Avg CPU Link (in Logical View): //a[@href='/ui/status/cpu/raw/all']
Memory Link (in Logical View): //a[@href='/ui/status/memory/raw/all']
In Traffic Link (in Logical View): //a[@href='/ui/statistics/bandwidth/in_downstream/all']
Cache Out Link (in Logical View): //a[@href='/ui/statistics/bandwidth/cout_downstream/all']


//font[text()='Firefox Controls Package successfully selected.']
//font[text()='Firefox Controls Package successfully selected.']


////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                             BOINT                                  //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure
//http://spadmin:Password%231@automation1
["//iframe[@class='ms-dlgFrame']", ""]

Home Page 1 (4 Column) - under Page Layout Popup: //div[@title='Home Page 1 (4 Column)']
Header Zone: //span[text()='Header Zone']

Add a Web Part (under Header Zone): //div[@class='bz-row'][.//span[text()='Header Zone']]//span[text()='Add a Web Part']
Web Part Adder (on top of the page): //div[@id='WebPartAdderUpdatePanelContainer']
People Listing Web Part: //div[@title='People Listing Web Part']
People Listing Web Part (under Header Zone): //div[@class='bz-row'][.//span[text()='Header Zone']]//span[text()='People Listing Web Part']

Down Arrow next to People Listing Web Part: //a[@id='WebPartWPQ1_MenuLink']
Edit Web Part (dropdown option): //div[@id='MSOMenu_Edit']

Site URL Textbox (in People Listing Web Part): //input[@id='bz-webpart-property-siteUrl']
List Dropdown(in People Listing Web Part): //select[@id='bz-webpart-property-listName']
View Dropdown (in People Listing Web Part): //select[@id='bz-webpart-property-viewName']
Person Column Dropdown (in People Listing Web Part): //select[@id='bz-webpart-property-personColumn']

Show Profile Picture Checkbox (in People Listing Web Part): //input[@id='bz-webpart-property-showProfilePicture']
Show Email Address Checkbox (in People Listing Web Part): //input[@id='bz-webpart-property-showEmailAddress']
Show Location Checkbox (in People Listing Web Part): //input[@id='bz-webpart-property-showLocation']
Show Job Title Checkbox (in People Listing Web Part): //input[@id='bz-webpart-property-showJobTitle']
Show Phone Number Checkbox (in People Listing Web Part): //input[@id='bz-webpart-property-showPhoneNumber']
Show Promoted Items Checkbox (in People Listing Web Part): //input[@id='bz-webpart-property-showPromotedItems']

Display Users As Dropdown (in People Listing Web Part): //select[@id='bz-webpart-property-displayType']

Show Table Headers Checkbox (in People Listing Web Part): //input[@id='bz-webpart-property-showTableHeaders']
Use Paging Checkbox (in People Listing Web Part): //input[@id='bz-webpart-property-showPaging']
Items per Page Textbox (in People Listing Web Part): //input[@id='bz-webpart-property-itemsPerPage']
OK Button (in People Listing Web Part): //input[@id='ctl00_MSOTlPn_EditorZone_MSOTlPn_OKBtn']

Profile Image (in People Listing Web Part Table): //span[@class='bz-profile-image']
Contact (Grid Header in People Listing Web Part Table): //th[text()='Contact']
Job Title (Grid Header in People Listing Web Part Table): //th[text()='Job Title']
Email (Grid Header in People Listing Web Part Table): //th[text()='Email']
Location (Grid Header in People Listing Web Part Table): //th[text()='Location']
Phone Number (Grid Header in People Listing Web Part Table): //th[text()='Phone Number']


Add a Web Part (under Row 1 Left Zone): //div[@class='flex-2'][.//span[text()='Row 1 Left Zone']]//span[text()='Add a Web Part']
People Listing Web Part (under Row 1 Left Zone): //div[@class='flex-2'][.//span[text()='Row 1 Left Zone']]//span[text()='People Listing Web Part']
Profile Image (under Row 1 Left Zone): //div[@class='flex-2'][.//span[text()='Row 1 Left Zone']]//span[@class='bz-profile-image']
//div[@class='bz-peoplelisting-grid']

Landing Page 1 (4 Column w/ Header): //div[@title='Landing Page 1 (4 Column w/ Header)']
Full Zone Header: //div[contains(@class,'bz-container')][1]//div[@class='bz-row'][.//span[text()='Full Zone']]
People Listing Web Part (under Full Zone Header): //div[contains(@class,'bz-container')][1]//div[@class='bz-row'][.//span[text()='Full Zone']]//span[text()='People Listing Web Part']
Add a Web Part (under Full Zone Header): //div[contains(@class,'bz-container')][1]//div[@class='bz-row'][.//span[text()='Full Zone']]//span[text()='Add a Web Part']
People Listing Web Part (under Full Zone Header): //div[contains(@class,'bz-container')][1]//div[@class='bz-row'][.//span[text()='Full Zone']]//span[text()='People Listing Web Part']


////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              SUPSOFT                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Supsoft LeftFrame
["//frame[@name='mainAdmin']", "//frame[@name='sadLeftFrame']", ""]
Supsoft RightFrame
["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", ""]
NavFrame
["//frame[@name='navFrame']", ""]
sdcxuser_main Frame
["//frame[@name='sdcxuser_main']", ""]


Live Assist (under Reporting): ["//frame[@name='mainAdmin']", "//frame[@name='sadLeftFrame']", "//div[@fullpath='Reporting/LiveAssist ']"]
Archived Reports (under Live Assist): ["//frame[@name='mainAdmin']", "//frame[@name='sadLeftFrame']", "//div[@fullpath='Reporting/LiveAssist / Archived Reports']']"]
Chat Transcript (under Archived Reports): ["//frame[@name='mainAdmin']", "//frame[@name='sadLeftFrame']", "//a[text()=' Chat Transcript']"]


Chat Transcript (Header): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//font[@class='pageheader'][text()='Chat Transcript']"]

Run Report Now (in Chat Transcript): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//button[text()='Run Report Now']"]
Report Filter Form (in Chat Transcript): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//form[@name='repfrm']"]
Calendar Icon for Report Start Date (in Chat Transcript): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//img[@class='clsCalendarButton'][contains(@onclick,'StartDate')]"]
Calendar Icon for Report End Date (in Chat Transcript): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//img[@class='clsCalendarButton'][contains(@onclick,'EndDate')]"]
<m (in Calendar Picker): //a[text()='<m']
1 (in Calendar Picker): //a[text()='1']
TomorrowDate (in Calendar Picker): //a[text()=$TomorrowDate]


Room Textbox (in Chat Transcript): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//input[@name='V_Room']"]
Run Button (in Chat Transcript): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//input[@value='Run']"]
Results Table (in Chat Transcript): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//table[.//td[contains(text(),'Results')]]"]