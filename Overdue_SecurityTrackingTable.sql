-- Brandon Nobles- Overdue & Security Tracking Table

CREATE TABLE OverdueSecurityTracking (
    user_id INT PRIMARY KEY,
    user_fname VARCHAR(50) NOT NULL,
    user_loc VARCHAR(100),
    device_loc VARCHAR(100),
    last_loc VARCHAR(100),
    is_enrolled BOOLEAN DEFAULT FALSE,
    is_faculty BOOLEAN DEFAULT FALSE,
    is_stolen BOOLEAN DEFAULT FALSE,
    is_lost BOOLEAN DEFAULT FALSE,
    malware_warning BOOLEAN DEFAULT FALSE,

    -- Foreign Key Constraints
    CONSTRAINT fk_tracking_user_student FOREIGN KEY (user_id)
        REFERENCES StudentInfo(StudentID)
        ON DELETE CASCADE,

    CONSTRAINT fk_tracking_user_faculty FOREIGN KEY (user_id)
        REFERENCES FacultyInfo(FacultyID)
        ON DELETE CASCADE
);

