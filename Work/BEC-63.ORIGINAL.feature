Feature: BEC-63

# EnvDS Error: href is not a confluence link

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "*BECKON_ENV

**URL: <"URL" of "QA" or "Staging" Environment in the referenced Environments document>

**Credentials: <"Login" and "Password" of any user with "App Admin" role in the referenced Users document> * Selectors * Username Input: //*[@id="login"]
    * Password Input: //*[@id="password"]
    * Sign In Button: //div[contains(text(), 'Sign In')]
    * Insights menu: //div[contains(@class, 'top-nav')]//div[contains(text(), 'INSIGHTS')]
    * Dashboards: //div[contains(@class, 'top-nav')]//a[contains(text(), 'Dashboards')]
    * Create new dashboard button: //div[contains(text(), 'CREATE NEW DASHBOARD')]
    * Dashboard title: //div[contains(@class, 'title-text')]
    * Dashboard description: //div[contains(@class, 'description-edit')]
    * Add items button: //div[contains(@qtip, 'Add Items')]
    * Add text button: //div[contains(@qtip, 'Add Text')]
    * Text editor: //*[@id="quill-editor"]
    * Save button: //div[text()='save']
    * Content of First Text Card in dashboard: (//text-card)[1]//div[contains(@class, 'card-text-display')]/div" from "https://docs.google.com/document/d/1bXMV7Kf7gcoByIm0FbDMUxrYC3JcEe_oySIdTxUI0GI/edit#heading=h.qj0uxz34vyhs

https://docs.google.com/document/d/1bXMV7Kf7gcoByIm0FbDMUxrYC3JcEe_oySIdTxUI0GI/edit#heading=h.phxan68gb6wq"
Given credentials "N/A"

Scenario: Log in
When I open "<BECKON_ENV.URL>"
And I click on "Username Input"
And I type "BECKON_ENV.Credentials.Login"
And I click on "Password Input"
And I type "BECKON_ENV.Credentials.Password"
And I click on "Sign In Button"
Then "BECKON" page should be displayed

Scenario: Navigate to Dashboards
When I hover on "Insights menu"
And I click on "Dashboards"
Then "AVAILABLE DASHBOARDS" page should be displayed

Scenario: Create Dashboard
When I click on "Create new dashboard button"
And I click on "Dashboard title"
And I set "Dashboard title" value to "Test Dashboard - <current date and time, ex. 1/4/2020 02:07 PM>"
And I press "ENTER"
And I click on "Dashboard description"
And I set "Dashboard description" value to "Test Dashboard"
And I press "ENTER"
Then I should see "Test Dashboard - <current date and time>" in "Dashboard title"
And I should see "Test Dashboard" in "Dashboard description"

Scenario: Create Text Card
When I hover on "Add items button"
And I click on "Add text button"
Then "ADD NEW TEXT CARD" window should be displayed

Scenario: Populate and save Text Card
When I click on "Text editor"
And I set "Text editor" value to "Text card content - <current date and time>"
And I click on "Save button"
Then I should see "Text card content - <current date and time>" in "Content of First Text Card in dashboard"