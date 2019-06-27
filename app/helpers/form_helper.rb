module FormHelper
  def link_to_add_row(name, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("#{association}/form", f: builder)
    end
    link_to(name, "#", class: "add_nested_fields " + args[:class], data: { id: id, fields: fields.gsub("\n", "") })
  end
end