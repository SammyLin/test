module RedactorRails
    class PicturesController < ApplicationController

      def index
	@pictures = Redactor.picture_model.find_all(redactor_pictures_scope)
	respond_with(@pictures)
      end

      def create
	@picture = Redactor::Picture.new
	respond_with_asset(@picture)
      end

      def destroy
	@picture.destroy
	respond_with(@picture, :location => pictures_path)
      end

      protected

      def find_asset
	@picture = Redactor.picture_model.get!(params[:id])
      end
    end
end
