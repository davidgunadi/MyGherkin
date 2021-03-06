Feature: PAUB-29833

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred"

Scenario: Check Vulnerability
Given browser "Chrome" as "browser"
When I open "{environment.UBView.Hack URL-7}" in "browser"
Then alert should not be displayed in "browser"