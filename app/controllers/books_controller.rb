require 'roo'

class BooksController < ApplicationController
  def index
    @books = Book.order(params[:sort] + ' ' + params[:direction])
  end

  def create
    @book = Book.create(params[:book])
    redirect_to Book
  end

  def fetch_xlsx_data
    path = File.expand_path('../../public/BookData.xlsx',__dir__)
    file = Roo::Excelx.new(path)

    (2..file.last_row).each do |line|
      title = file.cell(line, 'A')
      author = file.cell(line, 'B')
      description = file.cell(line, 'C')
      edition = file.cell(line, 'D')
      year = file.cell(line, 'E')
      price = file.cell(line, 'F')

      @book = Book.create(:title => title,
                          :author => author,
                          :description => description,
                          :edition => edition,
                          :year => year,
                          :price => price)

    end
    redirect_to Book

  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :description, :edition, :year, :price)
  end
end