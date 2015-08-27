require_relative 'spec_helper'

describe Helpr::Help do
  let(:help) { Helpr::Help.new }

  it 'accepts top help' do
    help.top = 'top help'
    expect(help.top).to eq('top help')
  end

  context 'after adding topics' do
    before(:each) {
      help.add('test 1', 'this is test 1')
      help.add('test 2', 'this is test 2')
      help.add('note 1', 'this is note 1')
      help.add('note 2', 'this is note 2')
      help.add('note 3', 'this is note 3')
    }

    it 'should have test 1' do
      expect(help['test 1']).to eq('this is test 1')
    end

    it 'should have test 2' do
      expect(help['test 2']).to eq('this is test 2')
    end

    it 'should have test 2 as a symbol' do
      expect(help[:'test 2']).to eq('this is test 2')
    end

    it 'should have two topics' do
      expect(help.topics).to eq([:test, :note])
    end

    it 'note should have three subtopics' do
      expect(help.topics(['note'])).to eq([:'1', :'2', :'3'])
    end

    it 'note (as symbol) should have three subtopics' do
      expect(help.topics([:note])).to eq([:'1', :'2', :'3'])
    end
  end
end
