class UsersController < InheritedResources::Base
  actions :update

  def index
    paginate
    @users = User.limit(10).offset(@page * 10).order(:last_sign_in_at)
    @products = user.products
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def paginate
    @page = params['page'].to_i
    @prev_page = @page - 1 unless @page == 0
    @next_page = @page + 1 unless (@page*6 > User.count)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :passowrd_confirmation, :full_name, :street_address, :city, :state, :zip_code)
  end

end
