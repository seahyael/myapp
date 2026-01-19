package org.example.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.example.domain.BoardVO;
import org.springframework.stereotype.Service;
import javax.annotation.PostConstruct;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class RandomBible {

    private JsonNode bibleData;
    private final ObjectMapper mapper = new ObjectMapper();

    @PostConstruct
    public void init() {
        java.util.TimeZone.setDefault(java.util.TimeZone.getTimeZone("Asia/Seoul"));
        try (InputStream is = getClass().getResourceAsStream("/bible.json")) {
            JsonNode root = mapper.readTree(is);
            this.bibleData = root.get("verses");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 반환 타입을 String에서 BoardVO로 변경
    public BoardVO findVerseVO(int chapter, int verse) {
        if (bibleData == null || !bibleData.isArray()) return null;

        List<JsonNode> candidates = new ArrayList<>();
        for (JsonNode node : bibleData) {
            if (node.get("chapter").asInt() == chapter && node.get("verse").asInt() == verse) {
                candidates.add(node);
            }
        }

        if (candidates.isEmpty()) return null;

        JsonNode selected = candidates.get(new Random().nextInt(candidates.size()));

        // VO 객체 생성 및 데이터 세팅
        BoardVO vo = new BoardVO();
        vo.setBook(selected.get("book_name").asText()); // 실제 성경 이름 (예: 창세기)
        vo.setChapter(selected.get("chapter").asInt());
        vo.setVerse(selected.get("verse").asInt());
        vo.setText(selected.get("text").asText());

        return vo;
    }
}
