module BootstrapIcons
  class BootstrapIcon
    attr_reader :path, :options, :width, :height, :fill, :viewBox, :symbol

    def initialize(symbol, options = {})
      @symbol = symbol.to_s
      @options = options
      @bootstrap_icon = find_bootstrap_icon        
      @path = bootstrap_icon["path"]
      @width = bootstrap_icon["width"].to_i
      @height = bootstrap_icon["height"].to_i
      @fill = bootstrap_icon["fill"]
      @viewBox = bootstrap_icon["viewBox"]
      
      prepare_icon_options
    end

    # Returns an string representing a <svg> tag
    def to_svg
      "<svg #{html_attributes}>#{path}</svg>"
    end

    private

    attr_reader :bootstrap_icon

    def html_attributes
      attrs = ""
      options.each { |attr, value| attrs += "#{attr}=\"#{value}\" " }
      attrs.strip
    end

    def find_bootstrap_icon
      icon = BootstrapIcons::BOOTSTRAP_ICONS_SYMBOLS[symbol]
      raise_icon_not_found if icon.nil?

      icon
    end

    def raise_icon_not_found
      raise "Couldn't find bootstrap icon symbol for #{symbol.inspect}"
    end

    def prepare_icon_options
      options.merge!({
        class: classes,
        viewBox: viewBox,
        fill: fill_with,
        version: "1.1"
      })
      options.merge!(size)
      options.merge!(a11y)
    end

    # add some accessibility features to svg
    def a11y
      accessible = {}

      if options[:"aria-label"].nil? && options["aria-label"].nil?
        accessible[:"aria-hidden"] = "true"
      else
        accessible[:role] = "img"
      end

      accessible
    end

    # prepare the bootstrap_icon class
    def classes
      "bi bi-#{symbol} #{options[:class]} ".strip
    end

    def fill_with
      fill_option = options[:fill]
      fill_option.nil? ? fill : fill_option
    end

    # determine the height and width of the bootstrap_icon based on :size option
    def size
      size = {
        width:  width,
        height: height
      }

      # Specific size
      if custom_size_option_provided?
        size[:width]  = options.has_key?(:width) ? options[:width] : calculate_width(options[:height])
        size[:height] = options.has_key?(:height) ? options[:height] : calculate_height(options[:width])
      end

      size[:width] = size[:width].to_s + "em"
      size[:height] = size[:height].to_s + "em"
      size
    end

    def custom_size_option_provided?
      options.has_key?(:width) || options.has_key?(:height)
    end

    def calculate_width(custom_height)
      (custom_height.to_i * width) / height
    end

    def calculate_height(custom_width)
      (custom_width.to_i * height) / width
    end
  end
end
