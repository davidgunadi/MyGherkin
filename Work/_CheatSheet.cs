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

//Date
Given "NextMonthDateInMMDDYYYY" default value is "{date('MM/DD/YYYY','30 days')}"

// Set Window Size
And I set window size to "1280x1024"

Given "RandomValue" default value is "{date('M/DD/YYYY')}"

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

Solr Server (Header): ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//font[@class='pageheader'][text()='Solr Server']"]
Perform Fuzzy Searches Checkbox in Solr Server: ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//input[@id='prefFuzzySearchId']"]
Disable Spell Checkbox in Solr Server: ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//input[@name='prefSpellCheckDisabled']"]
Save Button in Solr Server: ["//frame[@name='mainAdmin']", "//frame[@name='sadRightFrame']", "//input[@id='prefsubmit']"]
Unchecked Perform Fuzzy Searches Checkbox in Solr Server:
UnChecked Disable Spell Checkbox in Solr Server:


////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//                              JVHOPST                               //
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//https://confluence.devfactory.com/display/EN/Jive+HOP+Standard+E2E+Environment+Data

OK Got It: //button[text()='OK, Got It']
Stream name Textbox: //input[@id='New Stream-label-id']
Search Textbox (in Stream Page): //input[@id='j-stream-edit-search-textfield']
Add Button (for Community Group for storing ALL types of content): //li[contains(.,'Community Group for storing ALL types of content')]//button[text()='Add']

In Stream Button (for Community Group for storing ALL types of content)://li[contains(.,'Community Group for storing ALL types of content')]//button[text()='In Stream']
Done Button (in New Stream Page): //button[contains(@class,'js-done-editing-stream')]
GroupStream (in Stream Page): //span[contains(@class,'j-js-nav-stream-name')][contains(text(),'GroupStream')]
You created TestProject (Notification, in Stream Page): //li[@class='j-act-g-item'][contains(.,'You created')][.//span[@class='j-item'][contains(text(),'TestProject')]]
X Icon (in Stream Page): //span[contains(@class,'icon-cancel-circle2')]
Delete Icon (in Delete This Stream confirmation popup): //input[@id='stream-delete-submit-button']

Name Textbox (in Create Project): //input[@id='jive-place-name-input']
Description Textarea (in Create Project): //textarea[@name='description']
Tags Textbox (in Create Project): //div[@class='j-tags']
Test Project in Community Group for storing ALL types of content (Header): //h1[@class='j-placeTitle'][.//a[contains(text(),'TestProject')]][.//a[contains(text(),'Community Group for storing ALL types of content')]]
Green Tick Mark for URL Textbox (in Create Project): //div[@class='j-placeUrlField']//span[@class='jive-icon-glyph icon-checkmark font-color-okay']