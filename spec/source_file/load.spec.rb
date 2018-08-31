require 'spec_helper'

describe SourceFile::Load do
  let(:file_name) { 'spec/test_data_file' }

  describe '#load' do
    let(:prefix_tree1) { PrefixTree.new }
    let(:prefix_tree2) { PrefixTree.new }

    before do
      prefix_tree1.add('cat')
      prefix_tree1.add('dog')
      SourceFile::Save.new.call(file_name, 'txt', prefix_tree1)
      SourceFile::Load.new.call(file_name, 'txt', prefix_tree2)
    end

    it { expect(prefix_tree2.list).to eq(%w[cat dog]) }
  end

  describe '#load_from_zip_file' do
    let(:prefix_tree1) { PrefixTree.new }
    let(:prefix_tree2) { PrefixTree.new }

    before do
      prefix_tree1.add('cat')
      prefix_tree1.add('dog')
      SourceFile::Save.new.call(file_name, 'zip', prefix_tree1)
      SourceFile::Load.new.call(file_name, 'zip', prefix_tree2)
    end

    it { expect(prefix_tree2.list).to eq(%w[cat dog]) }
  end
end
