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

//CRM MainFrame
["//iframe[@id='mainFrame']", ""]

//CRM Work 1
["//iframe[@id='mainFrame']", "//iframe[@id='work1']", ".u8-queryeditor-infoarea-header"]

//DNN PersonaBar Frame
["//iframe[@id='personaBar-iframe']", ""]


//ECN
//https://confluence.devfactory.com/display/KM/KMECN+E2E+Environment+Data+Structure

//Boint
Intranet Automation 1 Record (in Brick): //table[@class='standard']//tr[.//div[text()='Intranet Automation 1']]
Cog Icon (for Intranet Automation 1 Record, in Brick)://table[@class='standard']//tr[.//div[text()='Intranet Automation 1']]//span[@class='fal fa-cog']
Edit Bonzai Configuration Header: //h1[contains(text(),'Edit Bonzai Configuration')]
TermStore Group Guid Textbox: //input[@name='_owlTermStoreGroupGuid']
Footer Term Set Guid Textbox: //input[@name='_owlFooterTermSetGuid']



Link Icon (in Header): //div[@class='header-links-container']
Link Dropdown Menu (in Header): //nav[@class='header-links']
Marketplace (in Link Dropdown Menu): //nav[@class='header-links']//a[text()='Marketplace']
MarketPlace Card Text (First): //div[@class='bz-item-container'][1]//span[@class='title flex-1']
MarketPlace Card Text (Last): //div[@class='bz-item-container'][last()]//span[@class='title flex-1']
Search Textbox (in MarketPlace): //div[contains(@class,'bz-typeahead')][.//span[text()='Search']]//input
Suggestion Dropdown Item (in MarketPlace): //div[@class='bz-typeahead-suggestion']
Search Icon (in Search Textbox, in MarketPlace): //a[@class='bz-typeahead-icon']
Item Title (in MarketPlace Item Detail Page): //h1[@class='bz-header1']
See All Items (in MarketPlace): //span[text()='See All Items']
Location Dropdown (in MarketPlace): //div[@class='flex-1'][.//span[text()='Location']]//select
All (Location Dropdown Option - in Marketplace): //div[@class='flex-1'][.//span[text()='Location']]//select/option[text()='All']
Vancouver (Location Dropdown Option - in Marketplace): //div[@class='flex-1'][.//span[text()='Location']]//select/option[text()='Vancouver']
Toronto (Location Dropdown Option - in Marketplace): //div[@class='flex-1'][.//span[text()='Location']]//select/option[text()='Toronto']
Location Value (in MarketPlace Card Text - First): //div[@class='bz-item-container'][1]//li[.//span[text()='Location']]//span[@class='bz-word-wrap']

Category Dropdown (in MarketPlace): //div[@class='flex-1'][.//span[text()='Category']]//select
For Sale (Category Dropdown Option - in Marketplace): //div[@class='flex-1'][.//span[text()='Category']]//select/option[text()='For Sale']
Wanted (Category Dropdown Option - in Marketplace): //div[@class='flex-1'][.//span[text()='Category']]//select/option[text()='Wanted']
Services (Category Dropdown Option - in Marketplace): //div[@class='flex-1'][.//span[text()='Category']]//select/option[text()='Services']
All (Category Dropdown Option - in Marketplace): //div[@class='flex-1'][.//span[text()='Category']]//select/option[text()='All']
Category Value (in MarketPlace Card Text - First): //div[@class='bz-item-container'][1]//div[contains(@class,'bz-category')]/span
Sort By Dropdown (in MarketPlace): //div[@class='flex-1'][.//span[text()='Sort By']]//select
Expiring Soon (Sort By Dropdown Option - in Marketplace): //div[@class='flex-1'][.//span[text()='Sort By']]//select/option[text()='Expiring Soon']
Price Low to High (Sort By Dropdown Option - in Marketplace): //div[@class='flex-1'][.//span[text()='Sort By']]//select/option[text()='Price - Low to High']
Price High to Low (Sort By Dropdown Option - in Marketplace): //div[@class='flex-1'][.//span[text()='Sort By']]//select/option[text()='Price - High to Low']

