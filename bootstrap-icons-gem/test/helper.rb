require "minitest/autorun"
require "bootstrap_icons"

def bootstrap_icon(symbol, options = {})
  ::BootstrapIcons::BootstrapIcon.new(symbol, options)
end
