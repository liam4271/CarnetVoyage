class UsersController < ApplicationController
  # Action index pour afficher la liste de tous les utilisateurs
  def index
    @users = User.all
  end

  # Action show pour afficher les détails d'un utilisateur spécifique
  def show
    @user = User.find(params[:id])
  end

  # Action new pour afficher le formulaire de création d'un nouvel utilisateur
  def new
    @user = User.new
  end

  # Action create pour créer un nouvel utilisateur à partir des données soumises par le formulaire
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'L\'utilisateur a été créé avec succès.'
    else
      render :new
    end
  end

  # Action edit pour afficher le formulaire de modification d'un utilisateur existant
  def edit
    @user = User.find(params[:id])
    # ... Autres logiques d'édition si nécessaires
  end

  # Action update pour mettre à jour les détails d'un utilisateur avec les données soumises par le formulaire de modification
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to @user, notice: 'L\'utilisateur a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  # Action destroy pour supprimer un utilisateur
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    redirect_to users_url, notice: 'L\'utilisateur a été supprimé avec succès.'
  end

  private

  # Méthode privée pour définir les paramètres autorisés lors de la création ou de la mise à jour d'un utilisateur
  def user_params
    params.require(:user).permit(:name, :email)
    # Ajoutez ici tous les attributs de l'utilisateur que vous voulez autoriser dans le formulaire
  end
end
