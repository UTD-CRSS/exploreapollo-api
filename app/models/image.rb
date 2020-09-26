class Image < Media
	mount_uploader :url, ImageUploader
end
