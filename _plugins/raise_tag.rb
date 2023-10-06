# frozen_string_literal: true

##
# Raises an error
class RaiseTag < Liquid::Tag
  def initialize(tag_name, msg, tokens)
    super
    @msg = msg
  end

  def render(context)
    bad_file = context.registers[:page]['path']
    err_msg = "While rendering #{bad_file}: #{@msg}"

    raise err_msg
  end
end

Liquid::Template.register_tag('raise', RaiseTag)
