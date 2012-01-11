Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '4a771ba4f216bf095040', '4f44447f7c46d9cf6dcd725e43bacab5bf9c005d'
  provider :twitter, 'Ry6Kt37alrtDEZe3cvrTrA', 'r8faMkuq8pZqE6LSSnMHQGlpDi6tyv4o9QGZptanczw'
end