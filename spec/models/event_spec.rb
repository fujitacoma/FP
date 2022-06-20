require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.create(:event)
    sleep 0.1
  end

  describe '新規イベント投稿' do
    context '新規投稿できる場合' do
      it '必要な情報が適切に入力されている場合投稿できる' do
        expect(@event).to be_valid
      end
    end

    context '新規投稿できない場合' do
      it 'imageが空では投稿できない' do
        @event.image = nil
        @event.valid?
        expect(@event.errors.full_messages).to include "Image can't be blank"
      end
      it 'event_nameが空では投稿できない' do
        @event.event_name = ''
        @event.valid?
        expect(@event.errors.full_messages).to include "Event name can't be blank"
      end
      it 'contentが空では投稿できない' do
        @event.content = ''
        @event.valid?
        expect(@event.errors.full_messages).to include "Content can't be blank"
      end
      it 'prefecture_idが1(---)では投稿できない' do
        @event.prefecture_id = 1
        @event.valid?
        expect(@event.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'ユーザー情報が紐づいていないと投稿できない' do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include 'User must exist'
      end
    end
  end
end

