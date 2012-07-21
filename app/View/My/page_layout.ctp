<script language="JavaScript">
//<![CDATA[
function recreateSortables() {
    Sortable.destroy('list-top');
    Sortable.destroy('list-left');
    Sortable.destroy('list-right');
    
	Sortable.create("list-top", {constraint:false, containment:['list-top','list-left','list-right'], dropOnEmpty:true, handle:'handle', onUpdate:function(){new Ajax.Request('/my/order_blocks?group=top', {asynchronous:true, evalScripts:true, parameters:Sortable.serialize("list-top")})}, only:'mypage-box', tag:'div'})
	Sortable.create("list-left", {constraint:false, containment:['list-top','list-left','list-right'], dropOnEmpty:true, handle:'handle', onUpdate:function(){new Ajax.Request('/my/order_blocks?group=left', {asynchronous:true, evalScripts:true, parameters:Sortable.serialize("list-left")})}, only:'mypage-box', tag:'div'})
	Sortable.create("list-right", {constraint:false, containment:['list-top','list-left','list-right'], dropOnEmpty:true, handle:'handle', onUpdate:function(){new Ajax.Request('/my/order_blocks?group=right', {asynchronous:true, evalScripts:true, parameters:Sortable.serialize("list-right")})}, only:'mypage-box', tag:'div'})
}

function updateSelect() {
    s = $('block-select')
    for (var i = 0; i < s.options.length; i++) {
        if ($('block_' + s.options[i].value)) {
            s.options[i].disabled = true;
        } else {
            s.options[i].disabled = false;
        }
    }
    s.options[0].selected = true;
}

function afterAddBlock() {
    recreateSortables();
    updateSelect();
}

function removeBlock(block) {
    Effect.DropOut(block);
    updateSelect();
}
//]]>
</script>

<div class="contextual">
<% form_tag({:action => "add_block"}, :id => "block-form") do %>
<%= select_tag 'block', "<option></option>" + options_for_select(@block_options), :id => "block-select" %>
<%= link_to_remote l(:button_add),
           {:url => { :action => "add_block" },
            :with => "Form.serialize('block-form')",
            :update => "list-top",
            :position => :top,
            :complete => "afterAddBlock();"
           }, :class => 'icon icon-add'
             %>
<% end %>
<%= link_to l(:button_save), {:action => 'page_layout_save'}, :class => 'icon icon-save' %>
<%= link_to l(:button_cancel), {:action => 'page'}, :class => 'icon icon-cancel' %>
</div>

<h2><%=l(:label_my_page)%></h2>

<div id="list-top" class="block-receiver">
	<% @blocks['top'].each do |b| 
	   next unless MyController::BLOCKS.keys.include? b %>
	<%= render :partial => 'block', :locals => {:user => @user, :block_name => b} %>
	<% end if @blocks['top'] %>
</div>

<div id="list-left" class="splitcontentleft block-receiver">
	<% @blocks['left'].each do |b| 
	   next unless MyController::BLOCKS.keys.include? b %>
	<%= render :partial => 'block', :locals => {:user => @user, :block_name => b} %>
	<% end if @blocks['left'] %>
</div>

<div id="list-right" class="splitcontentright block-receiver">
	<% @blocks['right'].each do |b| 
	   next unless MyController::BLOCKS.keys.include? b %>
	<%= render :partial => 'block', :locals => {:user => @user, :block_name => b} %>
	<% end if @blocks['right'] %>
</div>

<%= sortable_element 'list-top',
      :tag => 'div',
      :only => 'mypage-box',
      :handle => "handle",
      :dropOnEmpty => true,
      :containment => ['list-top', 'list-left', 'list-right'],
      :constraint => false,
      :url => { :action => "order_blocks", :group => "top" }
       %>
      
      
<%= sortable_element 'list-left', 
      :tag => 'div',
      :only => 'mypage-box',
      :handle => "handle",
      :dropOnEmpty => true,
      :containment => ['list-top', 'list-left', 'list-right'],
      :constraint => false,
      :url => { :action => "order_blocks", :group => "left" }
       %>
      
<%= sortable_element 'list-right', 
      :tag => 'div',
      :only => 'mypage-box',
      :handle => "handle",
      :dropOnEmpty => true,
      :containment => ['list-top', 'list-left', 'list-right'],
      :constraint => false,
      :url => { :action => "order_blocks", :group => "right" }
       %>
      
<%= javascript_tag "updateSelect()" %>
