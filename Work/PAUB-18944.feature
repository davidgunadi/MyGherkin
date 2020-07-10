Feature: PAUB-18944

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB6-2" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UB-Cred"

Scenario: Navigate Logs
Given shell session to "UB-Guest" as "Guest Shell"
When I execute command "cd /opt/pang/cdrs" in "Guest Shell"
Then commands in "Guest Shell" should complete successfully

Scenario: Grep CDRs
When I execute command "if [[ $(zgrep -i 'cache in' pang_cdr* | head | wc -c) -ne 0 ]]; then echo success; fi" in "Guest Shell"
Then commands in "Guest Shell" should complete successfully