package org.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.example.domain.UserVO;

import java.util.List;

@Mapper
public interface UserMapper {
    UserVO findByUsername(String username);
    int countByUsername(String username);
    void register(UserVO user);
}