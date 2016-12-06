require "spec_helper"

describe Bstree do
  describe "#search" do
    context "tree contains a node with given val" do
      it "returns node containing val" do
        tree = Bstree::Node.new(5)
        tree.insert(2)
        tree.insert(8)
        tree.insert(4)

        result = tree.search(4)

        result.must_be_kind_of Bstree::Node
        result.val.must_equal 4
      end
    end

    context "tree contains no node with given val" do
      it "returns false" do
        tree = Bstree::Node.new(5)
        tree.insert(2)
        tree.insert(8)
        tree.insert(4)

        result = tree.search(7)

        result.must_be_nil
      end
    end
  end
end
