require 'calabash-android/abase'

class CalculatorView < Calabash::ABase
  def initialize(a_world=self.world)
    super a_world

    @elements = {
      title: "android.widget.TextView id:'title'",
      header: "android.widget.TextView id:'tv1'",
      adding_button: "android.widget.Button id:'add_b'",
      substruction_button: "android.widget.Button id:'sub_b'",
      footer: "android.widget.TextView id:'tv2'",
      set_max_button: "android.widget.Button id:'setup_max'",
      set_min_button: "android.widget.Button id:'setup_min'"
    }

    @result_prefix = 'new number ='
  end

  def trait
    @elements[:title]
  end

  def get_title
    query(@elements[:title], :text).first
  end

  def get_header_text
    query(@elements[:header], :text).first
  end

  def get_add_button_caption
    query(@elements[:adding_button], :text).first
  end

  def touch_add
    touch @elements[:adding_button]
  end

  def get_sub_button_caption
    query(@elements[:substruction_button], :text).first
  end

  def touch_sub
    touch @elements[:substruction_button]
  end

  def get_footer_text
    query(@elements[:footer], :text).first
  end

  def get_result
    get_footer_text().delete @result_prefix
  end

  def touch_set_max
    touch @elements[:set_max_button]
  end

  def touch_set_min
    touch @elements[:set_min_button]
  end
end
