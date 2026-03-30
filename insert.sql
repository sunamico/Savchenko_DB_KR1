-- 1. Додаємо клієнтів
INSERT INTO clients (company_name, contact_email, contact_phone) VALUES
('Tech Nova LLC', 'contact@technova.com', '+380501234567'),
('Global Web Solutions', 'info@globalweb.net', '+380671112233'),
('Creative Design Agency', 'info@creativeda.ua', '+380639998877');

-- 2. Додаємо фрілансерів
INSERT INTO freelancers (first_name, last_name, skills, hourly_rate) VALUES
('Олександра', 'Коваленко', 'Python, Django, PostgreSQL', 35.00),
('Марія', 'Шевченко', 'UI/UX Design, Figma, Illustrator', 25.00),
('Іван', 'Франко', 'React, Node.js, TypeScript', 40.00),
('Олена', 'Бойко', 'SEO, Copywriting, Marketing', 20.00);

-- 3. Додаємо проєкти
INSERT INTO projects (client_id, title, description, budget, category, status, deadline) VALUES
(1, 'Розробка API для магазину', 'Потрібен RESTful API на Python.', 800.00, 'Backend', 'completed', '2026-03-15'),
(1, 'Редизайн головної сторінки', 'Новий дизайн у Figma.', 300.00, 'Design', 'in_progress', '2026-04-10'),
(2, 'Створення SPA на React', 'Фронтенд для CRM системи.', 1500.00, 'Web Development', 'open', '2026-05-01'),
(3, 'Написання SEO-статей', 'Пакет з 10 статей для блогу.', 250.00, 'Writing', 'open', '2026-04-15'),
(2, 'Аудит бази даних', 'Оптимізація запитів у PostgreSQL.', 400.00, 'Database', 'completed', '2026-02-28');

-- 4. Додаємо пропозиції 
INSERT INTO proposals (project_id, freelancer_id, proposed_price, created_at) VALUES
(1, 1, 800.00, '2026-02-10 10:00:00'), 
(2, 2, 300.00, '2026-03-05 14:30:00'), 
(3, 1, 1400.00, '2026-03-25 09:15:00'), 
(3, 3, 1500.00, '2026-03-26 11:45:00'), 
(4, 4, 200.00, '2026-03-28 16:20:00'), 
(5, 1, 400.00, '2026-01-15 08:00:00'); 

-- 5. Додаємо контракти
INSERT INTO contracts (proposal_id, status, start_date, end_date) VALUES
(1, 'completed', '2026-02-12', '2026-03-10'), -- Проєкт 1 успішно завершено
(2, 'active', '2026-03-10', NULL),            -- Проєкт 2 зараз в процесі 
(6, 'completed', '2026-01-20', '2026-02-25'); 
