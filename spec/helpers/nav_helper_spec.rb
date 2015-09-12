require 'rails_helper'

describe NavHelper, type: :helper do
  describe '#nav_btn/4' do
    before { @current_page = :root }

    it 'returns a button tag set with the given options' do
      nav_btn = helper.nav_btn(:root, 'aqua compass', title: 'Home')
      expect(nav_btn).to include('<button name="button" type="submit"')
      expect(nav_btn).to include('</button>')
      expect(nav_attr(nav_btn, :class)).to eq 'btn btn-round btn-aqua btn-compass active'
      expect(nav_attr(nav_btn, :onclick)).to eq "location.assign(&#39;/&#39;)"
      expect(nav_attr(nav_btn, :title)).to eq 'Home'
    end

    context 'when there is no @current_page' do
      before { @current_page = nil }

      it "doesn't include the 'active' class" do
        nav_btn = helper.nav_btn(:root, 'teal boat', title: 'Home')
        expect(nav_attr(nav_btn, :class)).to eq 'btn btn-round btn-teal btn-boat'
      end
    end

    #
    # Helpers
    #

    def nav_attr(nav_btn, attr)
      nav_btn[%r!#{attr}="([a-z0-9\s&#;.()/-]+)"!i, 1]
    end
  end
end
