Feature: Register a new user into losestudiantes
    As a user I want to create an account on losestudiantes.com

Scenario Outline: Create a new account

  Given I go to losestudiantes home screen
    When I open the login screen
    And I fill with my <name>, <lastname>, <email>, selected a <department>, fill my <password> and accept the <terms> and conditions
    And I try to register
    Then I expect do not see the errors : <error_email>, <error_password> and <error_terms>

    Examples:
      | name            | lastname  | email                         | department | password      | terms  | error_email              | error_password                                  | error_terms |
      |                 |           |                               |            |               |        | Ingresa tu correo        | Ingresa una contraseña                          | Debes aceptar los términos y condiciones |
      | Jorge           | Rubiano   | wrongemail                    |            |               |        | Ingresa un correo valido | Ingresa una contraseña                          | Debes aceptar los términos y condiciones |
      | Jorge           | Rubiano   | jh.rubiano10@uniandes.edu.co  |            |               |        |                          | Ingresa una contraseña                          | Debes aceptar los términos y condiciones |
      | Jorge           | Rubiano   | jh.rubiano10@uniandes.edu.co  |            | 1234          |        |                          | La contraseña debe ser al menos de 8 caracteres | Debes aceptar los términos y condiciones |
      | Jorge           | Rubiano   | jh.rubiano10@uniandes.edu.co  |     3      | T3st3r123456  |   1    |                          |                                                 |                                          |