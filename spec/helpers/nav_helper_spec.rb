require 'rails_helper'

describe NavHelper, type: :helper do
  describe '#nav/4' do
    before { @current_page = :root }

    it 'returns a button tag set with the given options' do
      nav = helper.nav(:root, 'aqua compass', title: 'Home')
      expect(nav).to include('<button name="button" type="submit"')
      expect(nav).to include('</button>')
      expect(nav_attr(nav, :class)).to eq 'btn btn-round btn-aqua btn-compass active'
      expect(nav_attr(nav, :onclick)).to eq "location.assign(&#39;/&#39;)"
      expect(nav_attr(nav, :title)).to eq 'Home'
    end

    it 'yields a block when given' do
      expect(
        helper.nav(:catamaran, 'blue boat', title: 'Find us') do
          content_tag(:span, 'Hi there!')
        end
      ).to include('Hi there!')
    end

    context 'when there is no @current_page' do
      before { @current_page = nil }

      it "doesn't include the 'active' class" do
        nav = helper.nav(:root, 'teal boat', title: 'Home')
        expect(nav_attr(nav, :class)).to eq 'btn btn-round btn-teal btn-boat'
      end
    end

    #
    # Helpers
    #

    def nav_attr(nav, attr)
      nav[%r!#{attr}="([a-z0-9\s&#;.()/-]+)"!i, 1]
    end
  end
end
