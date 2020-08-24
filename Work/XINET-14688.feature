Feature: XINET-14688

As an admin, I should be able to create Backup to the desired location when I run full backup.
This is secure because Securely create a backup as admin

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
When I wait until "Backup in progress (message)" disappears
And I click on "VOLUMES/USERS (Header Tab)"
And I click on "System Volumes (Sub Header Tab)"
And I click on "summary tab"
And I click on "/xinetVols/WN Suite Test Files"
Then "backups folder" should be displayed

Scenario: Verify Backup is Generated Successfully, Backup file name should be "wnv_fullbkup.YYYY.MM.DD"
Given "TodayInYYYYMMDD" default value is "{date('YYYY.MM.DD')}"
When I wait for "10" minutes
And I click on "backups folder"
Then "Full Backup with Today Date in YYYYMMDD" should be displayed