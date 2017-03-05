# all the scenarios in this feature FAIL because the counter gets
# underflows and overflows for Interger minimum and maximum values
Feature: Calculator properly handles underflows and overflows

    Scenario: As a Calculator user I want to experience no underflows
			# when the count reaches small enough value
    		# Calculator should continue producing less by one numbers 
      Given Calculator is launched and active
        And the count is the minimum value of Integer
      
      When I touch 'SUB'
       And notice the result

      Then the result is 1 less than the pre-set up value

    Scenario: As a Calcultor user I want to experience no overflows
    		# when the count reaches big enough value
    		# Calculator should continue producing bigger by one numbers
      Given Calculator is launched and active
        And the count is the maximum value of Integer
      
      When I touch 'ADD'
       And notice the result

      Then the result is 1 more than the pre-set up value
