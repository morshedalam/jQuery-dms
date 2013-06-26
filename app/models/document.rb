class Document < ActiveRecord::Base
  mount_uploader :file, FileUploader

  include Rails.application.routes.url_helpers

  validates :file, :presence => true

  before_validation do
    self.name = self.file.to_readable_name
  end

  scope :choices, select([:"#{table_name}.id", :"#{table_name}.name"]).order(:"#{table_name}.name")
  scope :match_with, lambda { |name| where("documents.name LIKE \"%#{name}%\"") }

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload(show_checkbox = false)
    {
        "id" => self.id,
        "name" => self.name.humanize,
        #"size" => file.size.to_i,
        "url" => file.url,
        "full_path" => file.current_path,
        "delete_url" => document_path(:id => id),
        "delete_type" => "DELETE",
        "show_checkbox" => show_checkbox
    }
  end

  def self.search(p)
    return match_with(p[:name]) if p[:name].present?
    all
  end
end