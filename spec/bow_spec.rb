require_relative '../lib/weapons/bow'
#
describe Bow do
  let (:bow) { Bow.new }
  describe 'arrow count is readable do' do
    it 'is possible to read number of arrows' do
      expect(bow).to respond_to(:arrows)
    end
    it 'starts with 10 arrows' do
      expect(bow.arrows).to eq(10)
    end
    it 'can start with other amount of arrows' do
      bow30 = Bow.new(30)
      expect(bow30.arrows).to eq(30)
    end
    it 'uses 1 arrow per shot' do
      original_count = bow.arrows
      bow.use
      expect(bow.arrows).to eq(original_count-1)
    end
    it 'raises an error if no arrows' do
      empty_bow = Bow.new(0)
      expect{empty_bow.use}.to raise_error(RuntimeError)
    end
  end
end
