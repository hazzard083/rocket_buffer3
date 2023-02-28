addCommandHandler("cmd_create", function (_, user, password, email) 
  RegisterAccount(user, password, email)
end)

addCommandHandler("cmd_login", function (_, user, password) 
  LoginAccount(user, password)
end)

addCommandHandler("cmd_logout", function (_, username, password)
  Logout()
end)


addCommandHandler("cmd_users", function ()
  iprint(getUsers())
end)