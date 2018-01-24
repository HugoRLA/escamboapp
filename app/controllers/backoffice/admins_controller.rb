class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_category)
    if @admin.save
      redirect_to backoffice_categories_path, notice: "Administrador #{@admin.email} registada com sucesso"
    else
      render :new
    end
  end

  def update

    pwd = params[:admin][:password]
    pwd_confirm = params[:admin][:password_confirmation]

    if pwd.blank? && pwd_confirm.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    if @admin.update(params_category)
      redirect_to backoffice_categories_path, notice: "Administrador #{@admin.description} actualizada com sucesso"
    else
      render :edit
    end
  end

  def edit

  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
