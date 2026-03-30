-- 1. Додамо нового фрілансера
INSERT INTO freelancers (first_name, last_name, skills, hourly_rate) 
VALUES ('Анна', 'Дорошенко', 'QA, Manual Testing, Postman', 15.00);

-- 2. Додамо новий проєкт
INSERT INTO projects (client_id, title, description, budget, category, status, deadline) 
VALUES (1, 'Тестування API', 'Потрібно протестувати створений API', 150.00, 'QA', 'open', '2026-03-20');

-- 1. Збільшим бюджет відкритого проєкту на 50% 
UPDATE projects 
SET budget = budget * 1.50 
WHERE project_id = 3 AND status = 'open';

-- 2. Змінимо ставку фрілансера
UPDATE freelancers 
SET hourly_rate = 30.00 
WHERE freelancer_id = 2;

-- 1. Видалимо пропозицію 
DELETE FROM proposals 
WHERE proposal_id = 5;

-- 2. Видалимо проєкт
DELETE FROM projects 
WHERE project_id = 4;

-- 1. Знайдем всі відкриті проєкти в конкретній категорії 
SELECT project_id, title, budget, deadline 
FROM projects 
WHERE status = 'open' AND category = 'Web Development';

-- 2. Знайдем всі виконані проєкти заданого фрілансера 
SELECT p.title, p.budget, c.end_date
FROM projects p
JOIN proposals pr ON p.project_id = pr.project_id
JOIN contracts c ON pr.proposal_id = c.proposal_id
WHERE pr.freelancer_id = 1 AND c.status = 'completed';
