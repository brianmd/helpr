require_relative 'spec_helper'

module TestHelp
  def top
    'help on test topic'
  end

  def test1
    'help for test1'
  end

  def test2
    'help for test2'
  end
end

describe Helpr::Help do
  let(:help) { Helpr::Help.new }

  it 'accepts top help' do
    help.top = 'top help'
    expect(help.top).to eq('top help')
  end

  xit 'is the dream' do
    help.add TestModule
    expect(help.topics).to eq('test')
    expect(help['test']).to eq('help for test topic')
    expect(help['test test2']).to eq('help on test2')
    expect(help['']).to eq("top help\n\nTopics:\n- test")
  end
end
