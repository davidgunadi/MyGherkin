Feature: BOINT-7730

# EnvDS Error: TypeError: Cannot read property 'credentials' of undefined

Log in to Bonzai as a site collection administrator.
The is logged in successfully.

Navigate to the Bonzai Marketplace by clicking on the See All button on the MarketPlace web part near the bottom of the page, before the footer section
The Bonzai Marketplace is opened

Open the Site Contents by clicking on the option under the Admin Menu (gear icon at top of page)
The Site Contents page is opened, showing the available lists and libraries for the site.

Click on the MarketPlace Locations custom list by clicking on it
The MarketPlace Locations list is opened

Click on New Item
The new item page for MarketPlace Locations is opened, having a single field for the Title

Enter the name of a place and click on the Save button
The page returns to the MarketPlace Locations screen, showing the new item in the list

Click on the List Settings under the List tab of the SharePoint Ribbon
The List Settings page is opened (), having a heading of MarketPlace Locations > Settings

Scroll to the bottom of the list settings page and locate the Views
The All Locations view is present in the section.

Click on the logo to the left of the page heading, to return to the Bonzai MarketPlace
The Bonzai MarketPlace page is opened

Click on the Location dropdown
The available options for the MarketPlace Locations are displayed, showing the newly created items in addition to the already existing ones.
Scenario: Preconditions
Given environment "User has necessary configuration information about the target Bonzai environment" from "https://confluence.devfactory.com/display/BI/Non-Prod+Environments"

