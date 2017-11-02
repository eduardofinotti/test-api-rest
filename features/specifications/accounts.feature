@accounts
Feature: CRUD actions to manipulate accounts
In order to manipulate the accounts
As an user
I want to do the CRUD actions

Background:
  Given I am on the accounts api page

@inserting_a_account
Scenario: Inserting a new account
  When I insert a new account
  Then I receive the code "200"

@inserting_a_account_already_created
Scenario: Inserting a new account
  When I insert an account already created
  Then I receive the code "409" and the message "O e-mail informado, ja está cadastrado!"
