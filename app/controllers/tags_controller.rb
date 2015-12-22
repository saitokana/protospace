class TagsController < ApplicationController

  def index
	@tags = ActsAsTaggableOn::Tag.order('name ASC')
  end

  def show
    @prototypes = Prototype.tagged_with(params[:tag_name]).page(params[:page])
  end

end
