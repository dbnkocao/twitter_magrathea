require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '10s' do
  Tweet.sync_twitter
end