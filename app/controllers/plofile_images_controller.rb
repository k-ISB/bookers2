class PlofileImagesController < ApplicationController
  def new
    @plofile_image = PlofileImage.new
  end

  def create
  	@plofile_image = PlofileImage.new(plofile_image_params)
  	@plofile_image.user_id = current_user.id
  	@plofile_image.save
  	redirect_to user_path(user.id)
  end

  private

    def plofile_image_params
      params.require(:plofile_image).permit(:image)
end
