package lk.ac.kln.dao;

import lk.ac.kln.dto.CreatePetFoodDto;
import lk.ac.kln.model.PetFood;

import java.util.List;
import java.util.Optional;

public interface PetFoodDao {
    List<PetFood> getAllFood();

    Optional<PetFood> getFoodByName(final String name);

    boolean saveFood(final CreatePetFoodDto petFoodDto);

    boolean deleteFood(final String name);

    Optional<PetFood> updateFood(final String name, final CreatePetFoodDto petFoodDto);
}
