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

  def page_title
    "#{@page_title} | Alona Blue Sailing Charters".sub(/^[|\s]*/, '')
  end

  def google_analytics_script
    %Q^
      <script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-68150774-1', 'auto');ga('send', 'pageview');</script>
    ^.html_safe
  end
end