//Boint
//BOINT Env
//https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure
//http://spadmin:Password%231@automation1
See All (for MarketPlace): //a[contains(@href,'marketplace')][text()='See All']
Current Node - MarketPlace: //span[@class='bz-current-node'][text()='MarketPlace']
Site Contents (Header): //span[@id='DeltaPlaceHolderPageTitleInTitleArea'][normalize-space(text())='Site Contents']
List Libraries and Other Apps: //span[normalize-space(text())='Lists, Libraries, and other Apps']
MarketPlace Locations (in Site Contents): //a[contains(@id,'viewlist')][normalize-space(text())='MarketPlace Locations']
MarketPlace Locations (Header in Site Contents): //span[@id='DeltaPlaceHolderPageTitleInTitleArea']//a[text()='MarketPlace Locations']
New Item: //span[text()='new item']
Title Textbox (in New MarketPlace Location Form): //input[contains(@id,'Title')][@title='Title Required Field']
Save Button (in Office Ribbon): //input[@value='Save'][contains(@id,'toolBarTbltop')]
Find an item Textbox: //input[@id='inplaceSearchDiv_WPQ2_lsinput']
Location List (Last Item): //tbody/tr[@role='row'][last()]//a[contains(@class,'ms-listlink')]
List Tab (in Office Ribbon): //span[@class='ms-cui-tt-span'][text()='List']
List Settings (in Office Ribbon): //a[contains(@id,'ListSettings')]
MarketPlace Locations - Settings (Header): //span[@id='DeltaPlaceHolderPageTitleInTitleArea'][.//a[text()='MarketPlace Locations']][.//span[text()='Settings']]
All Locations (in MarketPlace Locations Settings): //a[normalize-space(text())='All Locations']
Site Image Logo: //img[@class='ms-siteicon-img']
Location Dropdown (in MarketPlace): //div[@class='flex-1'][.//span[text()='Location']]//select
Location Dropdown Item (Last Item) (In MarketPlace): //div[@class='flex-1'][.//span[text()='Location']]//select/option[last()]





//temp Locator SCLOOP
Teacher Usage Stats Districts (Header): //div[@id='logo'][text()='Teacher Usage Stats: Districts']
District Name (First Item): //tr[1]/td[@class='districtname']
Report Date: //div[@class='report_date']
SCHOOLS (Table Header): //th[text()='SCHOOLS']
SCHOOLS (Sorted Descending): //th[text()='SCHOOLS'][contains(@class,'sorting_desc')]
SCHOOLS (Sorted Ascending): //th[text()='SCHOOLS'][contains(@class,'sorting_asc')]
Question Mark Icon (for TEACHERS): //th[text()='TEACHERS']/img[@class='tip']
Question Mark Icon Help Text (for TEACHERS): //div[@class='qtip-content'][text()='Registered teachers with at least one student.']
Published within dropdown: //select[@id='select_period']
7 DAYS (Published within dropdown value): //select[@id='select_period']/option[text()='7 DAYS']
14 DAYS (Published within dropdown value): //select[@id='select_period']/option[text()='14 DAYS']
Report Row One (in District Report): //tr[@role='row'][@class='odd']
Report Type Dropdown (in District Report): //li[@class='css_arrow']
Post 30 Day Totals (Report Dropdown Item): //li[@class='css_arrow']//a[contains(text(),'30 Day Totals')]
Question Mark Icon (for FREQUENT PUBLISHERS): //th[text()='FREQUENT PUBLISHERS']/img[@class='tip']
Question Mark Icon Help Text (for FREQUENT PUBLISHERS): //div[@class='qtip-content'][text()='Publishers with 10 or more posts in the last 30 days. Success is 80% or better.']

