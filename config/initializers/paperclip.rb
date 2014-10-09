if Rails.env.development?
  Paperclip::Attachment.default_options[:url] = "/system/:class/:id/:attachment/:basename_:style.:extension"
  Paperclip::Attachment.default_options[:path] = ":rails_root/public/system/:class/:id/:attachment/:basename_:style.:extension"
elsif Rails.env.production?
  Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id/:basename_:style.:extension'
end