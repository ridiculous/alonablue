module NavHelper
  def nav_btn(name, classes, title: '')
    path = public_send("#{name}_path")
    css = 'btn btn-round'
    css << ' ' << classes.split(' ').m(:prepend, 'btn-').join(' ')
    css << ' active' if Pages[name].active?(@current_page)
    content_tag(:div, class: 'nav_btn col-2') do
      button_tag(class: css.squish, title: title, onclick: "location.assign('#{path}')") do
        content_tag(:span, class: 'visuallyhidden') do
          link_to title, path
        end
      end
    end
  end
end
