class Image < ApplicationRecord
    mount_uploader :file, FileUploader
    validates :name, presence: true
    validates :enable, presence: true
end
