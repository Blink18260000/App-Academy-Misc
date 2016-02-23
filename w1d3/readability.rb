def estimate_bank_account_retirement(age)
  half_age = age / 2
  childs_bank_estimate = half_age ** 2
  time_until_retirement = 65 - age
  childs_bank_estimate * time_until_retirement
end
