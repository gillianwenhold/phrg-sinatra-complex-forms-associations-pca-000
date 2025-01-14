# frozen_string_literal: true

class OwnersController < ApplicationController
  get "/owners" do
    @owners = Owner.all
    erb :'/owners/index'
  end

  get "/owners/new" do
    @pets = Pet.all
    erb :'/owners/new'
  end

  post "/owners" do
    @owner = Owner.create(params[:owner])
    pet = Pet.create(name: params["pet"]["name"])
    @owner.pets << pet unless params["pet"]["name"].empty?
    @owner.save
    redirect to "/owners/#{@owner.id}"
  end

  get "/owners/:id/edit" do
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
  end

  get "/owners/:id" do
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  post "/owners/:id" do
    @owner = Owner.find(params[:id])
    @owner.update(params["owner"])
    pet = Pet.create(name: params["pet"]["name"])
    @owner.pets << pet unless params["pet"]["name"].empty?
    redirect to "/owners/#{@owner.id}"
  end
end
