Feature: PAUB-25191

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UB-Cred"

Scenario: Verify that the UltraBand VM is running: virsh list
Given shell session to "UB-Host"
When I execute script:
"""
virsh list
"""
Then I remember the output as "ShellOutput"
Given "AAA" default value is "{regex_replace({ShellOutput},(ub).+(running),$1-$2)}"
Then the value of "AAA" should be"ub-running"

Scenario: Check that the system contains PCI Network Interfaces
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