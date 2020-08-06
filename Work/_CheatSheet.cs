// Get link from email
https://jira.devfactory.com/browse/KAYAKO-6920
RegexToGetActivationLink: '[\s\S][(https:.)][\s\S]][\s\S]'

//JSON Path
AGSC-96

// Chained Precondition
EXOS-13753

//Examples Table
KAYAKOC-18044
https://jira.devfactory.com/browse/QAP-11509

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
Then I remember a value from ["title" atribute of] "selector" as "variableName"

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
Then I remember a value from ["<attribute>" attribute of] "<selector>" [in "<ui driver instance id>"] as "<variable>"

// Execute Scenario
When I execute scenario "NORTHP-16902" with inputs "urlsearch" as "TSWeb - Advanced Search - Save search name input"
When I execute scenario "SUPSOFT-3940" to capture outputs "BusinessUnitRandomValue"
Then scenario steps should complete successfully

// Upload File
When I upload a file "https://e2efiles.s3.amazonaws.com/htlgaij.txt" to "Browse Button (in Attachments Popup)"

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



////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              SENSAGE                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/SEN/Sensage+EnvDS








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




Remote Assist in SA Menu (under Application Management): ["//frame[@name='mainAdmin']", "//frame[@name='sadLeftFrame']", "//div[@fullpath='Application Management/RemoteAssist']"]
Preferences in SA Menu (under Remote Assist): ["//frame[@name='mainAdmin']", "//frame[@name='sadLeftFrame']", "//a[@href='/sdcadmin/rassist/ra_preference.asp']"]
RemoteAssist Preferences (Page Header): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//font[@class='pageheader'][text()='RemoteAssist Preferences']"]


User Tab (in RemoteAssist Preferences Page): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[contains(@class,'tabStrip')][./a[text()='User']]"]
Analyst Tab (in RemoteAssist Preferences Page): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[contains(@class,'tabStrip')][./a[text()='Analyst']]"]
Key Name Table Header (in User - Preferences List): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//div[contains(.,'User - Preferences List')]//td[contains(@class,'clsTableSubHeader')][text()='Key Name']"]
Key Type Table Header (in User - Preferences List): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//div[contains(.,'User - Preferences List')]//td[contains(@class,'clsTableSubHeader')][text()='Key Type']"]
Key Value Table Header (in User - Preferences List): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//div[contains(.,'User - Preferences List')]//td[contains(@class,'clsTableSubHeader')][text()='Key Value']"]

Key Name in First Row (in User - Preferences List): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//div[contains(.,'User - Preferences List')]//table[@id='tblMain_1']//tr[2]//div[@id='div_name_txt_101']/following-sibling::input"]
Edit Button for FirstKeyName: ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//div[@id='tblMainDiv']//tr[contains(.,$FirstKeyName)]//img[@alt='Edit']"]
Save Button for FirstKeyName: ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//div[@id='tblMainDiv']//tr[contains(.,$FirstKeyName)]//img[@alt='Save']"]
Key Value Textbox for FirstKeyName: ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//div[@id='tblMainDiv']//tr[contains(.,$FirstKeyName)]//input[@id='newKeyValue101']"]
Key Value Cell for FirstKeyName: ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//div[@id='tblMainDiv']//tr[contains(.,$FirstKeyName)]//div[@id='div_val_txt_101']"]


