class Admin::SettingsController < AdminController
  def show
    @settings = Setting.application.all
  end

  def update
    Setting.update(params[:setting].keys, params[:setting].values.map { |item| item = { :value => item } })
    redirect_to(admin_settings_path, :notice => "Settings updated.")
  end
end
