FactoryBot.define do
  factory :user do
    nickname              {'てすと'}
    email                 {'ttt@email'}
    password              {'ttt333'}
    password_confirmation {password}
    first_name            {'ててて'}
    last_name             {'すすす'}
    first_name_kana       {'テテテ'}
    last_name_kana        {'ススス'}
    birthday              {1980-3-5}
  end
end
