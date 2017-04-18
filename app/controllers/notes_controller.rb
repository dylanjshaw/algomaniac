class NotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @notes = Note.where(user_id: current_user.id).order("updated_at DESC")
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    puts 'inside the create method'
    if @note.save
      respond_to do |format|
        format.html { redirect_to @note }
        format.json { render json: @note }
      end
    else
      render "new", status: 422
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(note_params)
      # flash[:success] = "Note updated successfully!"
      # redirect_to @ (connect) note
      render json: @note
    else
      # render "edit"
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note
      @note.destroy
      # flash[:success] = "Note destroyed!"
      redirect_to notes_path
    else
      status 404
    end
  end

  private
    def note_params
      params.require(:note).permit(:content, :user_id, :is_trash)
    end
end
