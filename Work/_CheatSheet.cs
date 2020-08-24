// Prevent markup
AGSC-722

// No error in browser logs
https://jira.devfactory.com/browse/AGSC-771

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
BannerFrame
["//frame[@name='banner']", ""]
sdcxuser_main Frame
["//frame[@name='sdcxuser_main']", ""]
ulFrame
["//frame[@name='ul']", ""]


["//iframe[@id='catalogframe']", ""]
["//iframe[@id='appdialogframe']", ""]

View List Button: //a[contains(text(),'View List')]

Checkbox for Accessibility Issues - Links (in Archive Page): //form[@id='deleted_site_map']//tr[contains(.,'Accessibility Issues - Links')]//input[@type='checkbox']
Undelete Button: //a[text()='Undelete']
Select Destination Dialog: //div[contains(@class,'sl-column-container')][contains(.,'Select Destination')]
Pages Tab: //a[text()='Pages']
Accessibility Issues - Links (in Site Center Page): //div[contains(@id,'site_map_item')]//div[contains(text(),'Accessibility Issues - Links')]

Cell with the value GeneratedConversionName in the Conversions Table: //table[@id='nmconv-tbl']//a[text()=$GeneratedConversionName]


Loading Icon under Publish Location Section: //div[contains(@class,'j-running-loader')]




["//frame[@name='navFrame']", "//a[@id='xla_LiveAssist']"]

["//frame[@name='sdcxuser_main']", "//td[./div/label[text()='Chat Name']]/..//input"]
["//frame[@name='sdcxuser_main']", "//td[./div/label[text()='Email']]/..//input"]
["//frame[@name='sdcxuser_main']", "//td[./div/label[text()='Problem Type']]/..//select"]
["//frame[@name='sdcxuser_main']", "//td[./div/label[text()='Problem Description']]/..//input"]
["//frame[@name='sdcxuser_main']", "//input[@name='lachat']"]

["//frame[@name='sdcxuser_main']", "//textarea[@id='message']"]
["//frame[@name='sdcxuser_main']", "//button[@id='SendMessage']"]
["//frame[@name='sdcxuser_main']", "//button[@id='bttn2']"]
["//frame[@name='sdcxuser_main']", "//span[contains(text(),'You are waiting for an analyst to assist you')]"]
["//frame[@name='sdcxuser_main']", "//div[text()='You have joined the room']"]


User Waiting (in CSR Chat Window): ["//frame[@name='banner']", "//b[text()='User Waiting=']"]
Preferred User Waiting (in CSR Chat Window): ["//frame[@name='banner']", "//b[text()='Preferred User Waiting=']"]
AHT (in CSR Chat Window): ["//frame[@name='banner']", "//b[text()='AHT=']"]
Closed (in CSR Chat Window): ["//frame[@name='banner']", "//b[text()='Closed=']"]
Escalated (in CSR Chat Window): ["//frame[@name='banner']", "//b[text()='Escalated=']"]
Bounced (in CSR Chat Window): ["//frame[@name='banner']", "//b[text()='Bounced=']"]
Available Icon (in First Chat Window, in CSR Chat Window): ["//frame[@name='ul']", "//img[@title='Available']"]





Queue Status Change Available (Message in CSR Chat Window): ["//frame[@name='ul']", "(//div[text()='Queue status change: available'])"]
Queue poll started (Message in CSR Chat Window): ["//frame[@name='ul']", "//div[contains(text(),'Queue poll started')]"]
Hello Test Chat, Thank you for contacting LiveAssist Support, My name is analyst, How may I help you (Message in CSR Chat Window): ["//frame[@name='ul']", "//div[contains(text(),'Hello Test Chat, Thank you for contacting LiveAssist Support. My name is analyst. How may I help you?')]"]
Analyst in Chat Room Box: ["//frame[@name='ul']", "//select[@name='userList']/option[text()='analyst']"]
This Issue will be escalated after 40 seconds (Message in CSR Chat Window): ["//frame[@name='ul']", "//div[text()='This issue will be escalated after 40 seconds.']"]
This Issue will be escalated after 30 seconds (Message in CSR Chat Window): ["//frame[@name='ul']", "//div[text()='This issue will be escalated after 30 seconds.']"]
Message Textbox (in CSR Chat Window): ["//frame[@name='ul']", "//iframe[@id='ifMsg']", "//body[@id='body']"]




analyst is assisting you on this issue (Message in LiveAssist Chat): ["//frame[@name='sdcxuser_main']", "//span[@id='statMsg'][contains(.,'analyst')][contains(.,'is assisting you on this issue')]"]
analyst has joined the room (Message in LiveAssist Chat): ["//frame[@name='sdcxuser_main']", "//div[./b[text()='analyst']][contains(.,'has joined the room')]"]
Chat One From Analyst to User (Message in LiveAssist Chat): ["//frame[@name='sdcxuser_main']", "//div[text()='Chat One - From Analyst to User']"]
Chat Two From User to Analyst (Message in CSR Chat Window): ["//frame[@name='ul']", "//div[contains(text(),'Chat Two - From User to Analyst')]"]


Chat History Above The Message Textbox (in CSR Chat Window): ["//frame[@name='ul']", "//div[@id='ChatDisplay']"]



