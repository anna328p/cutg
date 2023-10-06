# frozen_string_literal: true

##
# Links to something
class LinkTo < Liquid::Tag
  def initialize(tag_name, target, tokens)
    super
    @target = target.strip
  end

  def render(context)
    target = context[@target]

    <<~HTML
      <a href="#{target.url}">#{target.title}</a>
    HTML
  end
end

Liquid::Template.register_tag('link_to', LinkTo)
