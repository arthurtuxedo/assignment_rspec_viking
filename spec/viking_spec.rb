require_relative '../lib/viking'
#
describe Viking do
  describe 'parameters' do
    it 'sets the variable equal to the given parameter' do
      eric = Viking.new("Eric the Red")
      expect(eric.name).to eq("Eric the Red")
    end
    it 'sets viking health' do
      eric = Viking.new("RandomViking", 110)
      expect(eric.health).to eq(110)
    end
    it 'is not possible to set health again' do
      eric = Viking.new("RandomViking", 110)
      expect{eric.health = 4}.to raise_error(NoMethodError)
    end
    it 'has a default nil weapon' do
      eric = Viking.new
      expect(eric.weapon).to eq(nil)
    end
    it 'sets a weapon when picked up' do
      eric = Viking.new
      bow = Bow.new
      eric.pick_up_weapon(bow)
      expect(eric.weapon).to eq(bow)
    end
    it 'raises error when non-weapon picked up' do
      eric = Viking.new
      bow = Bow.new
      expect{eric.pick_up_weapon("Rock")}.to raise_error("Can't pick up that thing")
    end
    it 'replaces existing weapon' do
      eric = Viking.new
      bow = Bow.new
      bow30 = Bow.new(30)
      eric.pick_up_weapon(bow)
      eric.pick_up_weapon(bow30)
      expect(eric.weapon).to eq(bow30)
    end
    it 'reverts to nil weapon' do
      eric = Viking.new
      bow = Bow.new
      bow30 = Bow.new(30)
      eric.pick_up_weapon(bow)
      eric.drop_weapon
      expect(eric.weapon).to eq(nil)
    end
  end
end
