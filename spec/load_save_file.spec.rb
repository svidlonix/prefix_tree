require 'spec_helper'

describe LoadSaveFile do
  let(:file_name) { 'spec/test_data_file.txt' }

  describe '.save' do
    before do
      Word.new('catty').add
      Word.new('cat').add
      LoadSaveFile.save(file_name)
    end

    it { expect(File.open(file_name, 'r').read.split("\n")).to eq(%w[catty cat]) }
  end

  describe '.load' do
    let(:expected_result) do
      {
        'c' => { 'a' => { 't' => { last_char: true } } },
        'd' => { 'o' => { 'g' => { last_char: true } } }
      }
    end

    before do
      Word.new('cat').add
      Word.new('dog').add
      LoadSaveFile.save(file_name)
      LoadSaveFile.load(file_name)
    end

    it { expect($prefix_tree).to eq(expected_result) }
  end

  describe '#save_to_zip_file' do
    it { expect(file.save_to_zip_file).to eq('file_name') }
  end

  describe '#load_from_zip_file' do
    it { expect(file.load_from_zip_file).to eq('file_name') }
  end
end
