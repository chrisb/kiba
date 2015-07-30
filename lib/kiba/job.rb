module Kiba
  module Job
    class << self
      def included(base)
        base.extend ClassMethods
        base.include Runner
        base.class_eval do
          @control = Control.new
        end
      end
    end

    def run(options = {})
      @options = options
      super control
    end

    module ClassMethods
      def assign(*names)
        # @dogs is bound to the EACH DogOwner subclass
        @dog_names = names
      end

      def dog_names
        # @dogs is bound to the EACH DogOwner subclass
        @dog_names
      end
    end
  end
end

# module Kiba
#   class Job
#     include Runner
#
#     def self.inherited(base)
#       base.extend ClassMethods
#       base.send :attr_accessor, :options
#       base.class_variable_set(:@@control, Control.new)
#     end
#
#     module ClassMethods
#       def control
#        class_variable_get(:@@control)
#       end
#
#       def pre_process(&block)
#         control.pre_processes << { block: block }
#       end
#
#       def source(klass, *initialization_params)
#         control.sources << { klass: klass, args: initialization_params }
#       end
#
#       def transform(klass = nil, *initialization_params, &block)
#         control.transforms << { klass: klass, args: initialization_params, block: block }
#       end
#
#       def destination(klass, *initialization_params)
#         control.destinations << { klass: klass, args: initialization_params }
#       end
#
#       def post_process(&block)
#         control.post_processes << { block: block }
#       end
#     end
#
#     def run(options = {})
#       @options = options
#       super control
#     end
#
#   end
# end
