module PagesHelper

  def page_column(project,pages,current_target = nil)
    render :partial => 'pages/column', :locals => {
      :project => project,
      :pages => pages,
      :current_target => current_target }
  end
  
  def new_page_link(project)
    link_to "<span>Page</span>", new_project_page_path(project),
    :class => 'button'
  end
  
  def page_fields(f)
    render :partial => 'pages/fields', :locals => { :f => f }
  end
  
  def list_pages(pages,current_target)
    render :partial => 'pages/page', :collection => pages, :locals => {
      :current_target => current_target }
  end

  def page_link(project,page)
    link_to h(page.name), project_page_path(project,page)
  end
  
  def edit_page_link(project,page)
    link_to h(page.name), edit_project_page_path(project,page)
  end
  
  def notes_sortable_tag(page)
    url = project_page_path(page.project,page)
    update_page_tag do |page|
      page.notes_sortable(url)
    end
  end
  
  def notes_sortable(url)
    page.sortable('notes', {
      :tag => 'div',
      :handle => 'img.drag',
      :url => url,
      :method => :put
    })
  end
end