Feature: PAUB-25189

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UB-Cred"

Scenario: Check that the system contains PCI Network Interfaces
Given shell session to "UB-Guest"
When I execute script:
"""
lspci | grep -i eth
"""
Then "Ethernet controller:" should be in output

Scenario: Check for DMAR fault strings in the boot process
When I execute script:
"""
dmesg | grep DMAR | grep fault
"""
Then the output should be ""