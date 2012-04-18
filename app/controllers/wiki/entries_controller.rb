class Wiki::EntriesController < ApplicationController
  include Wiki::Controllers::Sidebar::WikiSidebar
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Wiki
  include Wiki::Controllers::Check
  
  before_filter :authenticate_user!,    :except => [:show, :index]
  load_and_authorize_resource

  def index
    @entries = Entry.all.paginate(:page => params[:page], :per_page => 50)
    @page_title = itext("navigation.wiki")
    drop_breadcrumb(itext("navigation.wiki"), wiki_path)
  end

  def show
    @entry = Entry.find(params[:id])
    do_not_use_sidebar
    drop_breadcrumb(itext("navigation.wiki"), wiki_path)
    drop_breadcrumb(itext("entry.drop_breadcrumb_view", :entry => @entry.name))
  end

  def edit
    @entry = Entry.find(params[:id])
    do_not_use_sidebar
    drop_breadcrumb(itext("navigation.wiki"), wiki_path)
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
      redirect_to_as_create_success @entry
    else
      render_as_create_fail :new
    end
  end
  
  def update
    @entry = Entry.find(params[:id])
    if @entry.update_entry(model_params, current_user)
      redirect_to_as_update_success @entry
    else
      render_as_update_fail :edit
    end
  end

  def destroy
    entry = Entry.find(params[:id])
    entry.destroy
    redirect_to_as_destroy_success admin_entries_path
  end
end