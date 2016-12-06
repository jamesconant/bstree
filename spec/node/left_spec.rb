require "spec_helper"

describe "#left" do
  context "when node has a left child" do
    it "returns the left child node" do
      tree = Bstree::Node.new(5)
      tree.insert(4)

      tree.left.must_be_kind_of Bstree::Node
      tree.left.val.must_equal 4
    end
  end

  context "when node has no left child" do
    it "returns nil" do
      tree = Bstree::Node.new(5)

      tree.left.must_be_nil
    end
  end
end
