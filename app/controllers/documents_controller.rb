class DocumentsController < ApplicationController

  def index
    @documents = Document.all

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
        format.html {
          render :json => [@document.to_jq_upload(true)].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json {
          render :json => [@document.to_jq_upload(true)].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    render :json => true
  end
end
