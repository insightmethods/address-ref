class ContactLinesController < ApplicationController
  # GET /contact_lines
  # GET /contact_lines.xml
  def index
    if params[:contact_id]
      @contact_lines = Contact.find(params[:contact_id]).contact_lines
    else
      @contact_lines = ContactLine.find(:all)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contact_lines }
      format.json { render :json  => @contact_lines.to_json }
    end
  end

  # GET /contact_lines/1
  # GET /contact_lines/1.xml
  def show
    @contact_line = ContactLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact_line }
    end
  end

  # GET /contact_lines/new
  # GET /contact_lines/new.xml
  def new
    @contact_line = ContactLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact_line }
    end
  end

  # GET /contact_lines/1/edit
  def edit
    @contact_line = ContactLine.find(params[:id])
  end

  # POST /contact_lines
  # POST /contact_lines.xml
  def create
    @contact_line = ContactLine.new(params[:contact_line])
    
    respond_to do |format|
      if @contact_line.save
        flash.now[:notice] = "#{params[:section]} was successfully added."
        format.html { render :partial => "edit", :locals => {:cl => @contact_line, :section => params[:section] } }
        format.xml  { render :xml => @contact_line, :status => :created, :location => @contact_line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contact_lines/1
  # PUT /contact_lines/1.xml
  def update
    @contact_line = ContactLine.find(params[:id])

    respond_to do |format|
      if @contact_line.update_attributes(params[:contact_line])
        format.html { redirect_to(@contact_line) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_lines/1
  # DELETE /contact_lines/1.xml
  def destroy
    @contact_line = ContactLine.find(params[:id])
    flash[:notice] = "#{@contact_line.show_label} removed"
    @contact_line.destroy
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { head :ok }
    end
  end
end
