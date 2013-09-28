class UserAuthenticationsController < ApplicationController
  # GET /user_authentications
  # GET /user_authentications.json
  def index
    @user_authentications = UserAuthentication.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_authentications }
    end
  end

  # GET /user_authentications/1
  # GET /user_authentications/1.json
  def show
    @user_authentication = UserAuthentication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_authentication }
    end
  end

  # GET /user_authentications/new
  # GET /user_authentications/new.json
  def new
    @user_authentication = UserAuthentication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_authentication }
    end
  end

  # GET /user_authentications/1/edit
  def edit
    @user_authentication = UserAuthentication.find(params[:id])
  end

  # POST /user_authentications
  # POST /user_authentications.json
  def create
    @user_authentication = UserAuthentication.new(params[:user_authentication])

    respond_to do |format|
      if @user_authentication.save
        format.html { redirect_to @user_authentication, notice: 'User authentication was successfully created.' }
        format.json { render json: @user_authentication, status: :created, location: @user_authentication }
      else
        format.html { render action: "new" }
        format.json { render json: @user_authentication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_authentications/1
  # PUT /user_authentications/1.json
  def update
    @user_authentication = UserAuthentication.find(params[:id])

    respond_to do |format|
      if @user_authentication.update_attributes(params[:user_authentication])
        format.html { redirect_to @user_authentication, notice: 'User authentication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_authentication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_authentications/1
  # DELETE /user_authentications/1.json
  def destroy
    @user_authentication = UserAuthentication.find(params[:id])
    @user_authentication.destroy

    respond_to do |format|
      format.html { redirect_to user_authentications_url }
      format.json { head :no_content }
    end
  end
end
