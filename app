import React, { useState } from 'react';
import Header from './Header';
import StudentListItem from './StudentListItem';
import MarkedAttendanceDisplay from './MarkedAttendanceDisplay';

const App = () => {
  const className = 'Class XYZ';
  const date = 'August 28, 2023';

  const initialStudentList = [
    { id: 1, name: 'Student A', attendance: false, timestamp: null },
    { id: 2, name: 'Student B', attendance: false, timestamp: null },
    // ... other students
  ];

  const [students, setStudents] = useState(initialStudentList);
  const [markedAttendance, setMarkedAttendance] = useState([]);

  const handleToggleAttendance = (studentId) => {
    const updatedStudents = students.map((student) =>
      student.id === studentId
        ? { ...student, attendance: !student.attendance, timestamp: new Date().toLocaleTimeString() }
        : student
    );

    const newlyMarkedStudents = updatedStudents.filter((student) => student.attendance);

    setStudents(updatedStudents);
    setMarkedAttendance(newlyMarkedStudents);
  };

  return (
    <div className="app">
      <Header className={className} date={date} />
      <div className="content">
        <div className="student-list">
          {students.map((student) => (
            <StudentListItem
              student={student}
              onToggleAttendance={handleToggleAttendance}
            />
          ))}
        </div>
        <MarkedAttendanceDisplay markedAttendance={markedAttendance} />
      </div>
    </div>
  );
};

export default App;
