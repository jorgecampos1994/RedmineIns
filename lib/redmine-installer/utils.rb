module RedmineInstaller
  module Utils

    PROGRESSBAR_FORMAT = ':elapsed [:bar] :percent'

    def class_name
      self.class.name.split('::').last
    end

    def logger
      RedmineInstaller.logger
    end

    def ok(title)
      print "#{title} ... "
      yield
      puts pastel.green('OK')
    rescue => e
      puts pastel.red('FAIL')
      raise
    end

    def prompt
      @prompt ||= TTY::Prompt.new
    end

    def pastel
      RedmineInstaller.pastel
    end

    def env_user
      ENV['USER'] || ENV['USERNAME']
    end

    # Try create a dir
    # When mkdir raise an error (permission problem) method ask user if wants exist or try again
    def create_dir(dir)
      FileUtils.mkdir_p(dir)
    rescue
      if prompt.yes?("Dir #{dir} doesn't exist and can't be created. Try again?", default: true)
        create_dir(dir)
      else
        error('Dir creating was aborted by user.')
      end
    end

    def print_title(title)
      puts
      puts
      puts pastel.white.on_black(title)
    end

    def error(message)
      raise RedmineInstaller::Error, message
    end

  end
end
