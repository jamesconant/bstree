require "spec_helper"

describe "#right" do
  context "when node has a right child" do
    it "returns the right child node" do
      tree = Bstree::Node.new(5)
      tree.insert(6)

      tree.right.must_be_kind_of Bstree::Node
      tree.right.val.must_equal 6
    end
  end

  context "when node has no right child" do
    it "returns nil" do
      tree = Bstree::Node.new(5)

      tree.right.must_be_nil
    end
  end
end
