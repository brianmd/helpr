require_relative 'spec_helper'

#     call a module method without including it:
# Xyz.instance_method(:c).bind(self).call
#
#     what this needs though is this:
# z = Class.new.send(:include, Xyz).new
# z.c    OR   z.send(:c)

module TestHelp
  def main
    "help main. Topics include: #{self.topics}"
  end

  def test1
    'help for test1'
  end

  def test2
    'help for test2'
  end
end

module TestHelp2
  def main
    "help2 main. Topics include: #{self.topics}"
  end

  def test1
    'help2 for test1'
  end

  def test2
    'help2 for test2'
  end
end

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

    xit 'note should have three subtopics' do
      expect(help['note'].topics).to eq(['note 1', 'note 2', 'note 3'])
      expect(help[:note].topics).to eq(['note 1', 'note 2', 'note 3'])
    end
  end
end
