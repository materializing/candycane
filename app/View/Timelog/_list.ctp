<table class="list time-entries">
<thead>
<tr>
<%= sort_header_tag('spent_on', :caption => l(:label_date), :default_order => 'desc') %>
<%= sort_header_tag('user', :caption => l(:label_member)) %>
<%= sort_header_tag('activity', :caption => l(:label_activity)) %>
<%= sort_header_tag('project', :caption => l(:label_project)) %>
<%= sort_header_tag('issue', :caption => l(:label_issue), :default_order => 'desc') %>
<th><%= l(:field_comments) %></th>
<%= sort_header_tag('hours', :caption => l(:field_hours)) %>
<th></th>
</tr>
</thead>
<tbody>
<% entries.each do |entry| -%>
<tr class="time-entry <%= cycle("odd", "even") %>">
<td class="spent_on"><%= format_date(entry.spent_on) %></td>
<td class="user"><%=h entry.user %></td>
<td class="activity"><%=h entry.activity %></td>
<td class="project"><%=h entry.project %></td>
<td class="subject">
<% if entry.issue -%>
<%= link_to_issue entry.issue %>: <%= h(truncate(entry.issue.subject, 50)) -%>
<% end -%>
</td>
<td class="comments"><%=h entry.comments %></td>
<td class="hours"><%= html_hours("%.2f" % entry.hours) %></td>
<td align="center">
<% if entry.editable_by?(User.current) -%>
    <%= link_to image_tag('edit.png'), {:controller => 'timelog', :action => 'edit', :id => entry, :project_id => nil},
                                       :title => l(:button_edit) %>
    <%= link_to image_tag('delete.png'), {:controller => 'timelog', :action => 'destroy', :id => entry, :project_id => nil},
                                         :confirm => l(:text_are_you_sure),
                                         :method => :post,
                                         :title => l(:button_delete) %>
<% end -%>
</td>
</tr>
<% end -%>
</tbody>
</table>
