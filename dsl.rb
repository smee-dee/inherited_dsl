module DSL
  def self.included(base)
    base.class_eval do
      # This is the trick!
      # ==================
      # We catch the inheritance and propagate the @dsl_items variable
      # from the super class to the subclass.
      #
      # inside this method:
      #   self is the super class (ApplicationController)
      #   inherited_class is the inherited class (ConcreteController)
      def self.inherited(inherited_class)
        inherited_class.instance_variable_set(:@dsl_items, dsl_items)
      end

      def self.dsl(&block)
        dsl_items.instance_eval(&block)
      end

      def self.dsl_items
        @dsl_items ||= Items.new
      end

      def dsl_item_values
        self.class.dsl_items.values
      end
    end
  end

  class Items
    attr_reader :values

    def initialize
      @values = []
    end

    def add(value)
      @values << value
    end
  end
end
