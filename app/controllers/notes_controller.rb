class NotesController < ApplicationController
    def index
      @notes = Note.all
      # render :index
    end
  
    def show
      @note = Note.find(params[:id])
      # render :show
    end
  
    def new
      @note = Note.new
      # render :new
    end
  
    def create
      @note = Note.new(note_params)
      if @note.save
        redirect_to note_path(@note)
      else
        render :new
      end
    end
  
    def edit
      @note = Note.find(params[:id])
      # render :edit
    end
  
    def update
      @note = Note.find(params[:id])
      if @note.update(note_params)
        redirect_to note_path(@note)
      else
        render :edit
      end
    end
  
    def destroy
      @note = Note.find(params[:id]).destroy
      redirect_to notes_path
    end
  
    private
      def note_params
        params.require(:note).permit(:title, :body)
      end
  end
  