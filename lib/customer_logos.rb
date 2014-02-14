require "rubygems"
require "oily_png"

class CustomerLogo
  def initialize(filename, width, height)
    @filename = filename
    @width = width
    @height = height
  end

  def self.create_all
    Dir["./customers/*.png"].each do |image_path|
      puts "handling #{image_path}"
      image_path = Pathname.new(image_path)
      logo = CustomerLogo.new(image_path, 150, 80)
      logo.transform
      logo.save
    end
  end

  def transform
    get
    scale
    grayscale
  end

  def get
    @image = ChunkyPNG::Canvas.from_file(@filename)
  end

  def grayscale
    @image.grayscale!
  end

  def scale
    # new width if height is transformed
    height = @image.height.to_f / @image.width * @width
    if height <= @height
      # it fits, let's resize
      width = @width
    else
      # ouch, the other way round then
      width = @image.width.to_f / @image.height * @height
      height = @height
    end

    @image = @image.resample_bilinear(width, height)
  end

  def save
    destination = "./source/images/customers/#{@filename.basename}"
    puts "writing #{destination}"
    @image.save(destination)
  end

  def web_path
    "/images/logos/#{File.basename(@filename)}.png"
  end
end

CustomerLogo.create_all
