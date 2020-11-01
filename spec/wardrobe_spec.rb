require 'wardrobe'
require 'clothes_item'

describe Wardrobe do
  it 'assigns instance variables' do
    wardrobe = Wardrobe.new(['tshirt', 'tops', 10, 40])
    expect(wardrobe.clothes).to eq ['tshirt', 'tops', 10, 40]
  end

end

describe 'for weather' do
  it 'finds suitable items for temp' do
    wardrobe = Wardrobe.new([ClothesItem.new('tshirt', 'tops', 10, 40)])
    expect(wardrobe.for_weather(-10).clothes).to eq []
    expect(wardrobe.for_weather(20).clothes).to eq wardrobe.clothes
  end
end

describe 'for_type' do
  it 'finds suitable items for type' do
    wardrobe = Wardrobe.new([ClothesItem.new('tshirt', 'tops', 10, 40)])
    expect(wardrobe.for_type('Shoes').clothes).to eq []
    expect(wardrobe.for_type('tops').clothes).to eq  wardrobe.clothes
  end
end

describe 'types' do
  it 'finds uniq types' do
    wardrobe = Wardrobe.new([ClothesItem.new('tshirt', 'tops', 10, 40)])
    expect(wardrobe.types).to eq ['tops']
  end
end