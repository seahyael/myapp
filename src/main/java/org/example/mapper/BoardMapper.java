package org.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.example.domain.BoardVO;

import java.util.List;


@Mapper
public interface BoardMapper {
    List<BoardVO> getList();
    BoardVO get(int id);
    void insert(BoardVO board);
    void update(BoardVO board);
}