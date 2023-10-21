CREATE DATABASE W3zfny;

USE W3zfny;

GO
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(50),
    phone_number VARCHAR(20),
    address VARCHAR(100)
);

CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    email VARCHAR(50),
    password VARCHAR(50),
    phone_number VARCHAR(20),
    address VARCHAR(100)
);

CREATE TABLE job_categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    company_id INT,
    category_id INT,
    title VARCHAR(100),
    description TEXT,
    salary DECIMAL(10, 2),
    location VARCHAR(100),
    posted_date DATE,
    FOREIGN KEY (company_id) REFERENCES companies(company_id),
    FOREIGN KEY (category_id) REFERENCES job_categories(category_id)
);

CREATE TABLE applications (
    application_id INT PRIMARY KEY,
    user_id INT,
    job_id INT,
    status VARCHAR(10) CHECK (status IN ('pending', 'accepted', 'rejected')),
    application_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

CREATE TABLE resumes (
    resume_id INT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100),
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE skills (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(50)
);

CREATE TABLE seeker_skills (
    seeker_skill_id INT PRIMARY KEY,
    user_id INT,
    skill_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);

CREATE TABLE job_post_skills (
   job_post_skill_id INT PRIMARY KEY,
   job_posted_by_company INT NOT NULL,
   skill_required INT NOT NULL, 
   FOREIGN KEY (job_posted_by_company) REFERENCES companies(company_id), 
   FOREIGN KEY (skill_required) REFERENCES skills(skill_id)
);

CREATE TABLE seeker_job_post_skills (
   seeker_job_post_skill_id INT PRIMARY KEY, 
   seeker_user INT NOT NULL, 
   job_post_skill_required INT NOT NULL, 
   FOREIGN KEY (seeker_user) REFERENCES users(user_id), 
   FOREIGN KEY (job_post_skill_required) REFERENCES job_post_skills(job_post_skill_id)
);
