require_relative "./helper"

describe BootstrapIcons::BootstrapIcon do
  it "fails when the bootsrap icon doesn't exist" do
    assert_raises(RuntimeError) do
      bootstrap_icon("bootstrap_icon")
    end
  end

  it "initialize accepts a string for an icon" do
    icon = bootstrap_icon("x")
    assert icon
  end

  it "initialize accepts a symbol for an icon" do
    icon = bootstrap_icon(:x)
    assert icon
  end

  it "the attributes are readable" do
    icon = bootstrap_icon("x")
    assert icon.path
    assert icon.options
    assert_equal "x", icon.symbol
    assert_equal 1, icon.width
    assert_equal 1, icon.height
  end

  describe "viewBox" do
    it "always has a viewBox" do
      icon = bootstrap_icon("x")
      assert_includes icon.to_svg, "viewBox=\"0 0 16 16\""
    end
  end

  describe "html_attributes" do
    it "includes other html attributes" do
      icon = bootstrap_icon("x", foo: "bar", disabled: "true")
      assert_includes icon.to_svg, "disabled=\"true\""
      assert_includes icon.to_svg, "foo=\"bar\""
    end
  end

  describe "classes" do
    it "includes classes passed in" do
      icon = bootstrap_icon("x", class: "text-closed")
      assert_includes icon.to_svg, "class=\"bi bi-x text-closed\""
    end
  end

  describe "size" do
    it "always has width and height" do
      icon = bootstrap_icon("x")
      assert_includes icon.to_svg, "height=\"1\""
      assert_includes icon.to_svg, "width=\"1\""
    end

    it "converts number string height to integer" do
      icon = bootstrap_icon("x", height: "60")
      assert_includes icon.to_svg, "height=\"60\""
      assert_includes icon.to_svg, "width=\"60\""
    end

    it "converts number height to integer" do
      icon = bootstrap_icon("x", height: 60)
      assert_includes icon.to_svg, "height=\"60\""
      assert_includes icon.to_svg, "width=\"60\""
    end

    it "converts number string width to integer" do
      icon = bootstrap_icon("x", width: "45")
      assert_includes icon.to_svg, "height=\"45\""
      assert_includes icon.to_svg, "width=\"45\""
    end

    it "converts number width to integer" do
      icon = bootstrap_icon("x", width: 45)
      assert_includes icon.to_svg, "height=\"45\""
      assert_includes icon.to_svg, "width=\"45\""
    end

    it "with height and width passed in" do
      icon = bootstrap_icon("x", width: 60, height: 60)
      assert_includes icon.to_svg, "width=\"60\""
      assert_includes icon.to_svg, "height=\"60\""
    end
  end

  describe "a11y" do
    it "includes attributes for symbol keys" do
      icon = bootstrap_icon("x", "aria-label": "Close")
      assert_includes icon.to_svg, "role=\"img\""
      assert_includes icon.to_svg, "aria-label=\"Close\""
      refute_includes icon.to_svg, "aria-hidden"
    end

    it "includes attributes for string keys" do
      icon = bootstrap_icon("x", "aria-label" => "Close")
      assert_includes icon.to_svg, "role=\"img\""
      assert_includes icon.to_svg, "aria-label=\"Close\""
      refute_includes icon.to_svg, "aria-hidden"
    end

    it "has aria-hidden when no label is passed in" do
      icon = bootstrap_icon("x")
      assert_includes icon.to_svg, "aria-hidden=\"true\""
    end
  end
end
