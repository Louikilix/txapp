class ImageElementsController < ApplicationController

  def create
    definition = WritingDefinition.find(params[:writing_definition_id])
    definition.image_elements.create
    redirect_to writing_definition_path(definition)
  end   

  def update
    definition = WritingDefinition.find(params[:writing_definition_id])
    image_element = definition.image_elements.find(params[:id]) 
    if image_element.image.attach(image_element_params[:image])
      redirect_to writing_definition_path(definition)
    else
      render :edit
    end
  end

  def destroy
    definition = WritingDefinition.find(params[:writing_definition_id])    
    image_element = definition.image_elements.find(params[:id]) 
    image_element.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def image_element_params
      params.fetch(:image_element, {}).permit(:image)
    end

end