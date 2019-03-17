@auth
Feature: Login Page

In order to easily access the app
As a hornetsecurity customer
I want to interact with the login page

    @positive @integration
    Scenario: See the Login Page
        Given that Corby has navigated to the login page
        Then he should see the login page header with value "Log in to the app!"
        And he should see the "Email" input field
        And he should see the "Continue" button
        And he should see "Problems logging in?" link
        And he should see the "Register" button

    @positive @integration
    Scenario: See the Login Page After Submitting a Valid Email Address
        Given that Corby has entered "valid@address.com" in the "Email" input of the login page
        When he clicks on the "Continue" button
        Then he should see the login page header with value "Log in to the app!"
        And he should see "Current Email Address" label with value "valid@address.com"
        And he should see the "Change Email Address" link
        And he should see the "Password" input field
        And he should see the "Log in" button
        And he should see "Problems logging in?" link
        And he should see the "Register" button
