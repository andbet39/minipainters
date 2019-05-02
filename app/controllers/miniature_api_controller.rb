class MiniatureApiController < ApplicationController
  def getMinis
    minias = Miniature.all

    render json:minias.to_json(methods: %i[picture_urls])
  end
  
  def getMini
    mini =Miniature.find(params[:id])
   # render json:mini.to_json(methods: %i[picture_urls] , :include => user)
    render json:mini.to_json({:include => :user, :methods => :picture_urls})
  end

  def alreadyVoted 
    mini = Miniature.find(params[:miniId])
    if current_user != nil
      res = current_user.voted_for? mini
    else
      res = false
    end
    render json: res
  end
  
  def getNextMini

    latestId =  params[:latestId]

    nextMini = Miniature.where('id > ?', latestId).first
    render json:nextMini.to_json(methods: %i[picture_urls])

  end


  def voteMini

    miniId =  params[:id]
    vote = params[:vote]

    mini = Miniature.find(miniId)
    mini.vote_by :voter => current_user, :vote_weight => vote

    render json:mini.to_json(methods: %i[picture_urls])

  end

  def analyzeMini
    mini = Miniature.find(1)
    vis = VisionService.new
    vis.analyze(mini.pictures[0])
  end
end
