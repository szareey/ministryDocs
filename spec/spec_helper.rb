$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ministry_docs'
require File.expand_path('../helper.rb', __FILE__)

RSpec.configure do |c|
  c.include Helper
end
