# frozen_string_literal: true

require 'date'
require 'slack-notifier'

require_relative 'lib/greetings.rb'

date_now = DateTime.now
exit if date_now.sunday? || date_now.saturday?

RETRO_CHANNEL = ENV['RETRO_CHANNEL']
SLACK_WEBHOOK_URL = ENV['SLACK_WEBHOOK_URL']

unless RETRO_CHANNEL && SLACK_WEBHOOK_URL
  raise 'The RETRO_CHANNEL and SLACK_WEBHOOK_URL env vars are undefined'
end

hello = "#{Greetings.good_something} #{Greetings.hi}"

message = "
#{hello}, :smiley:
Hoje é dia de ~maldade~ retrô meeting...

Para entrar na meeting room vocês podem acessar o link #{RETRO_CHANNEL}

Tenham uma ótima retrô meeting. =)
"

notifier = Slack::Notifier.new(SLACK_WEBHOOK_URL)
notifier.ping(message)
