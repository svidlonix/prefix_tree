require 'spec_helper'

describe LoadSaveFile do
  let(:file) { LoadSaveFile.new('file_name') }
  subject { file }

  describe '#save_to_file' do
    it { expect(file.save_to_file).to eq('file_name') }
  end

  describe '#load_from_file' do
    it { expect(file.load_from_file).to eq('file_name') }
  end

  describe '#save_to_zip_file' do
    it { expect(file.save_to_zip_file).to eq('file_name') }
  end

  describe '#load_from_zip_file' do
    it { expect(file.load_from_zip_file).to eq('file_name') }
  end
end
