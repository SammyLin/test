class Redactor::AttachmentFile < Redactor::Asset
  mount_uploader :data, RedactorAttachmentFileUploader, :mount_on => :data_file_name

  def url_thumb
    @url_thumb ||= Redactor::Utils.filethumb(filename)
  end
end
