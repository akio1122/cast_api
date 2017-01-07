require 'spec_helper'

describe Api::V1::FavoritesController do
  context 'when user logs in by email' do
    let!(:user) { FactoryGirl.create(:user, email: 'user@example.com') }

    context 'when adds favorites' do
      before { post '/api/v1/favorites', { amazon_ids: %w(one al123 breqw2344 a1), auth_token: user.auth_token } }

      it { expect(response).to be_success }

      context 'when gets favorites' do
        before { get 'api/v1/favorites', { auth_token: user.auth_token } }

        it { expect(response).to be_success }
        it { expect(result(response)['amazon_ids'].sort).to match(%w(a1 al123 breqw2344 one))}
      end

      context 'when deletes favorites' do
        before { delete '/api/v1/favorites/delete_collection', { amazon_ids: %w(one al123), auth_token: user.auth_token } }

        it { expect(response).to be_success }
        it { expect(result(response)['amazon_ids'].sort).to match(%w(a1 breqw2344)) }

        it do
          get 'api/v1/favorites', { auth_token: user.auth_token }
          expect(response).to be_success
          expect(result(response)['amazon_ids'].sort).to match(%w(a1 breqw2344))
        end
      end
    end
  end

  def result(response)
    JSON.parse(response.body)
  end
end
