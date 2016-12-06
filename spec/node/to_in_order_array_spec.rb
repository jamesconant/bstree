require "spec_helper"

describe Bstree::Node do
  describe "#to_in_order_array" do
    it "returns array of vals in ascending order" do
      tree = Bstree::Node.new 5
      tree.insert 2
      tree.insert 18
      tree.insert -4
      tree.insert 3

      tree.to_in_order_array.must_equal [-4, 2, 3, 5, 18]
    end
  end
end
