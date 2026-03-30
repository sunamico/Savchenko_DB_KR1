-- Створюємо тип для статусів проєкту
CREATE TYPE project_status AS ENUM (
    'open', 
    'in_progress', 
    'completed', 
    'cancelled'
);

-- Створюємо тип для статусів контракту
CREATE TYPE contract_status AS ENUM (
    'active', 
    'completed', 
    'failed'
);
DROP TYPE IF EXISTS project_status CASCADE;
DROP TYPE IF EXISTS contract_status CASCADE;

-- 1. Клієнти
CREATE TABLE IF NOT EXISTS clients (
    client_id SERIAL PRIMARY KEY,
    company_name VARCHAR(124) NOT NULL,
    contact_email VARCHAR(124) UNIQUE NOT NULL,
    contact_phone VARCHAR(16)
);

-- 2. Фрілансери
CREATE TABLE IF NOT EXISTS freelancers (
    freelancer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    skills TEXT, 
    hourly_rate DECIMAL(10, 2) NOT NULL
);

-- 3. Проєкти
CREATE TABLE IF NOT EXISTS projects (
    project_id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(client_id) ON DELETE CASCADE,
    title VARCHAR(124) NOT NULL,
    description TEXT,
    budget DECIMAL(12, 2) NOT NULL,
    category VARCHAR(124) NOT NULL, 
    status project_status DEFAULT 'open', 
    deadline DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Пропозиції
CREATE TABLE IF NOT EXISTS proposals (
    proposal_id SERIAL PRIMARY KEY,
    project_id INT REFERENCES projects(project_id) ON DELETE CASCADE,
    freelancer_id INT REFERENCES freelancers(freelancer_id) ON DELETE CASCADE,
    proposed_price DECIMAL(12, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Контракти 
CREATE TABLE IF NOT EXISTS contracts (
    contract_id SERIAL PRIMARY KEY,
    proposal_id INT UNIQUE REFERENCES proposals(proposal_id) ON DELETE CASCADE,
    status contract_status DEFAULT 'active', 
    start_date DATE NOT NULL,
    end_date DATE 
);
