require "java"
require "NCSO.jar"

require "dominus/database"

module Dominus

  def self.lotus
    Java::Lotus
  end

  java_import lotus.domino.NotesFactory

  class Client

    def self.connect_to(*args)
      self.new(NotesFactory.createSession(*args))
    end

    def self.connect_to_local
      self.connect_to
    end

    def self.cleanup(session)
      proc { session.recycle }
    end

    def initialize(session)
      @session = session
      ObjectSpace.define_finalizer(self, self.class.cleanup(session))
    end

    def find_database(database_name)
      Database.new(database_name, @session)
    end

  end

end