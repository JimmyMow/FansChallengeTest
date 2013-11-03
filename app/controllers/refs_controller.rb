class RefsController < ApplicationController

def index
  @refs = Ref.all
end

def show
  @ref = Ref.find_by_id(params[:id])
end

def new

end

def edit

end

def update

end

def destroy

end

end
