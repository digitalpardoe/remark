class Admin::SettingsController < AdminController
  def show
    @settings = Setting.application.all
    authorize! :read, @settings
    
    respond_to do |format|
      format.html
    end
  end

  def update
    authorize! :update, @settings
    
    Setting.update(params[:setting].keys, params[:setting].values.map { |item| item = { :value => item } })
    
    respond_to do |format|
      format.html { redirect_to(admin_settings_path, :notice => "Settings updated.") }
    end
  end
end
