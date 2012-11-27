class DocumentsController < ApplicationController

  def index
    @documents = Document.search(params)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @documents.collect { |p| p.to_jq_upload }.to_json }
    end
  end

  def new
    @object_new = Document.new
  end

  def create
    @document = Document.new
    @document.file = params[:document][:path]
    if @document.save
      respond_to do |format|
        format.html { redirect_to documents_path, :notice => 'Document uploaded successfully' }
        format.json { render :json => [@document.to_jq_upload(true)].to_json }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_path }
      format.json { render :json => true }
    end
  end
end
