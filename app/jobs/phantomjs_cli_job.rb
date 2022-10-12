class PhantomjsCliJob < ApplicationJob
  queue_as :default
  PHANTOMJS = '/usr/bin/phantomjs'

  def perform(user_id:)
    @user_id = user_id
    redis.subscribe(job_id) do |on|
      on.message do |channel, message|
        data = JSON.parse(message)

        # Open3.popen3(PHANTOMJS) do |stdin, stdout, stderr, wthr|
        #   stdin.write data['line']
        #   stdout.each_line do |line|
            PrivateChannel.broadcast_to user, data['line']
        #   end
        # end

      end
    end
  end

  private

  attr_accessor :user_id

  def user
    @user ||= AdminUser.find(user_id)
  end

  def redis
    @redis ||= Redis.new
  end
end
