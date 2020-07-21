Feature: JVFINTG-8007

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/pages/viewpage.action?spaceKey=JIVE&title=Environments"
Given credentials "admin"

Scenario: Install browser plugin
Given browser "Firefox"
When I execute an action which only human can execute:
"""
I press Ctrl+Shift+A
I click on "Tools for all addons"
I upload {Jive Plugin for Firefox} file (Variable path is in EnvDS File)
I click on "Add"
I click on "Okay, Got It"
"""
Then I should verify what only human can verify:
"""
Extension should be installed successfully
"""