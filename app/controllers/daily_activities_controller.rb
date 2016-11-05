get '/users/:user_id/daily_activities' do 
  @user = User.find(params[:user_id])
  @daily_activities = @user.daily_activities
  erb :'daily_activities/index'
end

get '/users/:user_id/daily_activities/new' do 
  @user = User.find(params[:user_id])
  erb :'partials/_daily_activities_form' 
end 