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
    #
    class React < ActiveAdmin::Component
      class ReactComponentBuilder
        include ::React::Rails::ViewHelper
        include ActionView::Helpers::TagHelper
      end

      builder_method :react_component

      def to_s
        ReactComponentBuilder.new.react_component(*@args, &@block)
      end

      def build(*args, &block)
        @args = args
        @block = block
      end
    end
  end
end
