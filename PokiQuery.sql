--1. What grades are stored in the database?
SELECT Name
FROM Grade;

--2. What emotions may be associated with a poem?
SELECT Name
FROM Emotion;

--3. How many poems are in the database?
SELECT Count(Title)
FROM Poem;

--4. Sort authors alphabetically by name. What are the names of the top 76 authors?
SELECT TOP 76 Name
FROM Author
ORDER BY Name ASC;

--5. Starting with the above query, add the grade of each of the authors.
SELECT TOP 76(Author.Name), Grade.Name
FROM Author
LEFT JOIN Grade ON Author.GradeId = Grade.Id
ORDER BY Author.Name ASC;

--6. Starting with the above query, add the recorded gender of each of the authors.
SELECT TOP 76(Author.Name), Grade.Name, Gender.Name
FROM Author
LEFT JOIN Grade ON Author.GradeId = Grade.Id
LEFT JOIN Gender ON Author.GenderId = Gender.Id
ORDER BY Author.Name ASC;

--7. What is the total number of words in all poems in the database?
SELECT SUM(WordCount)
FROM Poem;

--8. Which poem has the fewest characters?
SELECT CharCount,Title
FROM Poem
WHERE CharCount = (SELECT MIN(CharCount) FROM Poem)

--9. How many authors are in the third grade?
SELECT COUNT(Grade.Name)
FROM Author
LEFT JOIN Grade ON Author.GradeId = Grade.Id
WHERE Grade.Name = '3rd Grade';

--10. How many authors are in the first, second or third grades?
SELECT COUNT(Grade.Name)
FROM Author
LEFT JOIN Grade ON Author.GradeId = Grade.Id
WHERE Grade.Name = '3rd Grade' OR Grade.Name = '2nd Grade' OR Grade.Name ='1st Grade';

--11. What is the total number of poems written by fourth graders?
SELECT COUNT(Poem.Title)
FROM Poem
LEFT JOIN Author on Poem.AuthorId = Author.Id
LEFT JOIN Grade ON Author.GradeId = Grade.Id
WHERE Grade.Name = '4th Grade';

--12. How many poems are there per grade?
SELECT Count(Poem.Title), Grade.Name
FROM Poem
LEFT JOIN Author on Poem.AuthorId = Author.id
LEFT JOIN Grade on Author.GradeId = Grade.id
GROUP BY Grade.Name;

--13. How many authors are in each grade? (Order your results by grade starting with `1st Grade`)
SELECT Count(Author.Name), Grade.Name
FROM Author
LEFT JOIN Grade ON Author.GradeId = Grade.id
GROUP BY Grade.Name;

--14. What is the title of the poem that has the most words?
SELECT WordCount, Title
FROM Poem
WHERE WordCount = (SELECT MAX(WordCount) FROM Poem);

--15. Which author(s) have the most poems? (Remember authors can have the same name.)

--16. How many poems have an emotion of sadness?
SELECT COUNT(Emotion.Name)
FROM Poem
LEFT JOIN PoemEmotion ON Poem.Id = PoemEmotion.Id 
LEFT JOIN Emotion ON PoemEmotion.EmotionId = Emotion.Id
WHERE Emotion.Name = 'Sadness';

--17. How many poems are not associated with any emotion?

--18. Which emotion is associated with the least number of poems?

--19. Which grade has the largest number of poems with an emotion of joy?

--20. Which gender has the least number of poems with an emotion of fear?