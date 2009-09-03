class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.xml
  def index
    @contacts = Contact.find(:all, :order => "company_name, first_name")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contacts.to_xml(:dasherize => false, :methods => [:main_name], :only => [:name, :id] ) }
    end
  end
  
  # GET /contacts/1
  # GET /contacts/1.xml
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
      format.xml
    end
  end
  
  # GET /search/q?
  # GET /search.xml/q?
  # TODO: set routes
  def search
    @contacts = Contact.search(params[:q])
    
    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @contacts.to_xml(:dasherize => false, :methods => [:main_name], :only => [:name, :id] ) }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @contact = Contact.create
    %w{phone_main phone_fax email_main}.each do |label|
      ContactLine.create({:label => label, :contact => @contact})
    end
    render :action => "edit", :layout => false
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
    render :layout => false
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save && @contact.update_all(params)
        flash.now[:notice] = 'Contact was successfully created.'
        format.html { render :action => "show", :layout => false }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update
    @contact = Contact.find(params[:id])
    respond_to do |format|
      if @contact.update_all(params)
        flash.now[:notice] = 'Contact was successfully updated.'
        format.html { render :action => "show", :layout => false }
        format.xml  { head :ok }
      else
        format.html { render :action => "failed_update", :layout => false }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { head :ok }
    end
  end
end
