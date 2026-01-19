package org.example.domain;

import java.time.LocalDate;


public class BoardVO {
    public int id;
    public String book;
    public int chapter;
    public int verse;
    public String text;
    public boolean favorite;
    public LocalDate added_at;

    public BoardVO(){}

    public BoardVO(int id, String book, int chapter, int verse, String text, boolean favorite, LocalDate added_at) {
        this.id = id;
        this.book = book;
        this.chapter = chapter;
        this.verse = verse;
        this.text = text;
        this.favorite = favorite;
        this.added_at = added_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBook() {
        return book;
    }

    public void setBook(String book) {
        this.book = book;
    }

    public LocalDate getAdded_at() {
        return added_at;
    }

    public void setAdded_at(LocalDate added_at) {
        this.added_at = added_at;
    }

    public boolean isFavorite() {
        return favorite;
    }

    public void setFavorite(boolean favorite) {
        this.favorite = favorite;
    }

    public int getChapter() {
        return chapter;
    }

    public void setChapter(int chapter) {
        this.chapter = chapter;
    }

    public int getVerse() {
        return verse;
    }

    public void setVerse(int verse) {
        this.verse = verse;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

}

