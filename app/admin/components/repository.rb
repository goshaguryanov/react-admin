module Admin
  module Components
    # Defines a `react_component` arbre component. It allows
    # to include react components into Active Admin using react-rails.
    #
    # @example
    #
    # show do
    #   panel do
    #     react_component 'Post', { title: 'My post' }
    #   end
    # end
    #Repository
    class Repository < React
      ReactComponent = 'Repository'

      builder_method :repository

      def to_s
        ReactComponentBuilder.new.react_component(*@args, &@block)
      end

      # def build(*args, &block)
      def build(*args, &block)
        @args = args.unshift ReactComponent
        @block = block
      end
    end
  end
end
