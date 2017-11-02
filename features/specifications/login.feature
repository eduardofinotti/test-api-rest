@login
Feature: Acess the API

@invalid_json
Scenario: Login as an user inserting an invalid json
  Given I am on the books api token page
  When I inform the wrong login data
  Then I receive the code "400" and the message "JSON Inválido"

@invalid_email
Scenario: Login as an user inserting an invalid email
  Given I am on the books api token page
  When I inform an invalid email
  Then I receive the code "409" and the message "Usuário e/ou senha inválidos."

@valid_email
Scenario: Login as an user inserting an valid email
  Given I am on the books api token page
  When I inform a valid email
  Then I receive the my access token
