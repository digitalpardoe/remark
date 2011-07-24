class Admin::SettingsController < AdminController
  authorize_resource
  
  cache_sweeper :setting_sweeper, :only => [:update]
  
  def show
    @settings = Setting.application.all
    
    respond_to do |format|
      format.html
    end
  end

  def update
    Setting.update(params[:setting].keys, params[:setting].values.map { |item| item = { :value => item } })
    
    respond_to do |format|
      format.html { redirect_to(admin_settings_path, :notice => "Settings updated.") }
    end
  end
end
