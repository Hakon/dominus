require "dominus/document"
module Dominus
  class DocumentCollection
    include Enumerable
    attr_reader :documents

    def self.cleanup(collection)
      proc { collection.recycle }
    end

    def initialize(collection)
      @collection = collection

      ObjectSpace.define_finalizer(self, self.class.cleanup(collection))
    end

    def each
      doc = all.getFirstDocument

      while doc
        yield Document.new(doc)
        doc = all.getNextDocument
      end

    end

    def all
      @collection
    end

    def count
      @count ||= all.count
    end

  end
end