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
//                                  PAUB                              //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure





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





////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                             BOINT                                  //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure
//http://spadmin:Password%231@automation1
["//iframe[@class='ms-dlgFrame']", ""]





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


Video Textbox (in Video Page): //input[@id='embedFormControl']
Import Video Button (in Video Page): //span[text()='Import Video']
Video Title (in Video Page): //input[@name='subject']
Video Body (in HTML Formatting): //label[@class='j-rte-label']
Youtube Video Preview: ["//iframe[@class='embedly-embed']", "//div[@class='iframe youtube']"]



////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              SENSAGE                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/SEN/Sensage+EnvDS

DONE status for TEST-69343-REPORT: //tr[contains(.,'TEST-69343-REPORT')]//df-label[text()='DONE']
ts Cell in First Row of Report Execution Result Table: //tr[contains(@class,'df-grid__row--data')][1]/td[2]
TEST-69343-REPORT (Page Header): //h1[contains(.,'TEST-69343-REPORT')]
Filter Icon (in ts Cell, in First Row of Report Execution Result Table): //tr[contains(@class,'df-grid__row--data')][1]/td[2]//df-icon[@name='filter']
Minute Item (in Filter Dropdown): //span[contains(@class,'quick-filters__item')][normalize-space(text())='Minute']
Hour Item (in Filter Dropdown): //span[contains(@class,'quick-filters__item')][normalize-space(text())='Hour']
Day Item (in Filter Dropdown): //span[contains(@class,'quick-filters__item')][normalize-space(text())='Day']
week Item (in Filter Dropdown): //span[contains(@class,'quick-filters__item')][normalize-space(text())='week']
month Item (in Filter Dropdown): //span[contains(@class,'quick-filters__item')][normalize-space(text())='month']

ts textbox (in Execution Results Table): //tr[contains(@class,'df-grid__row--header id3')]/th[2]//input
X button inside ts textbox (in Execution Results Table): //tr[contains(@class,'df-grid__row--header id3')]/th[2]//i[contains(@class,'close-icon')]