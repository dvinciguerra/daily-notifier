# frozen_string_literal: true

require 'date'
require 'slack-notifier'

date_now = DateTime.now
exit if date_now.sunday? || date_now.saturday?

DAILY_CHANNEL = ENV['DAILY_CHANNEL']
SLACK_WEBHOOK_URL = ENV['SLACK_WEBHOOK_URL']

unless DAILY_CHANNEL && SLACK_WEBHOOK_URL
  raise 'The DAILY_CHANNEL and SLACK_WEBHOOK_URL env vars are undefined'
end

message = "
Bom dia time, é hora da daily!
Para entrar na meeting room da daily vocês podem acessar o link #{DAILY_CHANNEL}

Tenham uma ótima daily meeting. =)
"

notifier = Slack::Notifier.new(SLACK_WEBHOOK_URL)
notifier.ping(message)
