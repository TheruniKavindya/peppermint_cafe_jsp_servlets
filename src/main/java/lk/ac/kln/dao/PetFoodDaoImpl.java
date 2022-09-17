package lk.ac.kln.dao;

import lk.ac.kln.dto.CreatePetFoodDto;
import lk.ac.kln.helper.DbConnection;
import lk.ac.kln.model.PetFood;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class PetFoodDaoImpl implements PetFoodDao {
    private static final String GET_ALL_PET_FOOD = "SELECT * FROM pet_food";
    private static final String GET_FOOD_BY_NAME = "SELECT * FROM pet_food WHERE name=?";
    private static final String ADD_FOOD = "INSERT INTO pet_food(name, description, price, imageurl)VALUES(?,?,?,?)";
    private static final String DELETE_FOOD = "DELETE FROM pet_food WHERE name=?";
    private static final String UPDATE_FOOD = "UPDATE pet_food SET name=?, description=?, price=?, imageurl=?";

    @Override
    public List<PetFood> getAllFood() {
        try {
            Connection con = DbConnection.getConnection();
            List<PetFood> petFoods = new ArrayList<>();
            PreparedStatement statement = con.prepareStatement(GET_ALL_PET_FOOD);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                PetFood petFood = new PetFood();
                petFood.setName(resultSet.getString("name"));
                petFood.setDescription(resultSet.getString("description"));
                petFood.setPrice(resultSet.getDouble("price"));
                petFood.setImageUrl(resultSet.getString("imageurl"));

                petFoods.add(petFood);
            }
            return petFoods;
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    @Override
    public Optional<PetFood> getFoodByName(String name) {
        try {
            Connection con = DbConnection.getConnection();
            PreparedStatement statement = con.prepareStatement(GET_FOOD_BY_NAME);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                PetFood petFood = new PetFood();
                petFood.setName(resultSet.getString("name"));
                petFood.setDescription(resultSet.getString("description"));
                petFood.setPrice(resultSet.getDouble("price"));
                petFood.setImageUrl(resultSet.getString("imageurl"));

                return Optional.of(petFood);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Optional.empty();
        }
        return Optional.empty();
    }

    @Override
    public boolean saveFood(CreatePetFoodDto petFoodDto) {
        try {
            Connection con = DbConnection.getConnection();
            Optional<PetFood> foundFood = getFoodByName(petFoodDto.getName());
            if (foundFood.isEmpty()) {
                PreparedStatement statement = con.prepareStatement(ADD_FOOD);
                statement.setString(1, petFoodDto.getName());
                statement.setString(2, petFoodDto.getDescription());
                statement.setDouble(3, petFoodDto.getPrice());
                statement.setString(4, petFoodDto.getImageUrl());
                statement.executeUpdate();

                return true;
            }
            return false;


        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean deleteFood(String name) {
        try {
            if (getFoodByName(name).isEmpty()) {
                return false;
            }
            Connection con = DbConnection.getConnection();
            PreparedStatement statement = con.prepareStatement(DELETE_FOOD);
            statement.setString(1, name);
            statement.executeUpdate();

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public Optional<PetFood> updateFood(String name, CreatePetFoodDto petFoodDto) {
        try {
            if (getFoodByName(name).isEmpty()) {
                return Optional.empty();
            }
            Connection con = DbConnection.getConnection();
            PreparedStatement statement = con.prepareStatement(UPDATE_FOOD);
            statement.setString(1, petFoodDto.getName());
            statement.setString(2, petFoodDto.getDescription());
            statement.setDouble(3, petFoodDto.getPrice());
            statement.setString(4, petFoodDto.getImageUrl());

            boolean updated = statement.executeUpdate() > 0;

            if (updated) {
                return getFoodByName(petFoodDto.getName());
            } else {
                return Optional.empty();
            }

        } catch (Exception e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }
}
