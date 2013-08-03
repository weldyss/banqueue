require 'rspec'
require_relative '../../lib/app'

describe Queue do

  subject {Queue.new(1, 5)}

  its(:booth) { should eq 1 }
  its(:clients) { should eq 5 }

  context 'configuring queue' do
    it 'should indicate how many minutes client spends'
    it 'should indicate when clients arrived'
  end

  context 'processing' do
    it 'must choose a queue to client'
    it 'must return what queue'
    it 'must return time in the queue'
    it 'must return how many spent more than 20 minutes'
  end
end
