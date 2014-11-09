module Byebug
  #
  # Reload source code to pick up latest changes.
  #
  class ReloadCommand < Command
    self.allow_in_control = true
    self.allow_in_post_mortem = false

    def regexp
      /^\s* r(?:eload)? \s*$/x
    end

    def execute
      Filecache.clear

      onoff = Setting[:autoreload] ? 'on' : 'off'
      puts pr('reload.messages.done', source_reloading: onoff)
    end

    class << self
      def names
        %w(reload)
      end

      def description
        %(r[eload]      Forces source code reloading.)
      end
    end
  end
end
