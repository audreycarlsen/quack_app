require 'spec_helper'

describe QuacksController do
  let!(:quack) { create(:quack) }

  describe "GET 'index'" do
    it 'is successful' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @quacks' do
      get :index
      expect(assigns(:quacks).first).to be_an_instance_of Quack
    end

    it 'assigns @quack' do
      get :index
      expect(assigns(:quack)).to be_an_instance_of Quack
    end
  end

  describe "GET 'show'" do
    it 'is successful' do
      get :show, id: quack.id
      expect(response).to be_successful
    end

    it 'assigns @quack' do
      get :show, id: quack.id
      expect(assigns(:quack)).to be_an_instance_of Quack
    end
  end

  describe "POST 'create'" do
    it 'assigns @quack' do
      post :create, quack: quack.attributes
      expect(assigns(:quack)).to be_a Quack
    end

    context 'when valid' do
      it 'redirects to the index template' do
        post :create, quack: quack.attributes
        expect(response).to redirect_to quacks_path
      end
    end

    context 'when invalid' do
      it 'renders the index template' do
        post :create, quack: {body: 'blah'}
        expect(response).to render_template :index
      end
    end
  end
end
