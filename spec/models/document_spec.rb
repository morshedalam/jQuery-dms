require 'spec_helper'

describe Document do
  include CarrierWave::Test::Matchers

  before(:each) do
    @document = Factory.build(:document)
  end

  it "should not be valid without file" do
    doc_without_file = Factory.build(:document, :file => "")
    doc_without_file.should_not be_valid
  end

  it "should be valid with file and name" do
    @document.should be_valid
  end

  it "should create with required information" do
    @document.should be_valid
    expect {
      @document.save
    }.to change { Document.count }.by(1)
  end

  describe "Name" do
    it "should be similar with readable file name" do
      @document.save
      @document.file.to_readable_name
      @document.name.should eql(@document.file.to_readable_name)
    end
  end

  describe "Convenient method" do
    it "should contain name, size, download Url, full path, delete url" do
      @document.save
      doc_info = @document.to_jq_upload
      doc_info.should_not be_empty
      doc_info["name"].should_not eql("")
      doc_info["size"].should_not eql("")
      doc_info["url"].should_not eql("")
      doc_info["full_path"].should_not eql("")
      doc_info["delete_url"].should_not eql("")
      doc_info["name"].should eql(@document.name)
    end

    it "should have unmarked delete checkbox" do
      @document.save
      doc_info = @document.to_jq_upload
      doc_info["show_checkbox"].should eql(false)
    end

    it "should have marked delete checkbox" do
      @document.save
      doc_info = @document.to_jq_upload(true)
      doc_info["show_checkbox"].should eql(true)
    end
  end

  describe "File" do
    it "should not exists" do
      doc = Document.new({:name => 'missing', :file => 'missing.xml'})
      assert(doc.file.file.nil?)
    end

    it "should exists" do
      @document.save
      assert(@document.file.file.exists?)
    end
  end
end
