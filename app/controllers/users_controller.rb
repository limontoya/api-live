class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]
  after_action

  def index
    @users = User.all
    #render json: users, status: :ok
  end

  def show
    #@user = User.find(params[:id]) -- con el before action no se necesita show
    #render json: user, status: :ok
  end

  # creamos un nuevo usuario
  def create
    user = User.new(user_params)
    if user.save
      render json: {status: "Se creo el usuario"}, status: :ok
    else
      render json: {status: "Error al crear el usuario", errors: user.errors }, status: :unprocessable_entity
    end
  end

  def update
    #user = @user User.find(params[:id])
    if @user.update(user_params)
      render json: { status: "Usuario actualizado con exito" }, status: :ok
    else
      render json: { status: "Error actualizando el usuario" }, status: :unprocessable_entity
    end
  end

  def destroy
    #user = User.find(params[:id])
    if @user.destroy
      render json: { status: "Usuario eliminado con exito" }, status: :ok
    else
      render json: { status: "Error eliminando el usuario" }, status: :unprocessable_entity
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :phone)
  end
end
