class Wiki::EntriesController < ApplicationController
  
  before_filter :authenticate_user!,    :except => [:show, :index]
  load_and_authorize_resource
  before_filter :find_current_category, :only   => [:index]

  include Wiki::Controllers::Sidebar::WikiSidebar

  attr_accessor :current_category
  
  helper_method :current_category

  def index
    @entries = current_category.entries.all.paginate(:page => params[:page], :per_page => 10)
    drop_breadcrumb(itext("navigation.wiki"), wiki_path)
    drop_breadcrumb(current_category.name)
  end

  def show
    @entry = Entry.find(params[:id])
    do_not_use_sidebar
    drop_breadcrumb(itext("navigation.wiki"), wiki_path)
    drop_breadcrumb(@entry.category.name,category_entries_path(@entry.category))
    drop_breadcrumb(itext("entry.drop_breadcrumb_view", :entry => @entry.name))
  end

  def edit
    @entry = Entry.find(params[:id])
    do_not_use_sidebar
    drop_breadcrumb(itext("navigation.wiki"), wiki_path)
    drop_breadcrumb(@entry.category.name,category_entries_path(@entry.category))
    drop_breadcrumb(itext('entry.drop_breadcrumb_edit', :entry => @entry.name))
  end

  def new
    @entry = Entry.new
    do_not_use_sidebar
    drop_breadcrumb(itext("navigation.wiki"), wiki_path)
    drop_breadcrumb(itext('entry.drop_breadcrumb_new'))
  end

  def create
    @entry = Entry.create_entry(model_params, current_user)
    if @entry.save
      redirect_to_as_create_success [current_category, @entry]
    else
      render_as_create_fail :new
    end
  end
  
  def update
    @entry = Entry.find(params[:id])
    if @entry.update_entry(model_params, current_user)
      redirect_to_as_update_success [current_category, @entry]
    else
      render_as_update_fail :edit
    end
  end

  def destroy
    entry = Entry.find(params[:id])
    category = entry.category
    entry.destroy
    redirect_to_as_destroy_success category_entries_path(category)
  end

  def preview
    @content = params[:content]
    respond_to do |format|  
      format.json { render 'preview', :layout => false }  
    end
  end

  private

  def find_current_category
    return nil unless params[:category_number]
    self.current_category = EntryCategory.find_by_number(params[:category_number])
    unless self.current_category
      raise "Can not find a EntryCategory with the number #{params[:category_number]}"
    end
  end
end