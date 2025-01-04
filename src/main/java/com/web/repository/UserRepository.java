package com.web.repository;

import com.web.entity.User;
import com.web.enums.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    @Query("select u from User u where u.email = :email")
    Optional<User> findByEmail(@Param("email") String email);

    @Query("select u from User u where u.role = :role")
    List<User> findByRole(@Param("role") Role role);

    @Query("select u from User u where u.activationKey = :key and u.email = :email")
    Optional<User> getUserByActivationKeyAndEmail(@Param("key") String key, @Param("email") String email);

    @Query("select count(u.id) from User u where u.role = :role")
    Double countAdmin(@Param("role") Role role);

    @Query("SELECT u FROM User u " +
            "WHERE (CAST(u.id AS string) LIKE %:keyword% " +
            "OR u.email LIKE %:keyword% " +
            "OR u.fullName LIKE %:keyword% " +
            "OR u.address LIKE %:keyword% " +
            "OR u.phone LIKE %:keyword%) " +
            "AND u.role = :role")
    List<User> findByRoleAndKeywordIgnoreCase(@Param("role") Role role, @Param("keyword") String keyword);




}
