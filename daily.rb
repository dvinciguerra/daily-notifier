# frozen_string_literal: true

require 'date'
require 'slack-notifier'

require_relative 'lib/greetings.rb'

date_now = DateTime.now
exit if date_now.sunday? || date_now.saturday?

DAILY_CHANNEL = ENV['DAILY_CHANNEL']
SLACK_WEBHOOK_URL = ENV['SLACK_WEBHOOK_URL']

unless DAILY_CHANNEL && SLACK_WEBHOOK_URL
  raise ArgumentError, 'The DAILY_CHANNEL or SLACK_WEBHOOK_URL env vars are undefined'
end

hello = "#{Greetings.good_something} #{Greetings.hi}"

message = "
#{hello}, é hora da daily!

Para entrar na meeting room da daily vocês podem acessar o link #{DAILY_CHANNEL}

Tenham uma ótima daily meeting. =)

@here
"

puts 'SENDING MESSAGE...'
puts message

notifier = Slack::Notifier.new(SLACK_WEBHOOK_URL)
notifier.ping(message)
