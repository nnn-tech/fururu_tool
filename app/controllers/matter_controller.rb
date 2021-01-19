class MatterController < ApplicationController
  def test
    @matters = Matter.all
  end

  def production
    @matters = Matter.all
  end

  def list
    @matters = Matter.all
  end

  def new_import
    @matters = Matter.all 
  end
  
  def import
    Matter.import(params[:file])
    redirect_to("/matter/list")
  end

  def new
    @matter = Matter.new
  end

  def create
    @matter = Matter.new(
      name: params[:name], 
      english: params[:english], 
      rap: params[:rap],
      domain: params[:domain],
      rwd: params[:rwd].to_i,
      ssl: params[:ssl].to_i
    )
    if @matter.save
      redirect_to("/matter/list")
      flash[:notice] = "案件の追加に成功しました"
    else
      render("matter/new")
    end
  end

  def edit
    @matter = Matter.find_by(id: params[:id])
  end
  
  def update
    @matter = Matter.find_by(id: params[:id])
    @matter.name = params[:name]
    @matter.english = params[:english]
    @matter.rap = params[:rap]
    @matter.domain = params[:domain]
    @matter.rwd = params[:rwd].to_i
    @matter.ssl = params[:ssl].to_i
    if @matter.save
      redirect_to("/matter/list")
      flash[:notice] = "案件の編集に成功しました"
    else
      # redirect_to("/matter/#{@matter.id}/edit")
      render("matter/edit")
    end
  end

  def destroy
    @matter = Matter.find_by(id: params[:id])
    @matter.destroy
    redirect_to("/matter/list")
    flash[:notice] = "案件の削除に成功しました"
  end
end
