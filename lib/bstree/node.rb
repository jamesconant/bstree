module Bstree
  class Node
    attr_accessor :left, :parent, :right, :val

    def initialize(val, parent=nil)
      @val = val
      @parent = parent
      @left = nil
      @right = nil
    end

    def insert(new_val)
      if new_val > val
        if right
          right.insert(new_val)
        else
          @right = Bstree::Node.new(new_val, self)
        end
      elsif new_val < val
        if left
          left.insert(new_val)
        else
          @left = Bstree::Node.new(new_val, self)
        end
      end
    end

    def search(search_val)
      if val == search_val
        self
      else
        if search_val > val && right
          right.search(search_val)
        elsif search_val < val && left
          left.search(search_val)
        end
      end
    end

    def remove(rem_val)
      node = search(rem_val)

      if node
        if node.left && node.right
          swap_val = node.right.minimum_val
          node.right.remove(swap_val)
          node.val = swap_val
          true

        elsif node.left
          node.left.parent = node.parent
          node.parent.left = node.left
          true

        elsif node.right
          node.right.parent = node.parent
          node.parent.right = node.right
          true

        else
          if node.val > node.parent.val
            node.parent.right = nil
            true
          elsif node.val < node.parent.val
            node.parent.left = nil
            true
          end
        end
      else
        false
      end
    end

    def to_in_order_array(vals = [])
      if left
        left.to_in_order_array(vals)
      end

      vals << val

      if right
        right.to_in_order_array(vals)
      end

      vals
    end

    protected

    def minimum_val
      if left
        left.minimum_val
      else
        val
      end
    end
  end
end
