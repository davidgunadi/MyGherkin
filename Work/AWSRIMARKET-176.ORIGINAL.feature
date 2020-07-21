Feature: AWSRIMARKET-176

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "qa" from "https://confluence.devfactory.com/pages/viewpage.action?pageId=458296152"
Given credentials "qa_web"

Scenario: Open login page
Given browser "Chrome"
When I open "{environment.RIMP Web.URL}"
Then "Email Textbox (in Login Page)" should be displayed

Scenario: Open Sign Up page
When I click on "Create an account"
Then "Welcome Please create your account message" should be displayed

Scenario: Sign Up
When I execute an action which only human can execute:
"""
Enter any email to which you have access which will be referred as Email into "SignUpEmailInput".
"""
And I set "SignUpPasswordInput" value to "{test_web_password}"
And I set "SignUpConfirmPasswordInput" value to "{test_web_password}"
And I click on "SignUpButton"
Then I should see "Please confirm your email. Either click on the link in the confirmation email or enter the code here" in "Enter the code here message"
And I should verify what only human can verify:
"""
An email message should come to the Email with a caption containing "RI Marketplace" and a numeric code for verification which will be referred as Code.
"""

Scenario: Resend confirmation email
When I execute an action which only human can execute:
"""
Enter the Email into "ConfirmRegistrationEmailInput".
"""
And I click on "ConfirmRegistrationResendEmailButton"
Then I should verify what only human can verify:
"""
An email message should come to the Email with a caption containing "RI Marketplace" and a numeric code for verification which will be referred as Code. The Code should be different from the previously received Code.
"""

Scenario: Try wrong confirmation code
When I set "ConfirmRegistrationCodeInput" value to "000000"
And I click on "ConfirmRegistrationConfirmButton"
Then I should see "Invalid verification code provided, please try again." in "ConfirmRegistrationErrorMessage"

Scenario: Use the correct Code to confirm the email
When I execute an action which only human can execute:
"""
Enter the correct Code you received in email into "ConfirmRegistrationCodeInput".
"""
And I click on "ConfirmRegistrationConfirmButton"
Then "Email Textbox (in Login Page)" should be displayed

Scenario: Try wrong password for Sign In
When I execute an action which only human can execute:
"""
Enter the Email into "SignInEmailInput".
"""
And I set "SignInPasswordInput" value to "{test_web_password_not_match}"
And I click on "SignInButton"
Then I should see "Incorrect username or password." in "SignInErrorMessage"

Scenario: Sign In
When I set "SignInPasswordInput" value to "{test_web_password}"
And I click on "SignInButton"
Then "{environment.RIMP Web.URL}/on-boarding" URL should be displayed

Scenario: Sign Out
When I click on "TopBarLogOutButton"
Then "{environment.RIMP Web.URL}/auth/login?logout=true" URL should be displayed