Feature: XINET-14688

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "stage" from "https://confluence.devfactory.com/display/NOR/Xinet+Environment"
Given credentials "nativeadmin"

Scenario: Login to Xinet Server
Given browser "Chrome"
When I open "{environment.SERVER.URLCred}"
Then "summary" should be displayed

Scenario: Navigate to DATABASE -> Admin -> backup and Verify Backup Location
When I click on "Database Header Tab"
And I click on "Admin Tab In Database Menu"
And I click on "backup Tab (under Admin)"
Then "BACKUP INFO (Table Header)" should be displayed
And I should see "/xinetVols/WN Suite Test Files/backups" in "Backup Location"

Scenario: Click Full Backup Now
When I click on "Full Backup Now"
Then I remember the alert text as "AlertMessage"
And the value of "AlertMessage" should be "Are you sure you want to backup the database?"

Scenario: Click OK in Alert
When I accept the alert box
Then "Backup in progress (message)" should be displayed

Scenario: VOLUME/USERS -> System Volumes -> summary and click on root path for "WN Suite Test Files"
When I click on "VOLUMES/USERS (Header Tab)"
And I click on "System Volumes (Sub Header Tab)"
And I click on "summary tab"
And I click on "/xinetVols/WN Suite Test Files"
Then I should see "WN Suite Test Files WEB" in "Folders (dropdown)"

Scenario: Verify Backup is Generated Successfully, Backup folder name should be wnv_fullkbkup.<date>
Given "Today" default value is "{date('YYYY.MM.DD')}"
When I click on "Folders (dropdown)"
And I type "backups"
And I press "TAB"
Then I should see "backups" in "Folders (dropdown)"
When I click on "Folders (dropdown)"
And I press "END"
And I press "TAB"
Then I should see "wnv_quickbkup.{Today}" in "Folders (dropdown)"