//temp Locator DNN-24982
["//iframe[@id='personaBar-iframe']", ""]
Connectors menu item: ["//iframe[@id='personaBar-iframe']", "//li[@id='Dnn.Connectors']"]
Connectors (Header): ["//iframe[@id='personaBar-iframe']", "//h3[text()='Connectors']"]
ZENDESK Connector: ["//iframe[@id='personaBar-iframe']", "//span[@class='socialnetwork-name'][text()='Zendesk']"]
Connect Button (for ZENDESK): ["//iframe[@id='personaBar-iframe']", "//tr[contains(@class,'edit-title last-row')][.//span[text()='Zendesk']]//a[text()='Connect']"]
Edit Button (for ZENDESK): ["//iframe[@id='personaBar-iframe']", "//tr[contains(@class,'edit-title last-row')][.//span[text()='Zendesk']]//a[text()='Edit']"]
Save Button (for ZENDESK): ["//iframe[@id='personaBar-iframe']", "//div[@id='connector-Zendesk']//a[@class='primarybtn savebtn']"]
Cancel Button (for ZENDESK): ["//iframe[@id='personaBar-iframe']", "//div[@id='connector-Zendesk']//a[text()='Cancel']"]
Settings Button (for ZENDESK): ["//iframe[@id='personaBar-iframe']", "//div[@id='connector-Zendesk']//a[text()='Settings']"]
Item Successfully Saved Message: ["//iframe[@id='personaBar-iframe']", "//p[@id='notification-message'][text()='Item successfully saved.']"]
Green Tick Mark (for ZENDESK): ["//iframe[@id='personaBar-iframe']", "//tr[contains(@class,'edit-title last-row')][.//span[text()='Zendesk']]//span[@class='socialnetwork-connection verified']"]
Zendesk URL Textbox: ["//iframe[@id='personaBar-iframe']", "//div[./label[text()='Zendesk URL:']]/input"]
Agent Email Textbox: ["//iframe[@id='personaBar-iframe']", "//div[./label[text()='Agent Email:']]/input"]
Agent Password Textbox: ["//iframe[@id='personaBar-iframe']", "//div[./label[text()='Agent Password:']]/input"]
Zendesk Advanced Settings Title: ["//iframe[@id='personaBar-iframe']", "//div[@class='title'][text()='Zendesk Advanced Settings']"]
Auto Ticket Creation Settings Field: ["//iframe[@id='personaBar-iframe']", "//div[@class='title'][text()='Auto Ticket Creation Settings']"]
Selected Fields Field: ["//iframe[@id='personaBar-iframe']", "//div[@class='title'][text()='Selected Fields']"]
Select Additional Fields Field: ["//iframe[@id='personaBar-iframe']", "//div[@class='title'][text()='Select Additional Fields']"]
Advanced settings saved succesfully: ["//iframe[@id='personaBar-iframe']", "//div[text()='Advanced Settings saved successfully.']"]
Save Button (in Advanced Settings Dialog): ["//iframe[@id='personaBar-iframe']", "//div[contains(@class,'personaBarDialog')]//span[@class='btn btn-accept']"]
Cancel Button (in Advanced Settings Dialog): ["//iframe[@id='personaBar-iframe']", "//div[contains(@class,'personaBarDialog')]//span[@class='btn btn-cancel']"]


//temp Locator DNN-31021
S.E.O. Tab: ["//iframe[@id='personaBar-iframe']", "//li[text()='S.E.O.']"]
Add URL (in Advanced SEO Page): ["//iframe[@id='personaBar-iframe']", "//div[@class='AddItemBox']"]
URL Path Textbox: ["//iframe[@id='personaBar-iframe']", "//div[contains(@class,'dnn-single-line-input-with-error')][contains(.,'URL Path')]//input"]
Save Button (in URL Table): ["//iframe[@id='personaBar-iframe']", "//div[@class='url-table']//button[text()='Save']"]
Invalid URL Error Dialog: ["//iframe[@id='personaBar-iframe']", "//p[@id='notification-message'][contains(text(),'illegal characters for a URL')]"]
Test Record (in URL Table): ["//iframe[@id='personaBar-iframe']", "//div[@class='url-table']//div[text()='/-test']"]
Delete Icon (for Test Record in URL Table): ["//iframe[@id='personaBar-iframe']", "//div[@class='url-table']/div[contains(.,'/-test')]//div[@class='extension-action'][1]"]

