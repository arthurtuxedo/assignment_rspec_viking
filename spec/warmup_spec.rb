# hello worl
require_relative '../lib/warmup.rb'

describe Warmup do

  let (:warmup) {Warmup.new}
  describe 'gets_shout' do
    it 'upcases strings from gets' do
      allow(warmup).to receive(:gets).and_return("shout, shout, let it all out")
      expect(warmup.gets_shout).to eq("SHOUT, SHOUT, LET IT ALL OUT")
    end
  end

  describe 'triple_size' do
    it 'returns triple the size of the array' do
      size_double = double(:size => 5)
      expect(warmup.triple_size(size_double)).to eq(15)

    end
  end

  describe 'calls_some_methods' do
    it 'upcases strings' do
      s = "my string"
      warmup.calls_some_methods(s)
      expect(s).to eq(s.upcase)
    end
    it 'reverses strings' do
      s = "my string"
      warmup.calls_some_methods(s)
      expect(s).to eq("my string".reverse.upcase)
    end
    it 'returns and unrelated string' do
      expect(warmup.calls_some_methods("string")).to eq("I am unrelated")
    end
    it 'raises an error if no string given' do
      expect{warmup.calls_some_methods("")}.to raise_error("Hey, give me a string!")
    end
  end
end
