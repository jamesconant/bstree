require "spec_helper"

describe Bstree::Node do
  describe "#remove" do
    context "when node is found with given value" do
      context "when node has no children" do
        it "removes node from tree" do
          tree = Bstree::Node.new 5
          tree.insert 2
          tree.insert 18
          tree.insert -4
          tree.insert 3

          tree.remove -4

          result = tree.search -4

          result.must_be_nil
        end

        it "returns true" do
          tree = Bstree::Node.new 5
          tree.insert 2
          tree.insert 18
          tree.insert -4
          tree.insert 3

          result = tree.remove -4

          result.must_equal true
        end
      end

      context "when node has one child" do
        it "removes node from tree" do
          tree = Bstree::Node.new 5
          tree.insert 2
          tree.insert 18
          tree.insert -4
          tree.insert 3
          tree.insert 21
          tree.insert 19
          tree.insert 25

          tree.remove 18

          result = tree.search 18

          result.must_be_nil
        end

        it "returns true" do
          tree = Bstree::Node.new 5
          tree.insert 2
          tree.insert 18
          tree.insert -4
          tree.insert 3
          tree.insert 21
          tree.insert 19
          tree.insert 25

          result = tree.remove 18

          result.must_equal true
        end

        it "links removed node's child to removed node's parent" do
          tree = Bstree::Node.new 5
          tree.insert 2
          tree.insert 18
          tree.insert -4
          tree.insert 3
          tree.insert 21
          tree.insert 19
          tree.insert 25

          tree.remove 18

          tree.right.val.must_equal 21
        end
      end

      context "when node has two children" do
        it "removes node from tree" do
          tree = Bstree::Node.new 5
          tree.insert 2
          tree.insert 12
          tree.insert -4
          tree.insert 3
          tree.insert 9
          tree.insert 21
          tree.insert 19
          tree.insert 25

          tree.remove 12

          result = tree.search 12

          result.must_be_nil
        end

        it "returns true" do
          tree = Bstree::Node.new 5
          tree.insert 2
          tree.insert 12
          tree.insert -4
          tree.insert 3
          tree.insert 9
          tree.insert 21
          tree.insert 19
          tree.insert 25

          result = tree.remove 12

          result.must_equal true
        end

        it "replaces 'removed' node val with minimum val of right sub-tree" do
          tree = Bstree::Node.new 5
          tree.insert 2
          tree.insert 12
          tree.insert -4
          tree.insert 3
          tree.insert 9
          tree.insert 21
          tree.insert 19
          tree.insert 25

          node = tree.search(12)

          tree.remove 12

          node.val.must_equal 19
        end
      end
    end

    context "when node is not found with given value" do
      it "returns false" do
        tree = Bstree::Node.new 5
        tree.insert 2
        tree.insert 18
        tree.insert -4
        tree.insert 3

        result = tree.remove 10

        result.must_equal false
      end
    end
  end
end
