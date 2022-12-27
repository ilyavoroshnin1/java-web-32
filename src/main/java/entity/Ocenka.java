package entity;

import java.util.Objects;

public class Ocenka {
    private int id;
    private Student student;
    private Term term;
    private Discipline discipline;
    private int ocenka;    // 1

    public Ocenka() {
    }

    @Override
    public String toString() {
        return "Ocenka{" +
                "id=" + id +
                ", student=" + student +
                ", term=" + term +
                ", discipline=" + discipline +
                ", ocenka=" + ocenka +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Ocenka ocenka1 = (Ocenka) o;
        return id == ocenka1.id && ocenka == ocenka1.ocenka && Objects.equals(student, ocenka1.student) && Objects.equals(term, ocenka1.term) && Objects.equals(discipline, ocenka1.discipline);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, student, term, discipline, ocenka);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Term getTerm() {
        return term;
    }

    public void setTerm(Term term) {
        this.term = term;
    }

    public Discipline getDiscipline() {
        return discipline;
    }

    public void setDiscipline(Discipline discipline) {
        this.discipline = discipline;
    }

    public int getOcenka() {
        return ocenka;
    }

    public void setOcenka(int ocenka) {
        this.ocenka = ocenka;
    }

    public Ocenka(int id, Student student, Term term, Discipline discipline, int ocenka) {
        this.id = id;
        this.student = student;
        this.term = term;
        this.discipline = discipline;
        this.ocenka = ocenka;
    }
}




// 1 - 24:00 почему такие поля. сложно, нужно смотреть
