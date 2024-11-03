class ChatsController < ApplicationController
  before_action :require_login
  before_action :set_chat, only: %i[ show edit update destroy ]

  # GET /chats or /chats.json
  def index
    @chats = current_user.chats
    @chat = Chat.new
  end

  # GET /chats/1 or /chats/1.json
  def show
    @message = Message.new
    @chat_name = @chat.chat_with ? @chat.users.pluck(:nickname).without(current_user.nickname).first : @chat.name
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats or /chats.json
  def create
    user = User.find_by(nickname: chat_params[:nickname])

    if user&.nickname && user.id != current_user.id
      @chat = Chat.new(name: user.nickname, chat_with: user.id)
    end

    respond_to do |format|
      if @chat.save
        ChatUser.create!(chat_id: @chat.id, user_id: user.id)
        ChatUser.create!(chat_id: @chat.id, user_id: current_user.id)

        format.html { redirect_to @chat, notice: "Chat was successfully created." }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1 or /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: "Chat was successfully updated." }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1 or /chats/1.json
  def destroy
    @chat.destroy!

    respond_to do |format|
      format.html { redirect_to chats_path, status: :see_other, notice: "Chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_chat
    @chat = Chat.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def chat_params
    params.require(:chat).permit(:name, :nickname)
  end
end
