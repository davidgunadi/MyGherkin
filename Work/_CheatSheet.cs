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

//Create Random Text
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"



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

Build Packages (Header): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//font[@class='pageheader'][text()='Build Packages']"]
MSI Package Name Textbox in Build Packages: //*input[@id="msiName"]
Product Name Textbox in Build Packages: //*input[@id="productName"]
Create as Client Package Checkbox in Build Packages: //*input[@type="checkbox"][@name="isAgentPackage"]
Select All Checkbox for Admin Tools Under Select DNA for MSI Package in Build Packages: //*a[@class="clsImageAction1"][contains(@href, "unescape('Agent%20Binaries')")]/preceding-sibling::input[@type="checkbox][@name="catcheck"]
Create MSI Package Button in Build Packages: ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//input[@value='Create MSI Package']"]
Build completed without critical errors Message in Build Packages: //*font[contains(text(), "Build completed without critical errors")]