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
User Icon on Top Right of Page (in NewUI): //div[@class='df-user-profile__img-container']
Archive Page (in NewUI): //div[@class='section__header px-4 py-2'][text()='Archive']




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
["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//img[contains(@src,'welcome_support_admin')]"]
["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//input[@value='New']"]

["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//a[@class='clsTreeLeafSelected'][contains(@title,'Define custom Request Types')]"]

Logout Button on Top Right: ["//frame[@name='topFrame']", "//a[@title='Logout']"]

Analyst Monitor (Heading): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//div[@class='pageheader'][text()='Analyst Monitor']"]
Status Filter Listbox (in Analyst Monitor): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//select[@id='statusSearch']"]
Available Option (in Status Filter Listbox): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//select[@id='statusSearch']/option[text()='Available']"]
Unavailable Option (in Status Filter Listbox): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//select[@id='statusSearch']/option[text()='Unavailable']"]

Full Name (Table Header, in Analyst Monitor): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[@class='clsTableSubHeader'][contains(.,'Full Name')]"]
Login Name (Table Header, in Analyst Monitor): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[@class='clsTableSubHeader'][contains(.,'Login Name')]"]
Chat Window (Table Header, in Analyst Monitor): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[@class='clsTableSubHeader'][contains(.,'Chat Window')]"]
Status (Table Header, in Analyst Monitor): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//td[@class='clsTableSubHeader'][contains(.,'Status')]"]
Refresh Button (in Analyst Monitor): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//button[text()='Refresh']"]
Analyst (Cell, in Agent Window Status Table): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//div[@id='divAgentWindowStatus']//td/a[text()='analyst']"]