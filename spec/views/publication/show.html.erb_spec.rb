# sepc/views/publication/show.html.erb_spec.rb

require 'spec_helper'

describe 'publicaion/show.html.erb' do
    it 'displays publication details correctly' do
        assign(:publicaion, Publication.create(name: "xxx", abstract: 'abcde', keywords: 'kkkk'))
    render
    
    rendered.should contain('xxx')
    rendered.should contain('abcd')
    rendered.should contain('kkkk')
end
end

