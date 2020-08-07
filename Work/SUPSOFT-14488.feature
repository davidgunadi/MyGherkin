Feature: SUPSOFT-14488

As an administrator, I must get redirected to login page, when I try to delete a code with invalidated/expired session.

Scenario: Preconditions
Given environment "Access (via RDP) information is indicated in the section "Remote Desktop" from the linked page" from "https://docs.google.com/document/d/1Zo_M18av6x5sYxfyDJFHW1hr9E4pNt4We5mvrfRALwI/edit#bookmark=id.ihcpu1eehc0a"
Given credentials "Credentials for the referred users indicated in Pre-conditions and Scenario"

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Precondition - Run SUPSOFT-17692 to generate a new user with code
Given browser "Chrome"
When I execute scenario "SUPSOFT-17692" to capture outputs "GeneratedRandomUser"
Then scenario steps should complete successfully

Scenario: Remove all Cookies, then delete Generated Code for User
When I execute an action which only human can execute:
"""
Open Developer Tools for the Browser you are using.
Remove all the Session Cookies for the environment.
"""
When I click on "Delete Icon for GeneratedRandomUser in Generate Connection Code Table"
Then "Username Textbox in SC Login Page" should be displayed