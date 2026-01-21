package org.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.example.domain.BoardVO;

import java.util.List;


@Mapper
public interface BoardMapper {
    List<BoardVO> getFavoriteList();
    List<BoardVO> getListByBook(String book);
    List<BoardVO> getList();
    BoardVO get(int id);
    void insert(BoardVO board);
    void update(BoardVO board);
    void delete(int id);
}