//temp Locator Bec
Turner Standard User Record: //td/span[contains(text(),'Turner Standard Users')]
Turner Standard User 3 Record: //td/span[normalize-space(text())='Turner Standard Users 3']
Group Name Title: //span[@class='punchTarget mainTitle']
Group Name Input: //div[contains(@class,'user-group-details-header')]//div[@ng-show='inputBoxVisible']/input
ADD USERS (in Group Management): //div[text()='ADD USERS']
ADD TO GROUP (in Group Management): //div[text()='ADD TO GROUP']
Checkbox (for Cuong): //tr[contains(.,'Cuong')]//label[contains(@for,'checkBoxId')]
Checkbox (for Eva): //tr[contains(.,'Eva')]//label[contains(@for,'checkBoxId')]
Cuong Record - In Group User List: //td/div[normalize-space(text())='Cuong']
Eva Record - In Group User List: //td/div[normalize-space(text())='Eva']
User Group Role Dropdown: //div[@change-callback='userGroupRoleChange']//button
Account Admin (Dropdown Item): //li/span[text()='Account Admin']
Back Arrow (in Group Management): //div[@ng-click='goBack()']
A few seconds ago: //td/span[normalize-space(text())='a few seconds ago']
Delete Icon (for Cuong): //tr[contains(.,'Cuong')]//i[contains(@class,'beckon-icon-tiny-trash-can')]
Delete Icon (for Eva): //tr[contains(.,'Eva')]//i[contains(@class,'beckon-icon-tiny-trash-can')]
User Deleted Message: //span[contains(text(),'was deleted from the user group')]
46 users (in Group Management): //span[text()='46 users']

//temp Locator DNN
Administrator User Name (in Add New Site Form): ["//iframe[@id='personaBar-iframe']", "//input[@id='admin-user-name']"]
First Name (in Add New Site Form): ["//iframe[@id='personaBar-iframe']", "//input[@id='admin-first-name']"]
Last Name (in Add New Site Form): ["//iframe[@id='personaBar-iframe']", "//input[@id='admin-last-name']"]
Email (in Add New Site Form): ["//iframe[@id='personaBar-iframe']", "//input[@id='admin-email']"]
Password (in Add New Site Form): ["//iframe[@id='personaBar-iframe']", "//input[@id='admin-password']"]
Confirm Password (in Add New Site Form): ["//iframe[@id='personaBar-iframe']", "//input[@id='admin-password-confirm']"]
subsite (the record in Sites Page): ["//iframe[@id='personaBar-iframe']", "//div[@class='portal-name'][text()='subsite']"]
Yes (confirmation button): ["//iframe[@id='personaBar-iframe']", "//a[@id='confirmbtn']"]

Sites menu item: ["//iframe[@id='personaBar-iframe']", "//li[@id='Dnn.Sites']"]
Sites panel: ["//iframe[@id='personaBar-iframe']", "//div[@id='EvoqSites-panel']"]
Add New Site: ["//iframe[@id='personaBar-iframe']", "//button[contains(text(),'Add New Site')]"]
Add New Site panel: ["//iframe[@id='personaBar-iframe']", "//h3[contains(text(),'Add New Site')]"]
Title: ["//iframe[@id='personaBar-iframe']", "//input[@id='add-new-site-title']"]
Directory (Radio Button): ["//iframe[@id='personaBar-iframe']", "//input[@id='radio-button-Directory-true']"]
Assign Current User as Administrator toggle: ["//iframe[@id='personaBar-iframe']", "//div[@class='dnn-grid-cell user-as-admin']//span[contains(@class, 'dnn-switch')]"]


