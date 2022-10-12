class BackgroundJob < ApplicationJob
  queue_as :default

  def perform(count:)
    (1..count).each do |i|
      ActionCable.server.broadcast("SharedChannel", "Hello World #{i}")
      sleep 1
    end
  end
end
