Feature: NORTHP-83

As admin, I should be able to add, edit, and delete Collections when I use the TSWeb Site
This is accessible because User can access Collections in TS Web
This is consistent because Consistent result when adding, editing, and deleting Collections

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Telescope Web Server QA" from "https://confluence.devfactory.com/display/NOR/Telescope+-+Testing+environments+-+Data+Structure+Environments"
Given credentials "telescopetswebqa"

Scenario: Login to the TSWeb
Given browser "Chrome"
When I open "{environment.endpoints.TSWeb application.URL}"
And I click on "Close (in Cookies Bar)"
And I set "{environment.endpoints.TSWeb application.connectTo}" to "Connect To" value
And I set "{credentials.telescopetswebqa.username}" to "Username" value
And I set "{credentials.telescopetswebqa.password}" to "Password" value
And I click on "Login"
Then "Telescope" page should be displayed

Scenario: Add New Collection
When I click on "My Collections Menu"
Then "My Collection Dropdown Panel" should be displayed

Scenario: Add New Collection
When I click on "+ Icon (New Collection Button)"
Then "Collection name input (in Collection Properties Dialog)" should be displayed

Scenario: Add New Collection
Given "VarCollectionName" default value is "Collection_{date('YYYYMMDDmmss')}"
When I set "Collection name input (in Collection Properties Dialog)" value to "{VarCollectionName}"
And I set "Password input (in Collection Properties Dialog)" value to "Password123#"
And I click on "Top Level Option (in Save In Listbox)"
And I click on "Submit Button (in Collection Properties Dialog)"
Then I should see "{VarCollectionName}(0)" in "Collection with the name 'VarCollectionName' in the Collection List"

Scenario: Edit New Collection
When I click on "Collection with the name 'VarCollectionName' in the Collection List"
And I click on "Info Button for 'VarCollectionName'"
Then I should see "{VarCollectionName}" in "Collection name input (in Collection Properties Dialog)"
And I should see "Password123#" in "Password input (in Collection Properties Dialog)"

Scenario: Edit New Collection
Given "VarCollectionName" value is "CollectionEdited_{date('YYYYMMDDmmss')}"
When I set "Collection name input (in Collection Properties Dialog)" value to "{VarCollectionName}"
And I set "Password input (in Collection Properties Dialog)" value to "Password456#"
And I click on "Submit Button (in Collection Properties Dialog)"
Then I should see "{VarCollectionName}(0)" in "Collection with the name 'VarCollectionName' in the Collection List"

Scenario: Delete created Collection
When I click on "Collection with the name 'VarCollectionName' in the Collection List"
And I click on "Delete Collection Button (- Icon)"
Then I should see "You are about to delete the selected collection(s)" in "Delete Collection Confirmation Message"

Scenario: Delete created Collection
When I click on "TSWeb - Alert Message - OK button"
Then "Collection with the name 'VarCollectionName' in the Collection List" should not be displayed