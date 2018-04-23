require 'rails_helper'
describe BlocksController do
  def valid_attributes
    {:game_id => 1}
  end

  describe "GET index" do
    it "assigns all blocks as @blocks" do
      block = Block.create! valid_attributes
      get :index
      assigns(:blocks).should eq([block])
    end
  end

  describe "GET show" do
    it "assigns the requested block as @block" do
      block = Block.create! valid_attributes
      get :show, params: { id: block.id }
      assigns(:block).should eq(block)
    end
  end

  describe "GET new" do
    it "assigns a new block as @block" do
      get :new
      assigns(:block).should be_a_new(Block)
    end
  end

  describe "GET edit" do
    it "assigns the requested block as @block" do
      block = Block.create! valid_attributes
      get :edit, params: { id: block.id }
      assigns(:block).should eq(block)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Block" do
        expect {
          post :create, params: { block: valid_attributes }
        }.to change(Block, :count).by(1)
      end

      it "assigns a newly created block as @block" do
        post :create, params: { block: valid_attributes }
        assigns(:block).should be_a(Block)
        assigns(:block).should be_persisted
      end

      it "redirects to the created block" do
        post :create, params: { block: valid_attributes }
        response.should redirect_to(Block.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved block as @block" do
        # Trigger the behavior that occurs when invalid params are submitted
        Block.any_instance.stub(:save).and_return(false)
        post :create, params: { block: {} }
        assigns(:block).should be_a_new(Block)
      end


    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested block" do
        block = Block.create! valid_attributes
        # Assuming there are no other blocks in the database, this
        # specifies that the Block created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Block.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, params: { id: block.id, block: {'these' => 'params'} }
      end

      it "assigns the requested block as @block" do
        block = Block.create! valid_attributes
        put :update, params: { id: block.id, block: valid_attributes }
        assigns(:block).should eq(block)
      end

      it "redirects to the block" do
        block = Block.create! valid_attributes
        put :update, params: { id: block.id, block: valid_attributes }
        response.should redirect_to(block)
      end
    end

    describe "with invalid params" do
      it "assigns the block as @block" do
        block = Block.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Block.any_instance.stub(:save).and_return(false)
        put :update, params: { id: block.id, block: {} }
        assigns(:block).should eq(block)
      end


    end
  end

  describe "DELETE destroy" do
    it "destroys the requested block" do
      block = Block.create! valid_attributes
      expect {
        delete :destroy, params: { id: block.id }
      }.to change(Block, :count).by(-1)
    end


  end

end
