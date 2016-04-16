class UsersController < ApplicationController

  def index
    @users = User.all
    #render json: users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    #render json: user, status: :ok
  end

  # creamos un nuevo usuario
  def createe
    user = User.new(user_params)
    if user.save
      render json: {status: "Se creo el usuario"}, status: :ok
    else
      render json: {status: "Error al crear el usuario", errors: user.errors }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: { status: "Usuario actualizado con exito" }
    else
      render json: { status: "mateo" }, status: :ok
    end
  end

  def user_params
    params.require(:user).permit(:name, :phone)
  end
end
