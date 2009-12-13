module ApplicationHelper
  def html_title
    title = "#{Configuration.get(:name)}'s thing called #{@thing.name}" if @thing
    title = "#{Configuration.get(:name)}'s things with tag #{@tag}" if @tag
    title ||= "#{Configuration.get(:name)}'s things"
  end
end
