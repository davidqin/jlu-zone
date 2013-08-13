class PrintFilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    print = current_user.prints.find(params[:print_id])
    print_item = print.items.find(params[:item_id])
    print_files = print_item.files

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: print_files.map{|file| file.to_jq_upload } }
    end
  end

  def create
    print = current_user.prints.find(params[:print_id])
    print_item = print.items.find(params[:item_id])
    print_file = print_item.files.new(params[:print_file])

    # geek
    print_file.size = print_file.url.file.size
    print_file.name = params[:print_file][:url].original_filename

    respond_to do |format|
      if print_file.save
        format.html {
          render :json => [print_file.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [print_file.to_jq_upload]}, status: :created, location: print_item_file_path(print, print_item, print_file) }
      else
        format.html { render action: "new" }
        format.json { render json: print_file.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    print = current_user.prints.find(params[:print_id])
    print_item = print.items.find(params[:item_id])
    print_file = print_item.files.find(params[:id])
    print_file.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end