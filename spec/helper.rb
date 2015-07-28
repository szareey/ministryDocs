module Helper
  def get_txt(name)
    File.read(File.dirname(__FILE__) + "/fixtures/math/#{name}.txt")
  end
end
