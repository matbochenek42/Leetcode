# 🕵️ Leetcode - Rozwiązane Problemy 

## 📚 Spis treści
- **TLDR**
- **Struktura Repozytorium**
- **Opis Plików**
- **Autor**

## 🔎 TLDR

<p style="text-align:justify;">
Niniejsze Repozytorium zawiera wszystkie rozwiązane przeze mnie problemy na Leetcode za pomocą SQL (MySQL i PostgreSQL) oraz Pythona (w tym Pandas). 

Mój profil na Leetcode znajduje się [tutaj](https://leetcode.com/u/SmO7BWmsiz/)

Stan aktualizacji: 17.11.2025 r.
</p>

## 🧱 Struktura Repozytorium

| Plik | Opis |
|----------------|-------------|
| **pandas_problems.py** | Problemy rozwiązane za pomocą biblioteki Pandas |
| **python_problems.py** | Problemy rozwiązane za pomocą Pythona |
| **README.md** | Opis Repozytorium |
| **sql_problems.sql** | Problemy rozwiązane za pomocą SQL |

## 📝 Opis Plików

<p style="text-align:justify;">
Każdy z trzech plików zawiera tematyczne rozwiązania zgodnie z nazwą pliku. Nazwa problemu jest zapisana w komentarzu, a poniżej znajduje się odpowiedni kod. Dodatkowo, w pliku sql_problems.sql pod nazwą problemu znajduje się komentarz z nazwą silnika bazy danych.
</p>

**Przykładowy problem** - [1484. Group Sold Products By The Date](https://leetcode.com/problems/group-sold-products-by-the-date/description/)

```sql
--1484. Group Sold Products By The Date

-- Write your PostgreSQL query statement below

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG(DISTINCT product, ',' ORDER BY product) AS products
FROM
    Activities
GROUP BY
    sell_date
ORDER BY
    sell_date;
```
## ✒️ Autor

- **Author:** Mateusz Bochenek
- **Mail:** matbochenek42@gmail.com
- **GitHub link:** https://github.com/matbochenek42
- **LeetCode link:** https://leetcode.com/u/SmO7BWmsiz/