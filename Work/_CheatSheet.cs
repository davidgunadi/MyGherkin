//Examples Table
KAYAKOC-18044

//Upload
CRM-71603

// Dummy Ticket
https://jira.devfactory.com/browse/TS-5834

//Add value
And I remember a value from "value" attribute of "Cache Key Textbox" as "CacheKeyOriginalValue"
Given "CacheKeyIncrementedValue" default value is "{to_int(CacheKeyOriginalValue)+1}"
When I set "Cache Key Textbox" value to "{CacheKeyIncrementedValue}"

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

Export Logs (in Logs Page): //span[text()='Export Logs']
operation executed: //pre[contains(text(),'operation executed')]

Downstream Bandwidth (under Statistics): //a[@id='bandwidth_left_menu']
Cache Productivity (Navigation Tab): //a[contains(@href,'cache_prod')]


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



RequestTypeName (in Types Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[text()=$RequestTypeName]"]
Delete Icon for RequestTypeName (in Types Table): //tr[contains(.,$RequestTypeName)]//img[@alt='Delete']




////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                             BOINT                                  //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure
//http://spadmin:Password%231@automation1
["//iframe[@class='ms-dlgFrame']", ""]

Language Dropdown (in Edit Bonzai Configuration): //div[@class='dropdown'][.//option[text()='English']]
FR Icon (next to the textboxes): //span[@class='localized'][text()='FR']
Navigation Term Set Guid Textbox: //input[@name='_owlNavTermSetGuid']
Cache Key Textbox: //input[@name='_owlCacheKey']

Save Button (in Edit Bonzai Configuration): //button[text()='Save']
Your configuration has been saved: ://p[text()='Your configuration has been saved']



////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                             JVANLT                                 //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
https://confluence.devfactory.com/display/EN/Jive+Analytics+-+E2E+Environment+Data

Bar Chart for Current Month (for Content Creation): //div[@id='j-content-creation-chart']/div/div/*[local-name()='svg']//*[local-name()='g'][@class='recharts-layer recharts-bar'][.//*[local-name()='path'][contains(@id,'bar-content-blog-posts-created-rect')]]/*[local-name()='g']/*[local-name()='g'][last()]
Document Value (in Graph Tooltip): //div[@class='recharts-default-tooltip']//tr[./td[text()='Documents']]/td[@class='recharts-tooltip-cell-value']
Ideas Value (in Graph Tooltip): //div[@class='recharts-default-tooltip']//tr[./td[text()='Ideas']]/td[@class='recharts-tooltip-cell-value']
Videos Value (in Graph Tooltip): //div[@class='recharts-default-tooltip']//tr[./td[text()='Videos']]/td[@class='recharts-tooltip-cell-value']
Polls Value (in Graph Tooltip): //div[@class='recharts-default-tooltip']//tr[./td[text()='Polls']]/td[@class='recharts-tooltip-cell-value']
Events Value (in Graph Tooltip): //div[@class='recharts-default-tooltip']//tr[./td[text()='Events']]/td[@class='recharts-tooltip-cell-value']
Blog Posts Value (in Graph Tooltip): //div[@class='recharts-default-tooltip']//tr[./td[text()='Blog Posts']]/td[@class='recharts-tooltip-cell-value']