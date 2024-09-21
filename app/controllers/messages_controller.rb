class MessagesController < ApplicationController
  before_action :require_login
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  # def index
  #   @messages = Message.all
  # end

  # GET /messages/1 or /messages/1.json
  # def show
  # end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @chat = Chat.find(params[:chat_id].to_i)
    @message = Message.new(message_params.merge(user_id: current_user.id, chat_id: @chat.id))

    if @message.save
      # Broadcast the message using Turbo Streams
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append('messages', partial: 'messages/message', locals: { message: @message })
        end
        format.html { redirect_to @chat }
      end
    else
      render 'chats/show'
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy!

    respond_to do |format|
      format.html { redirect_to messages_path, status: :see_other, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:content)
  end
end
