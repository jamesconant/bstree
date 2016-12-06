# Bstree

Yet another binary search tree implemented in ruby. _Yabstree_, however, just didn't have quite the right ring to it.

While this lib is currently implemented for with integers and floats in mind, any objects that implement comparability `<=>` (and are comparable) should just work.

Check out the wikipedia article on [binary search trees](https://en.wikipedia.org/wiki/Binary_search_tree) to learn more.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bstree'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bstree

## Usage

```ruby
require 'bstree'
=> true

# create a new tree, with the root value of 5
tree = Bstree::Node.new(5)
=> #<Bstree::Node:0x007f6747aeb888 @val=5, @parent=nil, @left=nil, @right=nil>

# insert a new value into the tree
tree.insert(3)
=> #<Bstree::Node:0x007f6747a434f8 @val=3, @parent=#<Bstree::Node:0x007f6747a9d7a0 @val=5, @parent=nil, @left=#<Bstree::Node:0x007f6747a434f8 ...>, @right=nil>, @left=nil, @right=nil>

# insert yet another new value into the tree
tree.insert(8)
=> #<Bstree::Node:0x007f6747a3d800 @val=8, @parent=#<Bstree::Node:0x007f6747a9d7a0 @val=5, @parent=nil, @left=#<Bstree::Node:0x007f6747a434f8 @val=3, @parent=#<Bstree::Node:0x007f6747a9d7a0 ...>, @left=nil, @right=nil>, @right=#<Bstree::Node:0x007f6747a3d800 ...>>, @left=nil, @right=nil>

# search tree for a value
tree.search(-2)
=> nil

# derp -- search tree for an ~existing~ value
tree.search(3)
=> #<Bstree::Node:0x007f6747a434f8 @val=3, @parent=#<Bstree::Node:0x007f6747a9d7a0 @val=5, @parent=nil, @left=#<Bstree::Node:0x007f6747a434f8 ...>, @right=#<Bstree::Node:0x007f6747a3d800 @val=8, @parent=#<Bstree::Node:0x007f6747a9d7a0 ...>, @left=nil, @right=nil>>, @left=nil, @right=nil>

# convert tree into an in-order array
tree.to_in_order_array
=> [3, 5, 8]

# remove a value from the tree
tree.remove(3)
=> true

# gaze smugly at the work of your cruel value removal.
=> [5, 8]
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jamesconant/bstree. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

