module BootstrapIcons
  class BootstrapIcon
    attr_reader :path, :options, :width, :height, :symbol

    def initialize(symbol, options = {})
      @symbol = symbol.to_s
      if bootstrap_icon = BootstrapIcons::BOOTSTRAP_ICONS_SYMBOLS[@symbol]
        
        @path = bootstrap_icon["path"]
        @width = bootstrap_icon["width"].to_i
        @height = bootstrap_icon["height"].to_i
        
        @options = options
        @options.merge!({
          class: classes,
          viewBox: bootstrap_icon["viewBox"],
          version: "1.1"
        })
        @options.merge!(size)
        @options.merge!(a11y)


      else
        raise "Couldn't find bootstrap icon symbol for #{@symbol.inspect}"
      end
    end

    # Returns an string representing a <svg> tag
    def to_svg
      "<svg #{html_attributes}>#{@path}</svg>"
    end

    private

    def html_attributes
      attrs = ""
      @options.each { |attr, value| attrs += "#{attr}=\"#{value}\" " }
      attrs.strip
    end

    # add some accessibility features to svg
    def a11y
      accessible = {}

      if @options[:"aria-label"].nil? && @options["aria-label"].nil?
        accessible[:"aria-hidden"] = "true"
      else
        accessible[:role] = "img"
      end

      accessible
    end

    # prepare the bootstrap_icon class
    def classes
      "bi bi-#{@symbol} #{@options[:class]} ".strip
    end

    # determine the height and width of the bootstrap_icon based on :size option
    def size
      size = {
        width:  @width,
        height: @height
      }

      # Specific size
      unless @options[:width].nil? && @options[:height].nil?
        size[:width]  = @options[:width].nil?  ? calculate_width(@options[:height]) : @options[:width]
        size[:height] = @options[:height].nil? ? calculate_height(@options[:width]) : @options[:height]
      end

      size
    end

    def calculate_width(height)
      (height.to_i * @width) / @height
    end

    def calculate_height(width)
      (width.to_i * @height) / @width
    end
  end
end
