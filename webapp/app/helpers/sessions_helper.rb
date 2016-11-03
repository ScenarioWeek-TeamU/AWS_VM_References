module SessionsHelper

    def sign_in(user)
        session[:user_id] = user.id
        self.current_user = user
    end

    #setter
    def current_user=(user)
        @current_user = user
    end

    #getter
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def signed_in?
        !current_user.nil?
    end

    def sign_out
        session[:user_id] = nil
        self.current_user = nil
    end

    def current_user?(user)
        user == current_user
    end

    def deny_access
        redirect_to signin_path, :notice => "Please login to access this page"
    end


     def enter_project(project)
        session[:pid] = project.id
        self.current_project = project
    end

    #setter
    def current_project=(project)
        @current_project = project
    end

    #getter
    def current_project
        @current_project ||= Project.find(session[:pid]) if session[:pid]
    end
end
