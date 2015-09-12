module NavHelper
  class Page < Struct.new(:name)
    def active?(page_name)
      name == page_name
    end
  end

  class NullPage
    def active?
      false
    end
  end

  PAGES = Hash.new NullPage
  %i[root catamaran gallery location contact].each { |page| PAGES[page] = Page.new(page) }

  def nav(name, classes, title: '', &block)
    path = public_send("#{name}_path")
    css = 'btn btn-round'
    css << ' ' << classes.split(' ').m(:prepend, 'btn-').join(' ')
    css << ' active' if PAGES[name].active?(@current_page)
    button_tag(class: css.squish, title: title, onclick: "location.assign('#{path}')", &block)
  end
end
