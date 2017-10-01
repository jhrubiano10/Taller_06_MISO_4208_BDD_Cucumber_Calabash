Feature: Use Cases Transmilenio App

  Scenario: As a user I want to be able to open the help screen from the side menu the first time I open the app
    Given I press "Paraderos"
    #button to remove the splash screen
    When I swipe left
    #to open te menu
    And I press "Ayuda"
    Then I should see "Calcular ruta con horario"
    Then I wait for 2 seconds
  
  Scenario: As a user I want to plan my trip
    Given I press "Planear viaje"
    Then I press "Más"
    Then I touch the "Punto de origen" text
    Then I press "etSearch"
    Then I enter text "Portal Norte" into field with id "etSearch"
    Then I press "txtEstName"
    Then I touch the "Punto de destino" text
    Then I press "etSearch"
    Then I enter text "Universidades" into field with id "etSearch"
    Then I press "txtEstName"
    Then I press "btnOrigenDestino"
    Then I wait for 2 seconds
  
  Scenario: I want to calculate the value of my trip
    Given I wait for 5 seconds
    When I swipe left
    And I press "Calcular tarifa taxi"
    Then I press "editUnits"
    Then I enter "45" into input field number 1
    Then I wait for 2 seconds
    Then I press "cardDoor"
    Then I wait for 2 seconds
    Then I press "cardNight"
    Then I wait for 2 seconds
    Then I press "cardNight"
    Then I press "cardTerminal"
    Then I wait for 2 seconds
    Then I press "cardTerminal"
    Then I press "cardAirport"
    Then I wait for 2 seconds

  Scenario: I want to see information about my route
    Given I press "Rutas de buses"
    When I press "Portal El Dorado » Universidades"
    Then I wait for 2 seconds

  Scenario: As a user I want to find my Bus routes
    Given I press "Rutas de buses"
    When I press "Search"
    Then I enter text "Norte" into field with id "search_src_text"
    Then I press the enter button
    Then I wait for 5 seconds
  
  Scenario: As a user I want to search for my bus stops
    Given I press "Paraderos"
    When I press "Search"
    Then I enter text "Norte" into field with id "search_src_text"
    Then I press the enter button
    Then I wait for 2 seconds
  
  Scenario: As a user I want to know the recharge points of my trips
    Given I wait for 2 seconds
    Then I drag from 0:72 to 0:1626 moving with 2 steps
    Then I wait for 1 seconds
    When I press "Puntos de recarga"
    When I press "Search"
    Then I enter text "Chapinero" into field with id "search_src_text"
    Then I press the enter button
    Then I wait for 2 seconds