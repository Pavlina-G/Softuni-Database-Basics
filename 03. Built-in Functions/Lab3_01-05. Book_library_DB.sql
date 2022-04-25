SELECT title FROM books
WHERE substring(title, 1, 3) = 'The';

SELECT replace(title, 'The', '***') FROM books
WHERE substring(title, 1, 3) = 'The'
ORDER BY id;

SELECT round(sum(cost),2) FROM `books`;

SELECT concat(`first_name`, ' ', `last_name`) AS 'Full Name',
TIMESTAMPDIFF(DAY, `born`, `died`) AS 'Days Lived' FROM `authors`;

# ALTER TABLE books
# ADD fulltext(title);

# SELECT `title` FROM `books`
# WHERE match(title) against('Harry Potter')
# ORDER BY `id`;

SELECT `title` FROM `books`
WHERE title LIKE 'Harry Potter%'
ORDER BY `id`;
