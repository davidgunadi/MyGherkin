Feature: BOINT-5467

# EnvDS Error: TypeError: Cannot read property 'credentials' of undefined

Log in to Bonzai as a site collection administrator.
The Home page is loaded successfully.

Click on the header links (link icon) to the left of the search field on the navigation header
The Header Links sub menu is expanded

Navigate to the Bonzai Marketplace by clicking on the Marketplace item in the header links sub menu
The Marketplace page is opened, showing multiple active listings

Locate an item that is currently present in the marketplace, and enter part of its title in the marketplace search field
Results suggestions are displayed in a dropdown below the search field as you type

Click on the search icon at the right end of the search field
The search results are updated to show only the matching item/s

Click on the matching item in the results section
The item details page for the item is opened

Click on the See All Items button at the top of the page
You are taken back to the main marketplace page

Click on the location dropdown and selects an option
The results section is filtered to show items belonging to that location, if any

Select another location from the dropdown
The results section is once again filtered to show items belonging to that location, if any

Select All from the location dropdown
The results section is no longer filtered by location

Click on the Category dropdown and select For Sale
The results are filtered to show only items for sale, if any

Click on the Category dropdown and select Wanted
The results are filtered to show only items wanted, if any

Click on the Category dropdown and select Services
The results are filtered to show only services, if any

Select All from the category dropdown
The results section is no longer filtered by category

Click on the Sort By dropdown and select Expiring Soon
The results are ordered with the items that are expiring soon listed first in order of expiration date

Select Price - Low to High on the Sort By dropdown
The results are ordered according to ascending price

Select Price - High to Low on the Sort By dropdown
The results are ordered according to descending price
Scenario: Preconditions
Given environment "User has necessary configuration information about the target Bonzai environment" from "https://confluence.devfactory.com/display/BI/Non-Prod+Environments"

