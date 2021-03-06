require 'fileutils'
require 'tempfile'
require 'ostruct'
require 'tmpdir'
require 'pastel'
require 'yaml'

require 'tty-progressbar'
require 'tty-prompt'
require 'commander'

require 'pry'

module RedmineInstaller
  # Includes
  autoload :CLI, 'redmine-installer/cli'
  autoload :Task, 'redmine-installer/task'
  autoload :Install, 'redmine-installer/install'
  autoload :Utils, 'redmine-installer/utils'
  autoload :Logger, 'redmine-installer/logger'
  autoload :Modules, 'redmine-installer/modules'
  autoload :Environment, 'redmine-installer/environment'
  autoload :Redmine, 'redmine-installer/redmine'
  autoload :Package, 'redmine-installer/package'
  autoload :Database, 'redmine-installer/database'
  autoload :Configuration, 'redmine-installer/configuration'
  autoload :Upgrade, 'redmine-installer/upgrade'

  # Settings
  MIN_SUPPORTED_RUBY = '1.9.3'

  def self.logger
    @logger ||= RedmineInstaller::Logger.new
  end

  def self.pastel
    @pastel ||= Pastel.new
  end

  def self.print_logo
    puts <<-PRINT
                __      _
    _______ ___/ /_ _  (_)__  ___
   / __/ -_) _  /  ' \\/ / _ \\/ -_)
  /_/  \\__/\\_,_/_/_/_/_/_//_/\\__/


  Powered by EasyRedmine
    PRINT
  end
end


# Requirements
require 'redmine-installer/version'
require 'redmine-installer/errors'

# Patches
require 'redmine-installer/patches/tty'
require 'redmine-installer/patches/commander'


# Log any errors before exist
# Kernel.at_exit do
#   logger = RedmineInstaller.logger
#
#   if $!.nil?
#     logger.info 'Ends successfully'
#   else
#     # Is already logged
#     unless $!.is_a?(RedmineInstaller::Error)
#       logger.error $!.message
#       logger.error $!.backtrace
#     end
#   end
#
#   logger.close
# end
