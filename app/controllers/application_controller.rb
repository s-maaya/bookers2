class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
#（ユーザー登録、ログイン承認）が使われる場合、その前に上記が実行される。

def after_sign_in_path_for(resource)#ログイン後どこに飛びたいか記入する。（deviseで追加した機能は自動的にアクションが生成されるため、変更を加えるには行き先を記入しする必要がある
	user_path(current_user)
end

def after_sign_out_path_for(resource)
	root_path
end



protected
def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	#ユーザー登録（sign_up)の際にユーザー名（neme)のデータ操作が許可される。
end

def edit
	@user = User.find(params[:id])
end


def ensure_correct_user
    if @current_user.id != params[:id].to_i
    flash[:notice] = "権限がありません"
    redirect_to("root")
   end
  end




end
