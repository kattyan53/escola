class OfficialAccountsController < ApplicationController
  before_action :set_official_account, only: [:show, :edit, :update, :destroy]

  # GET /official_accounts
  # GET /official_accounts.json
  def index
    @official_accounts = OfficialAccount.all
  end

  # GET /official_accounts/1
  # GET /official_accounts/1.json
  def show
  end

  # GET /official_accounts/new
  def new
    @official_account = OfficialAccount.new
  end

  # GET /official_accounts/1/edit
  def edit
  end

  # POST /official_accounts
  # POST /official_accounts.json
  def create
    @official_account = OfficialAccount.new(official_account_params)

    respond_to do |format|
      if @official_account.save
        format.html { redirect_to @official_account, notice: 'Official account was successfully created.' }
        format.json { render :show, status: :created, location: @official_account }
      else
        format.html { render :new }
        format.json { render json: @official_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /official_accounts/1
  # PATCH/PUT /official_accounts/1.json
  def update
    respond_to do |format|
      if @official_account.update(official_account_params)
        format.html { redirect_to @official_account, notice: 'Official account was successfully updated.' }
        format.json { render :show, status: :ok, location: @official_account }
      else
        format.html { render :edit }
        format.json { render json: @official_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /official_accounts/1
  # DELETE /official_accounts/1.json
  def destroy
    @official_account.destroy
    respond_to do |format|
      format.html { redirect_to official_accounts_url, notice: 'Official account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_official_account
      @official_account = OfficialAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def official_account_params
      params.fetch(:official_account, {})
    end
end
