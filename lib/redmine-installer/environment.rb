module RedmineInstaller
  class Environment < Modules

    def check
      if user_is_root? && !task.options.enable_user_root
        error 'You cannot install redmine under root. Please change user.'
      end

      if Gem::Version.new(RUBY_VERSION) < Gem::Version.new(RedmineInstaller::MIN_SUPPORTED_RUBY)
        error "You are using unsupported ruby. Please install at least #{RedmineInstaller::MIN_SUPPORTED_RUBY}."
      end
    end

    def user_is_root?
      Process.euid == 0
    end

  end
end
