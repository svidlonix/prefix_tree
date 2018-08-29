require 'spec_helper'

describe Load do
  let(:file_name) { 'spec/test_data_file.txt' }
  let(:zipfile_name) { 'spec/test_data_file.zip' }
  let(:expected_result) do
    {
      'c' => { 'a' => { 't' => { last_char: true } } },
      'd' => { 'o' => { 'g' => { last_char: true } } }
    }
  end

  describe '.save.rb' do
    before do
      Tree.new('catty').add
      Tree.new('cat').add
      SaveFile.save(file_name)
    end

    it { expect(File.open(file_name, 'r').read.split("\n")).to eq(%w[catty cat]) }
  end

  describe '.load' do
    before do
      Tree.new('cat').add
      Tree.new('dog').add
      SaveFile.save(file_name)
      $prefix_tree = {}
      SaveFile.load(file_name)
    end

    it { expect($prefix_tree).to eq(expected_result) }
  end

  describe '#save_to_zip_file' do
    before do
      Tree.new('cat').add
      Tree.new('dog').add
      SaveFile.save_to_zip(file_name, zipfile_name)
    end

    it { expect(File.exist?(zipfile_name)).to eq(true) }
    it { expect(File.exist?(file_name)).to eq(false) }
  end

  describe '#load_from_zip_file' do
    before do
      Tree.new('cat').add
      Tree.new('dog').add
      SaveFile.save_to_zip(file_name, zipfile_name)
      $prefix_tree = {}
      SaveFile.load_from_zip(file_name, zipfile_name)
    end

    it { expect($prefix_tree).to eq(expected_result) }
  end
end
