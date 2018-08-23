require 'spec_helper'

describe LoadSaveFile do
  let(:file_name) { 'spec/test_data_file.txt' }
  let(:zipfile_name) { 'spec/test_data_file.zip' }
  let(:expected_result) do
    {
      'c' => { 'a' => { 't' => { last_char: true } } },
      'd' => { 'o' => { 'g' => { last_char: true } } }
    }
  end

  describe '.save' do
    before do
      Word.new('catty').add
      Word.new('cat').add
      LoadSaveFile.save(file_name)
    end

    it { expect(File.open(file_name, 'r').read.split("\n")).to eq(%w[catty cat]) }
  end

  describe '.load' do
    before do
      Word.new('cat').add
      Word.new('dog').add
      LoadSaveFile.save(file_name)
      $prefix_tree = {}
      LoadSaveFile.load(file_name)
    end

    it { expect($prefix_tree).to eq(expected_result) }
  end

  describe '#save_to_zip_file' do
    before do
      Word.new('cat').add
      Word.new('dog').add
      LoadSaveFile.save_to_zip(file_name, zipfile_name)
    end

    it { expect(File.exist?(zipfile_name)).to eq(true) }
    it { expect(File.exist?(file_name)).to eq(false) }
  end

  describe '#load_from_zip_file' do
    before do
      Word.new('cat').add
      Word.new('dog').add
      LoadSaveFile.save_to_zip(file_name, zipfile_name)
      $prefix_tree = {}
      LoadSaveFile.load_from_zip(file_name, zipfile_name)
    end

    it { expect($prefix_tree).to eq(expected_result) }
  end
end
