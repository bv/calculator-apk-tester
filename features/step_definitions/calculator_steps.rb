require 'calabash-android/calabash_steps'

Given (/^Calculator is launched and active$/) do
  puts "Currently active application: #{current_activity}"
  @calculator = page(CalculatorView).await()
end

Then(/^I see the following elements$/) do |table|
  actual_elements = {
    'title' => @calculator.get_title,
    'header' => @calculator.get_header_text,
    'adding_button' => @calculator.get_add_button_caption,
    'substruction_button' => @calculator.get_sub_button_caption,
    'footer' => @calculator.get_footer_text
  }
  expected_elements = table.rows_hash

  not_matching_elements = expected_elements.keys.map{ |element|
    {
      element => {
        expected:(expected_elements[element]),
        actual:(actual_elements[element]),
        ok:(
            expected_elements[element].eql?(actual_elements[element])
        )
      }
    }
  }.delete_if{ |validation_record|
    validation_record.values.first[:ok]
  }

  assert_empty(
    not_matching_elements,
    'There are mismatched elements on Calculator view'
  )
end

When(/^I touch '(ADD|SUB)'$/) do |button|
  @calculator.touch_add if button.eql?('ADD')
  @calculator.touch_sub if button.eql?('SUB')
end

When(/^notice the result$/) do
  @results ||= []
  @results << @calculator.get_result
end

Then(/^the noticed results should be$/) do |table|
  expected_results_list = table.raw.flatten
  actual_results_list = @results
  assert_equal(
    expected_results_list, 
    actual_results_list,
    "The secuential results of calculations are not correct")
end

Given(/^the count is the (minimum|maximum) value of Integer$/) do |min_max|
  @calculator.touch_set_min if min_max.eql?('minimum')
  @calculator.touch_set_max if min_max.eql?('maximum')
  @set_up_value = @calculator.get_result
  puts "The value set is: #{@calculator.get_result}"
end

Then(/^the result is (\d+) (less|more) than the pre\-set up value$/) do |diff, direction|
  number_before_operation = @set_up_value.to_integer nil
  number_after_operation = @results.first.to_integer nil
  
  assert_equal(
    number_before_operation + diff.to_integer(nil),
    number_after_operation) if direction.eql?('more')

  assert_equal(
    number_before_operation - diff.to_integer(nil),
    number_after_operation) if direction.eql?('less')
end
