module Paperclip
  module Shoulda
    module Matchers
      class HaveAttachedFileMatcher

        def has_column?
          column_name = "#{@attachment_name}_file_name"

          if @subject.respond_to?(:column_names)
            @subject.column_names.include?(column_name)
          elsif @subject.respond_to?(:fields)
            @subject.fields.keys.include?(column_name)
          else
            raise "#{@subject} did not respond to #column_names or #fields, cannot determine whether '#{column_name}' exists"
          end
        end

      end
    end
  end
end