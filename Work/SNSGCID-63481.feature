Feature: SNSGCID-63481

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "end-to-end" from "https://confluence.devfactory.com/x/cUTsGg"
Given credentials "ssh-user"

Scenario: Get help
Given shell session to "ssh-single-node"
When I execute script:
"""
collectorAdmin
"""
Then "usage" should be in output

Scenario: Get all adapters status
When I execute script:
"""
collectorAdmin all
"""
Then "hexis_hawkeye_analyzerAudit_syslogng: enabled" should be in output
And "sap_aud_sftp: disabled" should be in output

Scenario: Get disabled adapters
When I execute script:
"""
collectorAdmin disabled
"""
Then "sap_aud_sftp: disabled" should be in output

Scenario: Find adapter information
When I execute script:
"""
collectorAdmin find microsoft_windows_securityEvent_sensageRetriever 2> /dev/null
"""
Then the output should be:
"""
Loading config files from '/opt/sensage/etc/collector'
Items matching: microsoft_windows_securityEvent_sensageRetriever

Loader l_microsoft_windows_securityEvent_sensageRetriever: enabled
 /opt/sensage/etc/collector/adapters/microsoft_windows_securityEvent_sensageRetriever/config.xml
LogQueue q_microsoft_windows_securityEvent_sensageRetriever: enabled
 /opt/sensage/etc/collector/adapters/microsoft_windows_securityEvent_sensageRetriever/config.xml
Retriever r_microsoft_windows_securityEvent_sensageRetriever: enabled
 /opt/sensage/etc/collector/adapters/microsoft_windows_securityEvent_sensageRetriever/config.xml
"""

Scenario: Get adapters details
When I execute script:
"""
collectorAdmin detail
"""
Then "Loader l_hexis_hawkeye_analyzerAudit_syslogng: enabled" should be in output
And "LogQueue q_hexis_hawkeye_analyzerAudit_syslogng: enabled" should be in output
And "Retriever r_hexis_hawkeye_analyzerAudit_syslogng: enabled" should be in output
And "Loader l_sap_aud_sftp: item disabled" should be in output
And "LogQueue q_sap_aud_sftp: enabled" should be in output
And "Retriever r_sap_aud_sftp: item disabled" should be in output

Scenario: Get stats
When I execute script:
"""
collectorAdmin showstats
"""
Then "Retriever Statistics:" should be in output
And "Loader Statistics:" should be in output

Scenario: Clear stats
When I execute script:
"""
collectorAdmin clearstats 2> /dev/null
"""
Then the output should be:
"""
Loading config files from '/opt/sensage/etc/collector'
Warning all accumulated statistics data will be removed.
Are you sure you want to clear collector statistics?
"""

Scenario: Confirm clear stats and verify
When I execute command "y"
And I execute script:
"""
collectorAdmin showstats 2> /dev/null
"""
Then the output should be:
"""
Loading config files from '/opt/sensage/etc/collector'
showStats stateDir=/opt/sensage/data/collector//state/statistics.dat
Retriever Statistics:

Loader Statistics:


"""

Scenario: Disable adapter
When I execute script:
"""
collectorAdmin disable sun_bsm_sftp 2> /dev/null
"""
Then the output should be:
"""
Loading config files from '/opt/sensage/etc/collector'
disabled adapter sun_bsm_sftp
"""

Scenario: Enable adapter
When I execute script:
"""
collectorAdmin enable sun_bsm_sftp 2> /dev/null
"""
Then the output should be:
"""
Loading config files from '/opt/sensage/etc/collector'
enabled adapter sun_bsm_sftp
"""