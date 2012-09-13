require "dominus/item"
module Dominus
  class Document < SimpleDelegator

    def self.cleanup(doc)
      proc { doc.recycle }
    end

    def initialize(doc)
      super(doc)
      ObjectSpace.define_finalizer(self, self.class.cleanup(doc))
    end
    
    def [](key)
      values = get_item_value(key)
      if(values.length < 2)
        values.first
      else
        values.to_a
      end
    end

    def items
      @items ||= super.each_with_object({}) do |item, hash|
        hash[item.name] = item.values.to_a
        #ObjectSpace.define_finalizer(item, Item.cleanup(item))
        item.recycle
      end
    end

  end
end