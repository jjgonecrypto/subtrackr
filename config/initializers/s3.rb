Paperclip.interpolates :name  do |attachment, style|
  attachment.instance.name.downcase.gsub(/[^a-z0-9]?/, '')
end

Paperclip.interpolates :klass  do |attachment, style|
  attachment.instance.class.to_s.downcase.gsub(/[^A-Za-z0-9]?/, '')
end 