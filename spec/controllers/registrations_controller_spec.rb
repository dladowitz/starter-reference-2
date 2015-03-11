require 'rails_helper'

describe RegistrationsController do
  describe "GET new" do
    subject { get :new }

    it "returns the register template" do
      subject
      expect(response).to render_template :new
    end

    it "creates a new Registration object" do
      subject
      expect(assigns(:registration)).to be_a_new Registration
    end
  end

  describe "POST :create" do
    subject { post :create, registration: params }

    context "with valid params" do
      let(:params) { {email: "georg.ohm@gmail.com" } }

      it "creates a new registration in the database" do
        expect{subject}.to change{Registration.count}.by 1
      end

      it "renders the confirmation template" do
        subject
        expect(response).to redirect_to confirmation_registrations_path
      end
    end

    context "with invalid params" do
      let(:params) { { email: nil } }

      it "does NOT create a new registration in the dabtabase" do
        expect{subject}.not_to change{Registration.count}
      end

      it "re-renders the new template" do
        subject
        expect(response).to render_template :new
      end
    end
  end

  describe "GET confirmation" do
    subject { get :confirmation }

    it "renders the confrimation template" do
      subject
      expect(response).to render_template :confirmation
    end
  end
end
