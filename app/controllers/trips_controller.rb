class TripsController < ApplicationController
  # Action index pour afficher la liste de tous les voyages
  def index
    @trips = Trip.all
  end

  # Action show pour afficher les détails d'un voyage spécifique
  def show
    @trip = Trip.find(params[:id])
  end

  # Action new pour afficher le formulaire de création d'un nouveau voyage
  def new
    @trip = Trip.new
  end

  # Action create pour créer un nouveau voyage à partir des données soumises par le formulaire
  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to @trip, notice: 'Le voyage a été créé avec succès.'
    else
      render :new
    end
  end

  # Action edit pour afficher le formulaire de modification d'un voyage existant
  def edit
    @trip = Trip.find(params[:id])

    # Convertit les valeurs de debut et fin en objets Date si elles sont des entiers
    @trip.debut = Time.at(@trip.debut).to_date if @trip.debut.is_a?(Integer)
    @trip.fin = Time.at(@trip.fin).to_date if @trip.fin.is_a?(Integer)
  end

  # Action update pour mettre à jour les détails d'un voyage avec les données soumises par le formulaire de modification
  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to @trip, notice: 'Le voyage a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  # Action destroy pour supprimer un voyage
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_url, notice: 'Le voyage a été supprimé avec succès.'
  end

  private

  # Méthode privée pour définir les paramètres autorisés lors de la création ou de la mise à jour d'un voyage
  def trip_params
    params.require(:trip).permit(:destination, :description, :debut, :fin, :user_id)
  end
end
