require 'spec_helper'

describe SourceFile::Save do
  let(:file_name) { 'spec/test_data_file' }

  before do
    Tree.new('catty').add
    Tree.new('cat').add
  end

  describe 'save txt file' do
    before { SourceFile::Save.new.call(file_name, 'txt') }

    it { expect(File.open("#{file_name}.txt", 'r').read.split("\n")).to eq(%w[cat catty]) }
  end

  describe '#save zip file' do
    before { SourceFile::Save.new.call(file_name, 'zip') }

    it { expect(File.exist?("#{file_name}.zip")).to eq(true) }
    it { expect(File.exist?("#{file_name}.txt")).to eq(false) }
  end
end
