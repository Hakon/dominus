require "dominus/document_collection"

module Dominus
  class Database < SimpleDelegator

    attr_reader :database

    def initialize(database_name, session)
      @session = session
      super(session.getDatabase("", database_name))
      ObjectSpace.define_finalizer(self, proc { __getobj__.recycle })
    end

    def documents
      document_collection_source.call(self.all_documents, @session)
    end

    def where(a, b = nil)
      if(b)
        document_collection_source.call(self.search("#{a} = \"#{b}\""))
      else
        document_collection_source.call(self.search(a))
      end
    end

    private

    def document_collection_source
      DocumentCollection.public_method(:new)
    end 
    
  end
end