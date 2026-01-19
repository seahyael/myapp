package org.example.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
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

    // 서버 시작 시 JSON 파일을 메모리에 로드
    @PostConstruct
    public void init() {
        try (InputStream is = getClass().getResourceAsStream("/bible.json")) {
            JsonNode root = mapper.readTree(is);
            this.bibleData = root.get("verses");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String findVerse(int chapter, int verse) {
        if (bibleData == null || !bibleData.isArray()) return "데이터 로드 실패";

        List<JsonNode> candidates = new ArrayList<>();
        for (JsonNode node : bibleData) {
            if (node.get("chapter").asInt() == chapter && node.get("verse").asInt() == verse) {
                candidates.add(node);
            }
        }

        if (candidates.isEmpty()) return "해당 구절 없음";

        // 랜덤 선택
        JsonNode selected = candidates.get(new Random().nextInt(candidates.size()));
        return String.format("%s %d:%d — %s",
                selected.get("book_name").asText(),
                selected.get("chapter").asInt(),
                selected.get("verse").asInt(),
                selected.get("text").asText());
    }
}
