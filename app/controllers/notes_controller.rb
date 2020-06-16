class NotesController < ApplicationController

  def create
    note = Note.create!(note_params)
    render json: note
  end

  def show
    note = Note.find_by(id: params[:id])
    render json: note
  end

  def index 
    notes = Note.all 
    render json: notes, include: [:user]
  end

  private

  def note_params(*args)
    params.require(:note).permit(:title, :content, :user_id)
  end

end