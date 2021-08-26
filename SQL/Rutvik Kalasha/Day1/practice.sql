Alter statement

(1). Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table referencing to the primary key JobId of jobs table.

--> ALTER TABLE Job_History ADD CONSTRAINT fk_Job_Id FOREIGN KEY (Job_Id) REFERENCES Jobs(Job_Id);

(2). Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column which is referencing to the JobId of jobs table.

--> ALTER TABLE Job_History DROP FOREIGN KEY fk_Job_Id;

(3). Write a SQL statement to add a new column named location to the JobHistory table.

--> ALTER TABLE Job_History ADD location VARCHAR(50);