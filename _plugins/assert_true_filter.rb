# frozen_string_literal: true

##
# Liquid filter for assertions
module AssertTrue
  def assert_true(value, msg)
    bad_file = @context.registers[:page]['path']
    err_msg = "While rendering #{bad_file}: #{msg}"
    raise err_msg unless value

    value
  end
end

Liquid::Template.register_filter(AssertTrue)
