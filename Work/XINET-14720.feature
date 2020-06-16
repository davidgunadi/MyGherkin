Feature: XINET-14720

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "stage" from "https://confluence.devfactory.com/display/NOR/Xinet+Environment"
Given credentials "nativeadmin"

Scenario: Login to Xinet Server
Given browser "Chrome"
When I open "{environment.SERVER.Login URL}"
Then "summary" should be displayed

Scenario: Apply Permission Set to User group
When I click on "Top Navigation - VOLUMES/USERS"
And I click on "Sub Navigation - Permissions"
And I click on "Page Navigation - edit user permissions"
And I click on "Group Name - QAGroup QAUsers"
And I click on "Group Name - QAGroup"
And I click on "Template Input - IPTC-NAA"
And I click on "Permission Set input - IPTCPermissionSet"
And I click on "Permission Set Edit - Submit Button"
Then "Submit Message - Permission Set Successfully Updated" should be displayed










Top Navigation - VOLUMES/USERS: //div[@id='top-nav']//a[text()='Volumes/Users']
Sub Navigation - Permissions: //div[@id='sub-nav']//a[text()='Permissions']
Page Navigation - edit user permissions: //div[@id='page-nav']//a[text()='Edit User Permissions']
Group Name Range input: //select[@name='coarse']
Group Name - QAGroup QAUsers : //select[@name='coarse']/option[contains(text(),'QAGroup - qausers')]
Group Name input: //select[@id='user_name']
Group Name - QAGroup: //select[@id='user_name']/option[contains(text(),'QAGroup')]
Submit Message - Permission Set Successfully Updated: //div[@id='messages']/span[contains(text(),'Permission Set successfully updated')]
Template input: //select[@name='template_name']
Template Input - IPTC-NAA: //select[@name='template_name']/option[text()='IPTC-NAA']
Permission Set input: //select[@name='permset_name']
Permission Set input - IPTCPermissionSet: //select[@name='permset_name']/option[text()='IPTCPermissionSet']
Permission Set Edit - Submit Button: //input[@name='permset_submit']