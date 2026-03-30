-- Завдання: Обчислити середній бюджет проєкту за категорією

SELECT 
    category AS "Категорія", 
    ROUND(AVG(budget), 2) AS "Середній бюджет"
FROM projects
GROUP BY category
ORDER BY "Середній бюджет" DESC;

-- Завдання: Обчислити середній час завершення проєкту

SELECT 
    ROUND(AVG(end_date - start_date), 1) AS "Середній час завершення проєкту"
FROM contracts
WHERE status = 'completed' AND end_date IS NOT NULL;

-- Завдання: Ранжувати фрілансерів за рейтингом успішності контрактів 

SELECT 
    f.first_name || ' ' || f.last_name AS "Фрілансер",
    COUNT(c.contract_id) AS "Виконано проєктів",
    DENSE_RANK() OVER (ORDER BY COUNT(c.contract_id) DESC) as "Рейтинг"
FROM freelancers f
LEFT JOIN proposals p ON f.freelancer_id = p.freelancer_id
LEFT JOIN contracts c ON p.proposal_id = c.proposal_id AND c.status = 'completed'
GROUP BY f.freelancer_id, f.first_name, f.last_name;

-- Завдання: Визначити проєкти без пропозицій за певний період (СТЕ)

WITH ProjectsWithProposals AS (
    SELECT DISTINCT project_id 
    FROM proposals
)
SELECT 
    p.project_id, 
    p.title AS "Назва проєкту", 
    p.created_at AS "Дата створення"
FROM projects p
LEFT JOIN ProjectsWithProposals pwp ON p.project_id = pwp.project_id
WHERE pwp.project_id IS NULL 
  AND p.created_at >= '2026-01-01' AND p.created_at < '2026-03-30';
