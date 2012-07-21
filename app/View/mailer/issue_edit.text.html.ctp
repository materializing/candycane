<%= l(:text_issue_updated, "##{@issue.id}", @journal.user) %>

<ul>
<% for detail in @journal.details %>
    <li><%= show_detail(detail, true) %></li>
<% end %>
</ul>

<%= textilizable(@journal, :notes, :only_path => false) %>
<hr />
<%= render :partial => "issue_text_html", :locals => { :issue => @issue, :issue_url => @issue_url } %>
