# frozen_string_literal: true

require 'date'

module Greetings
  GOOD = {
    morning: 'Bom dia',
    afternoon: 'Boa tarde',
    night: 'Boa noite'
  }.freeze

  HI = %w[
    time turma galera
  ].freeze

  class << self
    def good_something
      date_now = DateTime.now

      return GOOD[:morning] if (6..11).include? date_now.hour
      return GOOD[:afternoon] if (12..17).include? date_now.hour
      return GOOD[:night] if (18..23).include? date_now.hour
    end

    def hi
      HI.sample
    end
  end
end
