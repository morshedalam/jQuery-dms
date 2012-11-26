require 'spec_helper'

describe DocumentsController do
  before(:each) do
  end

  describe "Get index" do
    it "should get 200 status" do
      get :index
      response.should render_template(:index)
      response.code.should eq("200")
    end

    it "assigns all documents" do
      documents = save_documents
      get :index
      assigns[:documents].sort.should == documents.sort
    end
  end

  describe "Get new" do
    it "should get 200 status" do
      get :new
      response.code.should eq("200")
      response.should render_template(:new)
    end

    it "should return a new document instance" do
      get :new
      assigns[:object_new].should be_an_instance_of Document
    end
  end

  describe "Post create" do
    it "should save xml document" do
      document = Factory.build(:document)
      post :create, :document => document.attributes
      assigns[:document].should_not be(document)
    end
  end

  describe "DELETE destroy" do
    it "destroy the requested document" do
      documents = save_documents
      doc_id_to_delete = documents.first.id
      delete :destroy, :id => doc_id_to_delete
      response.should be_success
      Document.find_by_id(doc_id_to_delete).should be_nil
    end
  end

  def save_documents
    documents = Array.new
    4.times do
      documents << Factory.create(:document)
    end
    documents
  end

end