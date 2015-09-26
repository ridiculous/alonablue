require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe '#page_title' do
    context 'when @page_title is set' do
      before { @page_title = 'Contact Us' }

      it 'returns the title using the @page_title' do
        expect(helper.page_title).to eq 'Contact Us | Alona Blue Sailing Charters'
      end
    end

    context 'when @page_title is nil' do
      before { @page_title = nil }

      it 'returns the default title for the page' do
        expect(helper.page_title).to eq 'Alona Blue Sailing Charters'
      end
    end
  end
end
