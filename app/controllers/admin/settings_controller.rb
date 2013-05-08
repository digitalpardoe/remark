class Admin::SettingsController < AdminController
  authorize_resource

  def show
    @settings = Setting.application.load
    
    respond_to do |format|
      format.html
    end
  end

  def update
    Setting.update(params[:setting].keys, params[:setting].values.map { |item| item = { :value => item } })
    
    respond_to do |format|
      format.html { redirect_to(admin_settings_path, :flash => { :success => "Settings updated." }) }
    end
  end
end
