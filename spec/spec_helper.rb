$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'ministry_docs'
require 'vcr'

module Helper
  def get_txt(name, type='math_2007')
    File.read(File.dirname(__FILE__) + "/fixtures/#{type}/#{name}.txt")
  end
end
RSpec.configure do |c|
  c.include Helper
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
