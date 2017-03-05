Feature: Starting Calculator application

  Scenario: As a Calculator user I can see initial view, on Calculator launch
    When Calculator is launched and active
    Then I see the following elements
        | title               | Calculator  |
        | header              | Islam_Hamdy |
        | adding_button       | ADD         |
        | substruction_button | SUB         |
        | footer              | Sarah Osama |
