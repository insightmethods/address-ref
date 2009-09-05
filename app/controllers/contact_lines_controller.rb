class ContactLinesController < ApplicationController

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
