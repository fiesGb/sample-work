@auth
Feature: Login Page

In order to access the app
As a hornetsecurity customer
I want to interact with the login page

    @positive @smoke @regression
    Scenario: Log In
        Given that Corby has entered "registered@user.com" as email on the login page
        When he submits "the-according-password" as password on the login page
        Then he should be redirected to the apps landing page


    @positive @integration
    Scenario: See the First Part of the Login Page
        Given that Corby has navigated to the login page
        Then he should see the login page header with value "Log in to the app!"
        And he should see the "Email" input field
        And he should see the "Continue" button
        And he should see "Problems logging in?" link
        And he should see the "Register" button


    @positive @integration
    Scenario: See the Second Part of the Login Page
        Given that Corby has entered "registered@user.com" as email on the login page
        When he clicks on the "Continue" button
        Then he should see the login page header with value "Log in to the app!"
        And he should see "Current Email Address" label with value "registered@user.com"
        And he should see the "Change Email Address" link
        And he should see the "Password" input field
        And he should see the "Log in" button
        And he should see "Problems logging in?" link
        And he should see the "Register" button


    @positive @regression
    Scenario: Change Email Address
        Given that Corby has clicked the "Change Email Address" link after submitting "registred@user.com" as email address
        When he submits "another-registered@user.com" as email address
        Then he should see "Current Email Address" label with value "another-registered@user.com"
        And he should see the "Password" input field


    @negative @regression
    Scenario Outline: Submit Wrong Password
        Given that Corby has submitted "registered@user.com" as email on the login page
        When he submits "<password>" as password on the login page
        Then he should see the "password" input field in error state with message "<message>"

        Examples:
            | password                          | message                                                   |
            |                                   | Please enter your password.                               |
            | wrong-password                    | The password you entered is not correct.                  |
            | !"§$%&/()=¡“¶¢[]|{}≠¿             | The password you entered is not correct.                  |
            | 0123456789                        | The password you entered is not correct.                  |
            | <a href="evil-page.com">hi</a>    | You sure you just tried to XSS a security companys app?   |


    @positive @regression
    Scenario: Use "Change Email Address" Link
        Given that Corby has submitted "registered@user.com" as email on the login page
        When he clicks the "Change Email Address" link
        Then he should see the "Email" input field with value ""


    @negative @integration
    Scenario Outline: Submit Invalid or Unregistered Email Address
        Given that Corby has entered "<email>" in the "Email" input of the login page
        When he clicks on the "Continue" button
        Then he should see the "Email" input in error state with message "<message>"

        Examples:
            | email                         | message                                                   |
            |                               | Please enter your email address.                          |
            | registered                    | Invalid email. Please enter a valid email address.        |
            | registered@user               | Invalid email. Please enter a valid email address.        |
            | registered @user.com          | Invalid email. Please enter a valid email address.        |
            | registered@user .com          | Invalid email. Please enter a valid email address.        |
            | !"§$%&/()=¡“¶¢[]|{}≠¿         | Invalid email. Please enter a valid email address.        |
            | 0123456789                    | Invalid email. Please enter a valid email address.        |
            | <a href="evil-page.com">hi</a>| You sure you just tried to XSS a security companys app?   |
            | unregistered@user.com         | Your email address is not registered.                     |
