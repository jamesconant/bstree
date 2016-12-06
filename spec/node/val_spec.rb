require "spec_helper"

describe "#val" do
  context "when node has val set" do
    it "returns the node's val" do
      tree = Bstree::Node.new(5)

      tree.val.must_equal 5
    end
  end

  context "when node has no val set" do
    it "returns nil" do
      tree = Bstree::Node.new(nil)

      tree.val.must_equal nil
    end
  end
end
