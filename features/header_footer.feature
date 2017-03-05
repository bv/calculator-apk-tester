Feature: Changing header and footer when actions taken

    Scenario: As a Calculator user I can see greating in header
            # and the first result of ADD operation in footer
            # the result should be '1'
      When Calculator is launched and active
      Then I see the following elements
        | header              | Islam_Hamdy |
        | footer              | Sarah Osama |
      When I touch 'ADD'
      Then I see the following elements
        | header              | Bravo ya islam |
        | footer              | new number =1  |

    # the scenario FAILS because of the header not changing,
    # when SUB button is touched
    # I assume this can be big, but indeed the changing header,
    # as well as footer requires clarification regarding which
    # behaviour is correct
    Scenario: As a Calculator user I can see greating in header
            # and the first result of SUB operation in footer
            # the result should be '-1'
      When Calculator is launched and active
      Then I see the following elements
        | header              | Islam_Hamdy |
        | footer              | Sarah Osama |
      When I touch 'SUB'
      Then I see the following elements
        | header              | Bravo ya islam |
        | footer              | new number =-1  |
