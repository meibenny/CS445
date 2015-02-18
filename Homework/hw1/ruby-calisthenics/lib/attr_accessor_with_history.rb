class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s 
    attr_reader attr_name 
    attr_reader attr_name + "_history"
    attr_accessor :past
    class_eval %{
      # YO CODE HERE
      def #{attr_name}=(val)
        @past = #{attr_name}
        if @#{attr_name}_history.nil?
          @#{attr_name}_history = [nil]
        else
          @#{attr_name}_history.push(@past)
        end
        @#{attr_name} = val
      end
    }
  end
end

class Example
  attr_accessor_with_history :foo
  attr_accessor_with_history :bar
end

#start tests
a = Example.new 
puts a != nil

a = Example.new; a.foo = 2; a.foo = 3; a.foo = 4;
puts a.foo_history == [nil, 2, 3,]

a = Example.new; a.bar = "bar"; a.bar = 4; a.bar = "nil"; a.bar = 5;
puts a.bar_history == [nil, "bar", 4, "nil"]
puts a.foo_history == nil

a = Example.new; a.foo = "nil";
puts a.foo_history == [nil]
puts a.bar_history == nil
