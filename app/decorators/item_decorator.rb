class ItemDecorator < Draper::Decorator
  delegate_all
  include Items
end
