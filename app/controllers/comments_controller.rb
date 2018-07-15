class CommentsController < ApplicationController

    def create
        logger.debug("comment/now")
        logger.debug(params[:user_id])

        @user = User.new(user_params)
        logger.debug(@user.user_id)

        @comment = @user.comments.build(comment_params) #②
        logger.debug(params[:user_id])

        @comment.user_id = @user.user_id #③
        @comment.company_id = params[:company_id]
        if @comment.save
            logger.debug("save in crear!!")
            logger.debug(@comment.company.comments)
            logger.debug("comment/all")
          render :index #comments/index.js.erbを探しに行っている
        end
    end
    
    def destroy
        @comment = Comment.find(params[:id]) #⑤
        if @comment.destroy
          render :index #⑥
        end
    end
    
    private
    def comment_params
        params.require(:comment).permit(:user_id, :content, :company_id)
    end

    def user_params
        params.require(:comment).permit(:user_id)
    end

end
