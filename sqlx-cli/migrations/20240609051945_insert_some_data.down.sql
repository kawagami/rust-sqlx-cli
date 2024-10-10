-- Add down migration script here
DELETE FROM blogs
WHERE title IN ('第一篇博客', '第二篇博客');

