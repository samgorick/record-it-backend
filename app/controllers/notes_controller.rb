class NotesController < ApplicationController

  def create
    note = Note.create!(note_params)
    params[:tags].each do |tag|
      t = Tag.find_by(name: tag)
      note.tags << t
    end
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

  def update
    note = Note.find_by(id: params[:id])
    note.update(note_params)
    note.tags.destroy_all
    params[:tags].each do |tag|
      t = Tag.find_by(name: tag)
      note.tags << t
    end
    render json: note
  end

  def destroy
    notetags = Notetag.where(note_id: params[:id])
    notetags.destroy_all
    note = Note.find_by(id: params[:id])
    note.destroy
    render json: {}
  end

  private

  def note_params(*args)
    params.require(:note).permit(:id, :title, :content, :user_id)
  end

end