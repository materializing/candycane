<% form_remote_tag(:url => {}, :html => { :id => "journal-#{@journal.id}-form" }) do %>
    <%= text_area_tag :notes, h(@journal.notes), :class => 'wiki-edit', 
                                                 :rows => (@journal.notes.blank? ? 10 : [[10, @journal.notes.length / 50].max, 100].min) %>
    <%= call_hook(:view_journals_notes_form_after_notes, { :journal => @journal}) %>
    <p><%= submit_tag l(:button_save) %>
    <%= link_to l(:button_cancel), '#', :onclick => "Element.remove('journal-#{@journal.id}-form'); " +
                                                    "Element.show('journal-#{@journal.id}-notes'); return false;" %></p>
<% end %>
