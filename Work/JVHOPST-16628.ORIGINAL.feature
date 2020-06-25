Feature: JVHOPST-16628

# EnvDS Error: href is not a confluence link

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Select an instance based on the guide in the [Jive HOP Standard - Testing Environments document * Selectors: * Username: //*[@id="u01"]
    * Password: //*[@id="p01"]
    * Login button: //*[@id="jive-loginTable"]/table/tbody/tr[1]/td/table/tbody/tr[1]/td[3]/input
    * Application landing: "Application landing page for the user. It may be any configured page, like News, Main etc. that proves the user is logged in, i.e. avatar icon for the user is displayed on top right"
    * People: //*[@id="jive-nav-link-conx"]/a
    * Pencil Icon: //*[@id="navCreate"]
    * Event: //*[@id="create-list-0"]/li[11]/a
    * Event Title Input: //*[@id="subject"]
    * Start Date Input: //*[@id="start-date"]
    * Event Location Input: //*[@id="event-location"]
    * Create Event: //*[@id="submitButton"]
    * Start Date Display: //*[@id="jive-event-whenwhere"]/ul/li[1]/span" from "https://aurea.jiveon.com/docs/DOC-201174"
Given credentials "Select the user account based on the instructions from the "Data prerequisites" row"

Scenario: Login as 'doll.tearsheet@aurea.com'
When I open "{env.Default SE7 environment.URL}/login.jspa"
And I set "Username" value to "{env.Default SE7 environment.credentials.username}"
And I set "Password" value to "{env.Default SE7 environment.credentials.password}"
And I click on "Login button"
Then "Application landing" page should be displayed

Scenario: Open Create Event Page
When I click on "Pencil Icon"
And I click on "Event menu item"
Then "Create a new event | Main" page should be displayed

Scenario: Create a Event
When I set "Event Title Input" value to "Test Event"
And I set "Start Date Input" value to "same day of the next month"
And I set "Event Location Input" value to "zoom"
And I click on "The Main Community"
And I click on "Create Event"
Then "Test Event | Main" page should be displayed
And I should see "same day of the next month" in "Start Time", e.g.
[https://jira.devfactory.com/secure/attachment/997881/997881_image-2020-04-12-08-50-26-367.png]