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

  def nav_btn(name, classes, title: '')
    path = public_send("#{name}_path")
    css = 'btn btn-round'
    css << ' ' << classes.split(' ').m(:prepend, 'btn-').join(' ')
    css << ' active' if PAGES[name].active?(@current_page)
    content_tag(:div, class: 'nav_btn col-2') do
      button_tag(class: css.squish, title: title, onclick: "location.assign('#{path}')") do
        content_tag(:span, class: 'visuallyhidden') do
          link_to title, path
        end
      end
    end
  end
end
