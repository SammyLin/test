class Redactor::AttachmentFile < Redactor::Asset
  has_attached_file :data,
                    :url => "/redactor_assets/attachments/:id/:filename",
                    :path => ":rails_root/public/redactor_assets/attachments/:id/:filename"

  validates_attachment_size :data, :less_than => 100.megabytes
  validates_attachment_presence :data
  def url_thumb
    @url_thumb ||= Redactor::Utils.filethumb(filename)
  end
end
