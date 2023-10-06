# frozen_string_literal: true

##
# Liquid filters for links etc
module LinkFilters
  def link(target, label = target.title)
    <<~HTML
      <a href="#{target.url}">#{label}</a>
    HTML
  end

  def link_with_id(target, raw_id, label = target.title)
    id = Jekyll::Utils.slugify(raw_id)

    <<~HTML
      <a href="#{target.url}" id="#{id}">#{label}</a>
    HTML
  end

  def id_wrap(value, raw_id)
    id = Jekyll::Utils.slugify(raw_id)

    # TODO: add anchor links
    # this_url = @context.registers[:page]['url']
    # target = "#{this_url}##{id}"

    <<~HTML
      <span id="#{id}">#{value}</span>
    HTML
  end

  def link_to_fragment(target, raw_id, label = target.title)
    id = Jekyll::Utils.slugify(raw_id)

    link_target = "#{target.url}##{id}"

    <<~HTML
      <a href="#{link_target}">#{label}</a>
    HTML
  end

  def link_to_fragment_with_id(
    target, raw_target_id, raw_self_id, label = target.title
  )
    self_id = Jekyll::Utils.slugify(raw_self_id)
    target_id = Jekyll::Utils.slugify(raw_target_id)

    link_target = "#{target.url}##{target_id}"

    <<~HTML
      <a href="#{link_target}" id="#{self_id}">#{label}</a>
    HTML
  end
end

Liquid::Template.register_filter(LinkFilters)
