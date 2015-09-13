module ApplicationHelper
  def card_support_text(txt)
    %Q(<div class="card_support meta color-text-blue">
        <div class="grid">
          <div class="left">
            <div class="logo mini"></div>
          </div>
          <div class="row-10-col">
            <div class="business-description">
              <strong>#{txt}</strong>
            </div>
          </div>
        </div>
      </div>).html_safe
  end
end
