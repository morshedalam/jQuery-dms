class Document < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  mount_uploader :file, FileUploader

  validates :file, :presence => true

  before_validation do
    self.name = self.file.to_readable_name
  end

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload(show_checkbox = false)
    {
        "id" => self.id,
        "name" => self.name.humanize,
        "size" => file.size,
        "url" => file.url,
        "full_path" => file.current_path,
        "delete_url" => document_path(:id => id),
        "delete_type" => "DELETE",
        "show_checkbox" => show_checkbox
    }
  end
end