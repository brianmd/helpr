require 'spec_helper'

module TestHelp
  def test1
    'help for test1'
  end

  def test2
    'help for test2'
  end
end

describe Helpr::Helpr do
  let(:helper) { Helpr::Helpr.new }

  it 'accepts top help' do
    helper.top = 'top help'
    expect(helper.top).to eq('top help')
  end
end
