class TagsController < ApplicationController

  def index
    @tags = Prototype.all_tags
  end

  def show
    @tag = Prototype.all_tags.find(params[:id])
    @prototype = Prototype.tagged_with(@tag.name)
  end

end
