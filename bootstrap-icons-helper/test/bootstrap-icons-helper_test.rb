require_relative "./helper"

describe BootstrapIconsHelper do
  describe "rendering" do
    it "renders nothing when no symbol is passed in" do
      assert_equal "", bootstrap_icon(nil)
    end

    it "renders the svg" do
      assert_match /<svg.*bi-x.*>.*<\/svg>/, bootstrap_icon("x")
    end

    it "has a path" do
      assert_match /<path/, bootstrap_icon("exclamation")
    end

    it "adds html attributes to output" do
      assert_match /foo="bar"/, bootstrap_icon("exclamation", foo: "bar")
    end
  end
end
