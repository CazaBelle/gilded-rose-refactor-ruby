require './lib/item'

RSpec.describe 'Item' do 
  

describe '#new' do 

  before(:each) do
    @item = Item.new("banana", 15, 15)
  end 

  it 'has a name' do
    expect(@item.name).to eq "banana"
  end 

  it 'has a sell_in date' do 
    expect(@item.sell_in).to eq 15
  end 

  it 'has a value' do 
    expect(@item.quality).to eq 15
  end 

  it 'has a method to turn the item into a string' do 
    expect(@item.to_s).to eq "banana, 15, 15"
  end 
end 

end 

