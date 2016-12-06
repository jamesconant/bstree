require "spec_helper"

describe Bstree::Node do
  describe "#insert" do
    context "when inserted value is less than node's value" do
      context "and when node has left child" do
        context "and when inserted value is less than left child" do
          it "sets the left child's left child value to the inserted value" do
            tree = Bstree::Node.new(5)
            tree.insert(3)
            tree.insert(2)

            tree.right.must_be_nil
            tree.left.val.must_equal 3
            tree.left.left.val.must_equal 2
            tree.left.right.must_be_nil
          end
        end

        context "and when inserted value is greater than left child" do
          it "sets the left child's right child value to the inserted value" do
            tree = Bstree::Node.new(5)
            tree.insert(3)
            tree.insert(4)

            tree.right.must_be_nil
            tree.left.val.must_equal 3
            tree.left.left.must_be_nil
            tree.left.right.val.must_equal 4
          end
        end
      end

      context "and when node has no left child" do
        it "sets the left child value to the inserted value" do
          tree = Bstree::Node.new(5)
          tree.insert(3)

          tree.right.must_be_nil
          tree.left.val.must_equal 3
          tree.left.left.must_be_nil
          tree.left.right.must_be_nil
        end
      end
    end

    context "when inserted value is greater than node's value" do
      context "and when node has right child" do
        context "and when inserted value is less than right child" do
          it "sets the right child's left child value to the inserted value" do
            tree = Bstree::Node.new(5)
            tree.insert(8)
            tree.insert(7)

            tree.right.val.must_equal 8
            tree.left.must_be_nil
            tree.right.left.val.must_equal 7
            tree.right.right.must_be_nil
          end
        end

        context "and when inserted value is greater than right child" do
          it "sets the right child's right child value to the inserted value" do
            tree = Bstree::Node.new(5)
            tree.insert(8)
            tree.insert(9)

            tree.right.val.must_equal 8
            tree.left.must_be_nil
            tree.right.left.must_be_nil
            tree.right.right.val.must_equal 9
          end
        end
      end

      context "and when node has no right child" do
        it "sets the right child value to the inserted value" do
          tree = Bstree::Node.new(5)
          tree.insert(8)

          tree.right.val.must_equal 8
          tree.left.must_be_nil
          tree.right.left.must_be_nil
          tree.right.right.must_be_nil
        end
      end
    end
  end
end

