require_relative "./helper"

describe BootstrapIcons do
  it "loads all icons on initialization" do
    refute_equal 0, BootstrapIcons::BOOTSTRAP_ICONS_SYMBOLS.length
    x_icon = BootstrapIcons::BOOTSTRAP_ICONS_SYMBOLS["x"]
    assert x_icon["path"]
    assert x_icon["height"]
    assert x_icon["width"]
    assert x_icon["fill"]
    assert x_icon["viewBox"]
  end
end
