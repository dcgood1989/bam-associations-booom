def sign_up
  visit root_path

  within '.sign-up-form' do
    fill_in :user_email, with: 'test@galvanize.it'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'

    click_on 'Sign up'
  end
end
