local users = {}

local loggedAs

local function ExistingAccount(user)
  return table.find(users, function (value)
    return value.user == user
  end)
end

function RegisterAccount( user, password, email)
  if (type(user) ~= "string" and type(password) ~= "string" and type(email) ~= "string") then
    return false
  end

  if (ExistingAccount(user)) then
    return print("Tente outro nome de usuário, pois esse já está sendo utilizado.")
  end

  table.insert(users, {user = user, password = password, email = email})

  return print("Usuário registrado com sucesso.")
end

function LoginAccount(user, password)
  if (type(user) ~= "string" and type(password) ~= "string") then
    return false
  end

  local ExistingAccount = ExistingAccount(user)

  if (not ExistingAccount) then
    return print("Usuário não existe no banco de dados.")
  end

  local account = users[ExistingAccount]

  if (account.password ~= password) then
    return print("As senhas que você digitou não são iguais. Por favor, verifique se digitou corretamente e tente novamente.")
  end


  loggedAs = account.user

  return print("Seja bem vindo: "..account.user)
end

local function DeleteUser(user)
  if (type(user) ~= "string") then
    return false
  end

  local ExistingAccount = ExistingAccount(user)

  if (not ExistingAccount) then
    return print("O nome de usuário que você digitou não foi encontrado em nosso banco de dados. Por favor, verifique se você digitou corretamente ou crie uma nova conta.")
  end

  local account = users[ExistingAccount]

  account = nil
  users[ExistingAccount] = nil

  return true
end


function Logout()
  if (not loggedAs) then
    return
  end

  DeleteUser(loggedAs)
  print("Usuário: "..loggedAs.. " saiu do sistema.")

  loggedAs = nil
end

function getUsers()
  return #users
end