require "csv"
class ImportersController < ApplicationController

  def import
  end

  def create

    begin
      file = params[:file]
      parsed_file = CSV.read(file.path)
      file_info = "#{file.original_filename}_#{DateTime.now.to_s}"
      @results = ::ImporterService.execute(parsed_file, file_info)
      flash[:success] = "File success imported"
    rescue => ex
      flash[:error] = "File error"
      return redirect_to root_path
    end

  end

end