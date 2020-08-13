Feature: NORTHP-80

As admin, I should be able to view assets in the website and get appropriate results when I apply and remove filters
This is accessible because User can access assets page and its filters

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

Scenario: Navigate to Asset Options
When I click on "Assets"
And I click on "Show More (under Asset Category)"
Then "Image checkbox (under Asset Category)" should be displayed
And "Audio checkbox (under Asset Category)" should be displayed
And "Document checkbox (under Asset Category)" should be displayed
And "Playlist checkbox (under Asset Category)" should be displayed
And "Video checkbox (under Asset Category)" should be displayed

Scenario: Apply Image Filter and Verify
When I "check" "Image checkbox (under Asset Category)" checkbox
Then "Asset Category: Image" should be displayed
When I right click on "First asset in search result"
And I click on "info in asset submenu"
And I wait for "2" seconds
Then I should see "Image" in "Asset Category Textbox"

Scenario: Apply Audio Filter and Verify
When I click on "Close button"
And I wait for "2" seconds
And I wait until "Asset Category: Image" appears
And I "uncheck" "Image checkbox (under Asset Category)" checkbox
And I click on "Show More (under Asset Category)"
And I "check" "Audio checkbox (under Asset Category)" checkbox
Then "Asset Category: Audio" should be displayed
When I right click on "First asset in search result"
And I click on "info in asset submenu"
And I wait for "2" seconds
Then I should see "Audio" in "Asset Category Textbox"

Scenario: Apply Document Filter and Verify
When I click on "Close button"
And I wait for "2" seconds
And I wait until "Asset Category: Audio" appears
And I "uncheck" "Audio checkbox (under Asset Category)" checkbox
And I click on "Show More (under Asset Category)"
And I "check" "Document checkbox (under Asset Category)" checkbox
Then "Asset Category: Document" should be displayed
When I right click on "First asset in search result"
And I click on "info in asset submenu"
And I wait for "2" seconds
Then I should see "Document" in "Asset Category Textbox"

Scenario: Apply Playlist Filter and Verify
When I click on "Close button"
And I wait for "2" seconds
And I wait until "Asset Category: Document" appears
And I "uncheck" "Document checkbox (under Asset Category)" checkbox
And I click on "Show More (under Asset Category)"
And I "check" "Playlist checkbox (under Asset Category)" checkbox
Then "Asset Category: Playlist" should be displayed
When I right click on "First asset in search result"
And I click on "info in asset submenu"
And I wait for "2" seconds
Then I should see "Playlist" in "Asset Category Textbox"

Scenario: Apply Video Filter and Verify
When I click on "Close button"
And I wait for "2" seconds
And I wait until "Asset Category: Playlist" appears
And I "uncheck" "Playlist checkbox (under Asset Category)" checkbox
And I click on "Show More (under Asset Category)"
And I "check" "Video checkbox (under Asset Category)" checkbox
Then "Asset Category: Video" should be displayed
When I right click on "First asset in search result"
And I click on "info in asset submenu"
And I wait for "2" seconds
Then I should see "Video" in "Asset Category Textbox"

Scenario: Apply Image Filter and Make it Sticky
When I click on "Close button"
And I wait for "2" seconds
And I wait until "Asset Category: Video" appears
And I "uncheck" "Video checkbox (under Asset Category)" checkbox
And I click on "Show More (under Asset Category)"
And I "check" "Image checkbox (under Asset Category)" checkbox
And I wait until "Asset Category: Image" appears
And I click on "Pin Icon for Asset Category: Image"
Then "Asset Category: Image (as Sticky Filter)" should be displayed

Scenario: Apply Audio Filter and Make it Sticky
When I click on "Show More (under Asset Category)"
And I "check" "Audio checkbox (under Asset Category)" checkbox
And I wait until "Asset Category: Audio" appears
And I click on "Pin Icon for Asset Category: Audio"
Then "Asset Category: Audio (as Sticky Filter)" should be displayed

Scenario: Apply Document Filter and Make it Sticky
When I click on "Show More (under Asset Category)"
And I "check" "Document checkbox (under Asset Category)" checkbox
And I wait until "Asset Category: Document" appears
And I click on "Pin Icon for Asset Category: Document"
Then "Asset Category: Document (as Sticky Filter)" should be displayed

Scenario: Apply Playlist Filter and Make it Sticky
When I click on "Show More (under Asset Category)"
And I "check" "Playlist checkbox (under Asset Category)" checkbox
And I wait until "Asset Category: Playlist" appears
And I click on "Pin Icon for Asset Category: Playlist"
Then "Asset Category: Playlist (as Sticky Filter)" should be displayed

Scenario: Apply Video Filter and Make it Sticky
When I click on "Show More (under Asset Category)"
And I "check" "Video checkbox (under Asset Category)" checkbox
And I wait until "Asset Category: Video" appears
And I click on "Pin Icon for Asset Category: Video"
Then "Asset Category: Video (as Sticky Filter)" should be displayed

Scenario: Remove Sticky Image Filter
When I click on "X button for Asset Category: Image"
Then "Asset Category: Image (as Sticky Filter)" should not be displayed

Scenario: Remove Audio Image Filter
When I click on "X button for Asset Category: Audio"
Then "Asset Category: Audio (as Sticky Filter)" should not be displayed

Scenario: Clear all sticky filter
When I click on "X button outside the remove sticky filter (to clear all sticky filter)"
Then "Asset Category: Document (as Sticky Filter)" should not be displayed
And "Asset Category: Playlist (as Sticky Filter)" should not be displayed
And "Asset Category: Video (as Sticky Filter)" should not be displayed