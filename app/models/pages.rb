class Pages

  class Page < Struct.new(:name)
    def active?(page_name)
      name == page_name
    end
  end

  class << self
    def [](name)
      to_h[name]
    end

    def to_h
      all.each_with_object({}) { |page, result| result[page] = Page.new(page) }
    end

    def all
      %i[root catamaran gallery location charter]
    end
  end
end
