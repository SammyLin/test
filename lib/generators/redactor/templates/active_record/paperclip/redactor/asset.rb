class Redactor::Asset < ActiveRecord::Base
  include Redactor::Orm::ActiveRecord::AssetBase
  include Redactor::Backend::Paperclip
end
