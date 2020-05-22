require "bootstrap_icons"
require "action_view"

module BootstrapIconsHelper
  include ActionView::Helpers::TagHelper

  def bootstrap_icon(symbol, options = {})
    return "" if symbol.nil?

    icon = BootstrapIcons::BootstrapIcon.new(symbol, options)
    content_tag(:svg, icon.path.html_safe, icon.options) # rubocop:disable Rails/OutputSafety
  end
end