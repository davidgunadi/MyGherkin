Feature: SNSGCID-70985

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "end-to-end" from "https://confluence.devfactory.com/x/cUTsGg"
Given credentials "ssh-user"

Scenario: Populate data
Given HTTP request
When I execute GET request for "{environment.datasetpreload-single-node.URL}/TEST-70985"
Then "Preload finished" should be in response body

Scenario: Enable adapter
Given shell session to "ssh-single-node"
When I execute script:
"""

sed -i "s/enabled='0'/enabled='1'/g" /opt/sensage/etc/collector/adapters/apache_access_syslogng/config.xml

sudo service sensage_collector restart

"""
Then commands should complete successfully

Scenario: Check adapter is enabled
When I execute script:
"""

collectorAdmin enabled | grep apache_access_syslogng

"""
Then commands should complete successfully
And "apache_access_syslogng: enabled" should be in output

Scenario: Enable adapter
When I execute script:
"""

sed -i "s/enabled='1'/enabled='0'/g" /opt/sensage/etc/collector/adapters/apache_access_syslogng/config.xml

sudo service sensage_collector restart

"""
Then commands should complete successfully

Scenario: Check adapter is disabled
When I execute script:
"""

collectorAdmin disabled | grep apache_access_syslogng

"""
Then commands should complete successfully
And "apache_access_syslogng: disabled" should be in output