class Redactor::Picture < Redactor::Asset
  mount_uploader :data, RedactorPictureUploader, :mount_on => :data_file_name

  def url_content
    url(:content)
  end
end
