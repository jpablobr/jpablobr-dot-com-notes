module RestControllerMethods
  def self.included(base)
    base.send :before_filter, :build_obj, :only => [ :new, :create ]
    base.send :before_filter, :load_obj, :only => [ :show, :edit, :update, :destroy ]
  end
  
  def index
    self.instance_variable_set('@' + self.controller_name,
      scoper.find(:all))
  end
  
  def create
    if @obj.save
      flash[:notice] = "The #{cname.humanize.downcase} has been created."
      redirect_to redirect_url
    else
      render :action => 'new'
    end
  end

  def update
    if @obj.update_attributes(params[cname])
      flash[:notice] = "The #{cname.humanize.downcase} has been updated."
      redirect_to redirect_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @result = @obj.destroy
    respond_to do |f|
      f.html do
        if @result
          flash[:notice] = "The #{cname.humanize.downcase} has been deleted."
          redirect_to redirect_url
        else
          render :action => 'show'
        end
      end
      
      f.js do
        render :update do |page|
          if @result
            page.remove "#{@cname}_#{@obj.id}"
          else
            page.alert "Errors deleting #{@obj.class.to_s.downcase}: #{@obj.errors.full_messages.to_sentence}"
          end
        end
      end
    end
  end
  
  protected
  
    def cname; @cname ||= controller_name.singularize end
    
    def set_obj; @obj ||= self.instance_variable_get('@' + cname) end
    
    def load_obj; @obj = self.instance_variable_set('@' + cname,  scoper.find(params[:id])) end
        
    def scoper; Object.const_get(cname.classify) end
    
    def redirect_url; { :action => 'index' } end

    def build_obj
      @obj = self.instance_variable_set('@' + cname,
        scoper.is_a?(Class) ? scoper.new(params[cname]) : scoper.build(params[cname]))
    end    
end
