module ThingsHelper
  def tag_link(tag)
    number = Thing.find_tagged_with(tag, :on => :tags).count
    "#{tag.name} (#{number})"
  end
end
