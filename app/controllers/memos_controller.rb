class MemosController < ApplicationController
def index
	@memos = current_user.memos
	@memo = Memo.new
end

def create
	Memo.create(memo_params)
	@memos = current_user.memos
end

def destroy
	Memo.find(params[:id]).destroy
	@memos = current_user.memos
end

private
def memo_params
	params.require(:memo).permit(:text, :status).merge(user_id: current_user.id)
end

end
