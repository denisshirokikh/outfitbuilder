require 'clothes_item'

describe ClothesItem do
  it 'assigns instance variables' do
    clothes_item = ClothesItem.new('tshirt', 'tops', 10, 40)
    expect(clothes_item.name).to eq 'tshirt'
    expect(clothes_item.type).to eq 'tops'
    expect(clothes_item.min_temp).to eq 10
    expect(clothes_item.max_temp).to eq 40
  end
end

describe 'suitable_for_temperature?' do
  it 'approves clothes for temperature' do
    clothes_item = ClothesItem.new('tshirt', 'tops', 10, 40)
    expect(clothes_item.suitable_for_temperature?(5)).to be_falsey
    expect(clothes_item.suitable_for_temperature?(20)).to be_truthy
    expect(clothes_item.suitable_for_temperature?(10)).to be_truthy
    expect(clothes_item.suitable_for_temperature?(40)).to be_truthy
    expect(clothes_item.suitable_for_temperature?(-20)).to be_falsey
  end
end

describe 'to_s' do
  it 'prints' do
    clothes_item = ClothesItem.new('tshirt', 'tops', -10, 40)
    expect(clothes_item.to_s).to eq "tshirt (tops) -10..40"
  end
end

describe 'from_file' do
  it 'retrieve data from file and initialize ClothesItem' do
    clothes_item = ClothesItem.from_file(File.join(__dir__, 'data/07.txt'))
    expect(clothes_item.name).to eq 'Winter boots'
    expect(clothes_item.type).to eq 'Shoes'
    expect(clothes_item.min_temp).to eq -40
    expect(clothes_item.max_temp).to eq -18
  end
end
