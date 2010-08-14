module WpxmlParser
  class Entity
    def initialize(entity)
      @entity = entity
    end

    def method_missing(meth, *args, &blk)
      if self.class.method_element_map.keys.include?(meth)
        if (public_methods - Object.public_methods).include?("process_#{meth}")
          send("process_#{meth}", @entity.xpath(self.class.method_element_map[meth]).first.content)
        else
          @entity.xpath(self.class.method_element_map[meth]).first.content
        end
      else
        super
      end
    end
  end
end