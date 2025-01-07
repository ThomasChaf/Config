function b_install
    bundle install
    DISABLE_DEPARTURE=true rake db:migrate
    yi
end
