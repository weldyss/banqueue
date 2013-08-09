require 'rspec'
require_relative '../../lib/app'

describe Queue do

  subject { Queue.new(1, 5) }

  its(:booth) { should eq 1 }
  its(:clients) { should eq 5 }

  context 'configuring' do

    subject { Queue.new(1, 3) }

    it 'with clients' do
      expect(subject.line).to have(3).itens
    end

    it 'should indicate how many minutes client spends' do
      subject.line.each do |c| 
        c[0] = 0
        c[1] = 10
      end
      expect(subject.line.first[0]).to eq 0
      expect(subject.line.first[1]).to eq 10
    end
  end

  context 'processing' do
    context 'how many spent more than 20 minutes' do

      it 'with one booth' do
        queue = Queue.new(1,5)
        queue.line = [
          [ 0, 10],
          [ 0, 10],
          [ 1, 10],
          [ 2, 10],
          [30, 10]
        ]
        expect(queue.more_than_20).to eq 1
      end

      xit 'with more than one booth' do
        queue = Queue.new(3, 16)
        queue.line = [
          [ 0, 10],
          [ 0, 10],
          [ 0, 10],
          [ 3, 10],
          [ 5, 10],
          [ 7, 10],
          [11, 10],
          [13, 10],
          [14, 10],
          [15, 10],
          [16, 10],
          [17, 10],
          [18, 30],
          [19, 10],
          [20, 10],
          [23, 30]
        ]
        expect(queue.more_than_20).to eq 2
      end
    end
  end
end
