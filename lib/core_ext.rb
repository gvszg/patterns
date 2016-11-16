class String
  def underscore
    # any group contain A~Z, replace them with
    # \1 represents the first group
    # followed by _
    # \2 followed by the second group
    gsub(/(.)([A-Z])/, '\1_\2').downcase
  end
end