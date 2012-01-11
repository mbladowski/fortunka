class FortunesController < ApplicationController
  # GET /fortunes
  # GET /fortunes.xml
  def index
    @fortunes = Fortune.order(:source).page(params[:page]).per(5)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fortunes }
      format.json { render :json => @fortunes }
      format.atom
  end


  end

  # GET /fortunes/1
  # GET /fortunes/1.xml
  def show
    @fortune = Fortune.find(params[:id])
    @comments = @fortune.comments.all
    @comment = Comment.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fortune }
      format.json { render :json => @fortune }
      format.atom
    end
  end


  # GET /fortunes/new
  # GET /fortunes/new.xml
  def new
    if(current_user)
      @fortune = Fortune.new
    else
      @fortune = Fortune.first
    end
    respond_with(@fortune)

  end

  # GET /fortunes/1/edit
  def edit
    @fortune = Fortune.find(params[:id])
  end

  # POST /fortunes
  # POST /fortunes.xml
  def create
    if(current_user)
      @fortune = Fortune.new(params[:fortune])
      @fortune.save
    else
      @fortune = Fortune.first
    end
    respond_with(@fortune)
  end

  # PUT /fortunes/1
  # PUT /fortunes/1.xml
  def update
    if(current_user)
      @fortune = Fortune.find(params[:id])
      @fortune.update_attributes(params[:fortune])
    else
      @fortune = Fortune.first
    end
    respond_with(@fortune)
  end

  # DELETE /fortunes/1
  # DELETE /fortunes/1.xml
  def destroy
    if(current_user)
      @fortune = Fortune.find(params[:id])
      @fortune.destroy
    else
      @fortune = Fortune.first
    end
    respond_with(@fortune)
  end

  def random
    @fortune = Fortune.find(Random.rand(Fortune.count)+1)
    @comments = @fortune.comments.all
    @comment = Comment.new
      respond_to do |format|
      format.html {render "fortunes/show" }
      format.xml  { render :xml => @fortune }
      format.json { render :json => @fortune }
    end
  end

end
