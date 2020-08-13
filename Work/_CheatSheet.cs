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
When I set "value" to "selector" value

//Type into textbox
When I set "<selector>" value to "XXX"

//Click
And I click on "Login Button"

//isDisplayed
Then "Username Avatar" should be displayed

//Page is Displayed (Work for Partial Page Name)
Then "Username Avatar" page should be displayed

//multiple iFrames
"Any row item": ["//iframe[@id='fr1']", "//iframe[@id='fr2']", "//iframe[@id='fr3']", "//tr[contains(@class, 'GridRow_Aptean')]"],

//set Date Time to variable
Given "currentTime" default value is the current datetime "+0 milliseconds"

//save a value to variable
Then I remember a value from ["title" atribute of] "selector" as "variableName"

//verify a selector contains a text
Then I should see "text" in "selector"

//Create Random Text
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"
Given "GeneratedUsername" default value is "User_{random_string(6)}"

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


["//iframe[@id='catalogframe']", ""]
["//iframe[@id='appdialogframe']", ""]

My Collection Dropdown Panel: ["//frame[@id='catalogframe']", "//div[@id='collections_content']"]
["//frame[@id='catalogframe']", "//img[@id='NewCatalogButton']"]
Top Level Option (in Save In Listbox): ["//frame[@id='appdialogframe']", "//option[text()='[Top Level]']"]
Info Button for 'VarCollectionName': ["//iframe[@id='catalogframe']", "//li[contains(.,$VarCollectionName)]//img[contains(@class,'alterCatalog')]"]
- Icon (Delete Collection Button): ["//iframe[@id='catalogframe']", "//img[@alt='Delete Selected']"]
Delete Collection Confirmation Message: //div[contains(@class,'message')][contains(text(),'delete the selected collection')]



Selection Icon for Member of: //tr[@id='memberOfRow']//img[contains(@src,'list.gif')]
Default Option (in Member Of Listbox): ["//tr[@id='memberOfRow']//iframe", "//option[text()='Default']"]
User with the name GeneratedUserName in the User Table: //table[@id='adminuserTable']//td/a[text()=$GeneratedUserName]


["//iframe[@id='refineSearchFrame']",""]
Show More (under Asset Category): ["//iframe[@id='refineSearchFrame']","//li[@tsfld='editorial.asset_category']//a[@class='a-show-more']"]
Image checkbox (under Asset Category): ["//iframe[@id='refineSearchFrame']","//input[@type='checkbox'][contains(@id,'Image-Asset+Category')]"]
Audio checkbox (under Asset Category): ["//iframe[@id='refineSearchFrame']","//input[@type='checkbox'][contains(@id,'Audio-Asset+Category')]"]
Document checkbox (under Asset Category): ["//iframe[@id='refineSearchFrame']","//input[@type='checkbox'][contains(@id,'Document-Asset+Category')]"]
Playlist checkbox (under Asset Category): ["//iframe[@id='refineSearchFrame']","//input[@type='checkbox'][contains(@id,'Playlist-Asset+Category')]"]
Video checkbox (under Asset Category): ["//iframe[@id='refineSearchFrame']","//input[@type='checkbox'][contains(@id,'Video-Asset+Category')]"]


["//iframe[@id='contentframe']",""]
"Asset Category: Image": ["//iframe[@id='contentframe']","(//span[text()='Asset Category : Image'])"]
"Asset Category: Audio": ["//iframe[@id='contentframe']","(//span[text()='Asset Category : Audio'])"]
"Asset Category: Document": ["//iframe[@id='contentframe']","(//span[text()='Asset Category : Document'])"]
"Asset Category: Playlist": ["//iframe[@id='contentframe']","(//span[text()='Asset Category : Playlist'])"]
"Asset Category: Video": ["//iframe[@id='contentframe']","(//span[text()='Asset Category : Video'])"]



"Pin Icon for Asset Category: Image": ["//iframe[@id='contentframe']","//span[@class='removeBreadcrumb'][contains(.,'Image')]/span[@class='makeStickyBreadcrumbBtn']"]
"Pin Icon for Asset Category: Audio": ["//iframe[@id='contentframe']","//span[@class='removeBreadcrumb'][contains(.,'Audio')]/span[@class='makeStickyBreadcrumbBtn']"]
"Pin Icon for Asset Category: Document": ["//iframe[@id='contentframe']","//span[@class='removeBreadcrumb'][contains(.,'Document')]/span[@class='makeStickyBreadcrumbBtn']"]
"Pin Icon for Asset Category: Playlist": ["//iframe[@id='contentframe']","//span[@class='removeBreadcrumb'][contains(.,'Playlist')]/span[@class='makeStickyBreadcrumbBtn']"]
"Pin Icon for Asset Category: Video": ["//iframe[@id='contentframe']","//span[@class='removeBreadcrumb'][contains(.,'Video')]/span[@class='makeStickyBreadcrumbBtn']"]

"Asset Category: Image (as Sticky Filter)": ["//iframe[@id='contentframe']","//span[@class='removeBreadcrumbSticky'][contains(.,'Image')]"]
"Asset Category: Audio (as Sticky Filter)": ["//iframe[@id='contentframe']","//span[@class='removeBreadcrumbSticky'][contains(.,'Audio')]"]
"Asset Category: Document (as Sticky Filter)": ["//iframe[@id='contentframe']","//span[@class='removeBreadcrumbSticky'][contains(.,'Document')]"]
"Asset Category: Playlist (as Sticky Filter)": ["//iframe[@id='contentframe']","//span[@class='removeBreadcrumbSticky'][contains(.,'Playlist')]"]
"Asset Category: Video (as Sticky Filter)": ["//iframe[@id='contentframe']","//span[@class='removeBreadcrumbSticky'][contains(.,'Video')]"]