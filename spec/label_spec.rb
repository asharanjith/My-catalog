require_relative '../classes/label'

describe Label do
  context 'when a label is created' do
    it 'When a label is added, it create an instance of Label' do
      label = Label.new('title', 'color')
      expect(label).to be_an_instance_of(Label)
    end
    it 'When a label is added, it has a title' do
      label = Label.new('title', 'color')
      expect(label.title).to eq('title')
    end
    it 'When a label is added, it has a color' do
      label = Label.new('title', 'color')
      expect(label.color).to eq('color')
    end
    it 'When a label is added, it has items' do
      label = Label.new('title', 'color')
      expect(label.items).to eq([])
    end
  end
end
