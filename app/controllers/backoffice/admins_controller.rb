class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "Administrador #{@admin.email} registada com sucesso"
    else
      render :new
    end
  end

  def update
    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to backoffice_admins_path, notice: "Administrador #{@admin.email} actualizada com sucesso"
    else
      render :edit
    end
  end

  def edit

  end

  def destroy
    admin_email = @admin.email
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "Administrador #{admin_email} Removido com sucesso"
    else
      render :index
    end

  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    pwd = params[:admin][:password]
    pwd_confirm = params[:admin][:password_confirmation]

    if pwd.blank? && pwd_confirm.blank?
      params[:admin].except!(:password, :password_confirmation)
    end

      if @admin.blank?
        params.require(:admin).permit(:name, :role, :email, :password, :password_confirmation)
      else
        params.require(:admin).permit(policy(@admin).permit_attributes)
      end
  end
end
