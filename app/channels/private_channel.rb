class PrivateChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
    @job = PhantomjsCliJob.perform_later user_id: current_user.id
  end

  def receive(data)
    redis.publish channel, data.to_json
  end

  def unsubscribed
    Sidekiq::Status.delete job_id
  end

  private

  attr_accessor :job

  def redis
    @redis ||= Redis.new
  end

  def channel
    job.job_id
  end

  def job_id
    job.provider_job_id
  end
end
