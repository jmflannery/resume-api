ResumeApi::Application.routes.draw do
  mount Toke::Engine => '/toke'
  mount Rez::Engine => '/rez'
end
