Feature: Calculations by means of adding one and substructing one

    Scenario: As a Calculator user I can increase by one and
            # decrease by one current value
            # initial number is 0 which is not shown
      Given Calculator is launched and active
      
      When I touch 'ADD'
       And notice the result
       
       And I touch 'SUB'
       And notice the result

       And I touch 'SUB'
       And notice the result       

       And I touch 'ADD'
       And notice the result

      Then the noticed results should be
        | 1  |
        | 0  |
        | -1 |
        | 0  |