//temp Locator CRM
Log in to Aurea CRM web: ["//iframe[@id='mainFrame']", "//h1[text()='Log in to Aurea CRM web']"]
User Name: ["//iframe[@id='mainFrame']", "//input[@id='txtUserName_input']"]
Password: ["//iframe[@id='mainFrame']", "//input[@id='txtPassword_input']"]
Login Button: ["//iframe[@id='mainFrame']", "//button[@id='btnLogin']"]
Start Page Tab: ["//iframe[@id='mainFrame']", "//span[@class='item-text'][text()='Start Page']"]

New Query Tab: ["//iframe[@id='mainFrame']", "//span[@class='item-text'][text()='New: Query']"]
Query name (in New Query Page): ["//iframe[@id='mainFrame']", "//iframe[@id='work1']", "//input[@id='editor_name_input']"]
Expand Icon for UQL Syntax (in New Query Page): ["//iframe[@id='mainFrame']", "//iframe[@id='work1']", "//div[@id='editor_statement_container']//span[@class='u8-grouppanel-collapse']"]
Black Code Textbox Block for UQL Syntax (in New Query Page): ["//iframe[@id='mainFrame']", "//iframe[@id='work1']", "//div[@class='CodeMirror-lines']//pre"]
Save Button (in New Query Page): ["//iframe[@id='mainFrame']", "//iframe[@id='work1']", "//button[@data-buttonname='Save']"]
Save Confirmation Message (in New Query Page): ["//iframe[@id='mainFrame']", "//iframe[@id='work1']", "//div[@id='editor_validationSummary']/ul/li"]

Settings (in Queries Page): ["//iframe[@id='mainFrame']", "//iframe[@id='work1']", "//span[@class='u8-header-button-text'][text()='Settings']"]
Query Name (in Queries Page): ["//iframe[@id='mainFrame']", "//iframe[@id='work1']", "//input[contains(@id,'Form_field0_input')]"]
Search Result First Row First Cell (in Queries Page): ["//iframe[@id='mainFrame']", "//iframe[@id='work1']", "//tr[@id='content_grid_row_0']//td[@class='u8-grid-action']"]
Search Result First Row Menu (in Queries Page): ["//iframe[@id='mainFrame']", "//iframe[@id='work1']", "//tr[@id='content_grid_row_0']//span[@class='img u8-img-contextmenu-s']"]
Search Result First Row Disabled (in Queries Page): ["//iframe[@id='mainFrame']", "//iframe[@id='work1']", "//tr[@id='content_grid_row_0'][contains(@class,'u8-grid-disabled')]"]

Queries And Analyses (Left Menu): ["//iframe[@id='mainFrame']", "//a[@data-menu='ID_NET_QUERIES_AND_STATISTICS']"]
Queries (Left Sub Menu): ["//iframe[@id='mainFrame']", "//div[@class='u8-contextmenu-item-text'][text()='Queries']"]
New Query (Left Sub Menu): ["//iframe[@id='mainFrame']", "//div[@class='u8-contextmenu-item-text'][text()='New Query']"]
Clear Search Criteria (Dropdown Option): ["//iframe[@id='mainFrame']", "//span[@class='u8-contextmenu-item-text'][text()='Clear Search Criteria']"]
Delete (Dropdown Option): ["//iframe[@id='mainFrame']", "//span[@class='u8-contextmenu-item-text'][text()='Delete']"]
Yes (Popup Button): ["//iframe[@id='mainFrame']", "//span[@class='u8-button-text'][text()='Yes']"]
Start Search (in Work1 Frame): ["//iframe[@id='mainFrame']", "//iframe[@id='work1']", "//span[@class='u8-button-text'][text()='Start Search']"]