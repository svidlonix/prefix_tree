require 'spec_helper'

describe SourceFile::Load do
  let(:file_name) { 'spec/test_data_file' }

  describe '#load' do
    before do
      Tree.new('cat').add
      Tree.new('dog').add
      SourceFile::Save.new.call(file_name, 'txt')
      $prefix_tree = [Node.new('*')]
      SourceFile::Load.new.call(file_name, 'txt')
    end

    it { expect(Tree.list).to eq(%w[cat dog]) }
  end

  describe '#load_from_zip_file' do
    before do
      Tree.new('cat').add
      Tree.new('dog').add
      SourceFile::Save.new.call(file_name, 'zip')
      $prefix_tree = [Node.new('*')]
      SourceFile::Load.new.call(file_name, 'zip')
    end

    it { expect(Tree.list).to eq(%w[cat dog]) }
  end
end
