$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bstree'

require 'minitest/spec'
require 'minitest/autorun'

def context(*args, &block)
  describe(*args, &block)
end
