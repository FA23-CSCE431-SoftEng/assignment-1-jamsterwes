class BooksController < ApplicationController
    # Show all
    def index
        @books = Book.all
    end

    # Show one
    def show
        @book = Book.find(params[:id])
    end

    # Actual page
    def new
        @book = Book.new
    end

    # Handler
    def create
        @book = Book.new(create_params)
        if @book.save
            redirect_to books_path, notice: "Book has been created!"
        else
            flash.alert = "Failed to create book!"
            render('new')
        end
    end

    # Handle create params
    private def create_params
        params.require(:book).permit(:title)
    end

    # Actual page
    def edit
        @book = Book.find(params[:id])
    end

    # Handler
    def update
        @book = Book.find(params[:id])
        if @book.update(update_params)
            redirect_to books_path, notice: "Book has been updated!"
        else
            flash.alert = "Failed to update book!"
            render('edit')
        end
    end

    # Handle update params
    private def update_params
        params.require(:book).permit(:title)
    end

    # Actual page
    def delete
        @book = Book.find(params[:id])
    end

    # Handler
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path, notice: "Book has been deleted!"
    end
end
