module ApplicationHelper
  def html_title
    title = "#{Configuration.get(:name)}'s thing called #{@thing.name}" if @thing
    title = "#{Configuration.get(:name)}'s things with tag #{@tag}" if @tag
    title = "#{Configuration.get(:name)}'s things that are borrowed by #{@lender.name}" if @lender
    title ||= "#{Configuration.get(:name)}'s things"
  end
  
  def javascript_var(variables)
    js_vars = variables.map { |name, value| "var #{name} = #{value.to_json}" }
    javascript_tag js_vars.join(';')
  end
  
  def generate_nested_form_html(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f
    options[:locals] ||= Hash.new

    form_builder.fields_for(method, options[:object], :child_index => 'NEW_RECORD') do |f|
      options[:locals][options[:form_builder_local]] = f
      render(:partial => options[:partial], :locals => options[:locals])
    end
  end
  
  def selected(boolean)
    return 'selected' if boolean
  end
end
