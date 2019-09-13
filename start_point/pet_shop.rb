def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pets_sold)
  pet_shop[:admin][:pets_sold] += pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, input_pet_breed)
  amount_of_pets_by_breed = []
  for pet in pet_shop[:pets]
    if pet[:breed] == input_pet_breed
      amount_of_pets_by_breed << pet[:breed]
    end
  end
  return amount_of_pets_by_breed
end

def find_pet_by_name(pet_shop, input_pet_name)
  for pet in pet_shop[:pets]
    return pet if pet[:name] == input_pet_name
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_to_remove)
  # ---> avoid deleting items from working array?
  for pet in pet_shop[:pets]
    if pet[:name] == pet_to_remove
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
    return customer[:pets].length()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

# --- OPTIONAL ---

def customer_can_afford_pet(customer, new_pet)
  return customer[:cash] >= new_pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer)
  # check pet exists
  if pet != nil
    pet_name = pet[:name]
    amount = pet[:price]
    if customer_can_afford_pet(customer, pet) == true
      # ---> remove funds from customer
      remove_customer_cash(customer, amount)
      # ---> add funds to pet shop
      add_or_remove_cash(pet_shop, amount)
      # ---> remove pet from pet shop
      remove_pet_by_name(pet_shop, pet_name)
      # ---> add pet to customer
      add_pet_to_customer(customer, pet)
      # ---> increase pets sold value
      increase_pets_sold(pet_shop, 1)
    end
  end
end