Script Textarea (in Request Class Properties Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//textarea[@name='propScript1']"]


Checkbox yes Cell in Description Column (in Request Class Properties Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[contains(@class,'clsTableRow1')][contains(.,'Checkbox yes')]"]
Checkbox Yes Cell in Description Column (in Request Class Properties Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[contains(@class,'clsTableRow1')][contains(.,'Checkbox yes')]"]
Checkbox YES Cell in Description Column (in Request Class Properties Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[contains(@class,'clsTableRow1')][contains(.,'Checkbox yes')]"]

Checkbox Required Cell in Description Column (in Request Class Properties Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[contains(@class,'clsTableRow1')][contains(.,'Checkbox Required')]"]
Checkbox ReadOnly Cell in Description Column (in Request Class Properties Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[contains(@class,'clsTableRow1')][contains(.,'Checkbox ReadOnly')]"]
Checkbox Hidden Cell in Description Column (in Request Class Properties Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[contains(@class,'clsTableRow1')][contains(.,'Checkbox Hidden')]"]


["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", ""]









Checkbox yes (in Request Page): ["//frame[@name='sdcxuser_main']", "(//div[contains(@class,'classLabel')]/following-sibling::div[contains(@class,'classContent')]//tr[contains(.,'Checkbox yes')]//input[@type='checkbox'])"]
Checkbox YES (in Request Page): ["//frame[@name='sdcxuser_main']", "(//div[contains(@class,'classLabel')]/following-sibling::div[contains(@class,'classContent')]//tr[contains(.,'Checkbox YES')]//input[@type='checkbox'])"]
Checkbox Yes (in Request Page): ["//frame[@name='sdcxuser_main']", "(//div[contains(@class,'classLabel')]/following-sibling::div[contains(@class,'classContent')]//tr[contains(.,'Checkbox Yes')]//input[@type='checkbox'])"]
Checkbox Required with a Star Sign next to it (in Request Page): ["//frame[@name='sdcxuser_main']", "(//div[contains(@class,'classLabel')]/following-sibling::div[contains(@class,'classContent')][.//font[@class='required']]//tr[contains(.,'Checkbox Required')]//input[@type='checkbox'])"]
Checkbox ReadOnly in readonly mode (in Request Page): ["//frame[@name='sdcxuser_main']", "(//div[contains(@class,'classLabel')]/following-sibling::div[contains(@class,'classContent')]//tr[contains(.,'Checkbox ReadOnly')]//input[@type='checkbox'][@onclick='return false;'])"]
Checkbox Hidden (in Request Page): ["//frame[@name='sdcxuser_main']", "(//div[contains(@class,'classLabel')]/following-sibling::div[contains(@class,'classContent')]//tr[contains(.,'Checkbox Hidden')]//input[@type='checkbox'])"]

To Textbox (in New Loopmail - Mobile): "//android.view.View[@text='To']/following-sibling::android.view.View[1]//android.widget.EditText"
CC Textbox (in New Loopmail - Mobile): "//android.view.View[@text='CC']/following-sibling::android.view.View[1]//android.widget.EditText"
Subject Textbox (in New Loopmail - Mobile): //android.widget.TextView[@text='Subject']
Message Textbox (in New Loopmail - Mobile): "/descendant::android.widget.EditText[last()]"
VANESSA Alonzo (in Dropdown List): //android.view.View[@text='VANESSA Alonzo']
principal principal (in Dropdown List): //android.view.View[@text='principal principal']
Send Button (in New Loopmail - Mobile): //android.view.View[@text='New Loopmail']/following-sibling::android.view.View[1]/android.view.View[1]
Inbox Dropdown (in Loopmail - Mobile): //android.widget.TextView[@text='Inbox']
Sent Option in Dropdown (in Loopmail - Mobile): //android.view.View[@text='Sent']
Email with the subject as VarEmailSubject (in Loopmail - Mobile): //android.view.View[@text=$VarEmailSubject]

principal principal as Recipient Name (in New Loopmail - Mobile): //android.widget.TextView[@text='principal principal']
Staff Staff as Recipient Name (in New Loopmail - Mobile): //android.widget.TextView[@text='Staff Staff']


//android.widget.Button[@text='Loopmail']

Assignment Page Title (Mobile): //*[@resource-id='tab-title'][@text='Assignments']



More Link (for ALGEBRA 1B SPR): //tr[.//a[contains(text(),'ALGEBRA 1B SPR')]]//span[contains(@id,'moreLinkButton')]
Roster Tool Link (for ALGEBRA 1B SPR): "//tr[.//a[contains(text(),'ALGEBRA 1B SPR')]]/following-sibling::tr[1]//a[text()='Roster Tools']"
Roster Printout: //a[text()='Roster Printout']



Search Textbox (in User Profiles Page): //input[@id='query']


Username with the value EmailVariable: //a[contains(text(),$EmailVariable)]
The value for Activated Row: //tr[contains(@class,'hide-from-new')][contains(.,'Activated')]/td/span


DispositionName Option under Disposition Dropdown: ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//select[@id='Select1']/option[text()=$DispositionName]"]

Disposition with the name DispositionName: ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[contains(@class,'clsTableRow')][text()=$DispositionName]"]