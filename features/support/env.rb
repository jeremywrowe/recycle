require 'minitest/spec'
require 'fileutils'

class MinitestWorld
  include Minitest::Assertions
  attr_accessor :assertions

  def initialize
    self.assertions = 0
  end

  def root_dir
    File.expand_path('../../..', __FILE__)
  end

  def tmp_dir
    File.join(root_dir, 'tmp/test')
  end
end

World do
  MinitestWorld.new
end

After do
  FileUtils.rm_rf File.join(tmp_dir, '.recycle')
end
