<h3><%=l(:label_news_latest)%></h3>

<%= render(:partial => 'news/news', 
            :collection => News.find(:all,
                                     :limit => 10,
                                     :order => "#{News.table_name}.created_on DESC",
                                     :conditions => "#{News.table_name}.project_id in (#{@user.projects.collect{|m| m.id}.join(',')})",
                                     :include => [:project, :author])) unless @user.projects.empty? %>