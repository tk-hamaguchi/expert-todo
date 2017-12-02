require 'rails_helper'

RSpec.describe 'layouts/application.html.haml', type: :view do
  let(:locals) { {} }
  before do
    stub_template 'layouts/_header.html.haml' => 'HEADER_CONTENTS'
    render template: 'layouts/application', locals: locals
  end

  it { expect(rendered).to have_selector 'title', visible: false }
  it { expect(rendered).to have_xpath '//head/meta[@name="viewport"][@content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, shrink-to-fit=no"]', visible: false }
  it { expect(rendered).to have_xpath '//head/meta[@http-equiv="Content-Type"][@content="text/html; charset=UTF-8"]', visible: false }
  it { expect(rendered).to have_xpath '//head/meta[@content="ie=edge"][@http-equiv="x-ua-compatible"]', visible: false }

  it { expect(rendered).to have_css 'link[rel="stylesheet"][media="all"][data-turbolinks-track="reload"][href^="/assets/application-"]', visible: false }
  it { expect(rendered).to have_css 'script[data-turbolinks-track="reload"][src^="/assets/application-"]', visible: false }

  it { expect(rendered).to have_xpath '//body', text: 'HEADER_CONTENTS' }

  context 'with locals' do
    context '{ header: false }' do
      let(:locals) { { header: false } }
      it { expect(rendered).to_not have_xpath '//body', text: 'HEADER_CONTENTS' }
    end

    context '{ header: true }' do
      let(:locals) { { header: true } }
      it { expect(rendered).to have_xpath '//body', text: 'HEADER_CONTENTS' }
    end
  end
end
