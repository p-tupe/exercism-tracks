local BankAccount = {}

function BankAccount:new (account)
  account = { _balance = 0, _isOpen = true }
  return setmetatable(account, { __index = BankAccount })

  -- [[
  -- Simple mental model :
  --
  --   t.__index = t ==> Expose methods of t to any objects that inherit t
  --   setmetatable(o, t) ==> Make o inherit from t
  --
  --   1. Assume we have t = { x: "abc" } and o = {}
  --   2. And we do o.x, program first checks if o.x exists
  --   3. Since it doesn't, it checks if parent table has __index field
  --   4. Since it does, it checks if parent.value (here t.x) exists
  --   5. Which does, so we get o.x = "abc"
  --
  -- ]]
end

function BankAccount:close ()
  self._isOpen = false
end

function BankAccount:balance ()
  return self._balance
end

function BankAccount:deposit (d)
  assert(self._isOpen, "Account Closed!")
  assert(d > 0, "Amount must be greated than 0!")
  self._balance = self._balance + d
end

function BankAccount:withdraw (w)
  assert(self._isOpen, "Account Closed!")
  assert(w > 0, "Amount must be greated than 0!")
  assert(w < self._balance, "Overdraw not allowed!")
  self._balance = self._balance - w
end

return BankAccount
