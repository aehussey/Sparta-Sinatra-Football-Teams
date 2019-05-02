class TeamController < Sinatra::Base


  set :root, File.join(File.dirname(__FILE__), "..")

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $teams = [{
    id: 0,
    name: "Man City",
    points: 92,
    position: "1st"
    },
    {
    id: 1,
    name: "Liverpool",
    points: 91,
    position: "2nd"
    },
    {
    id: 2,
    name: "Spurs",
    points: 71,
    position: "3rd"
    },
    {
    id: 3,
    name: "Chelsea",
    points: 70,
    position: "4th"
    }]


  get "/" do

    @teams = $teams

    erb :'teams/index'

  end

  get "/new" do
    @teams = {
      id: "",
      name: "",
      points: "",
      position: ""
    }

    erb :'teams/new'
  end

  get "/:id" do
    id = params[:id].to_i
    @teams = $teams[id]
    erb :'teams/show'
  end

  get "/:id/edit" do
    id = params[:id].to_i

    @teams = $teams
    erb :'teams/edit'
  end

  post "/" do
    new_team = {
    id: $teams.length,
    name: params[:teamname],
    points: params[:points],
    position: params[:position]}

    $teams.push(new_team)

    redirect '/'

  end

  put "/:id" do
    "update page"
  end

  delete "/:id" do
    "Gonzo"
  end

end
