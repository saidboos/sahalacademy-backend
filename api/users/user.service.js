const pool = require('../../config/database');

module.exports = {
    create: (req, callBack) => {
        const sql = 'call sp_ga_user_register(?,?,?,?,?,?)';

        const values = [
            req.fname,
            req.lname,
            req.email,
            req.pass,
            req.phone,
            req.userType
        ]
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    login: (req, callBack) => {

        const sql = 'call sp__ga_user_login(?,?)';

        const values = [
            req.email,
            req.pass
        ]
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    userProfile: (req, callBack) => {

        const sql = 'call userprofile(?)';

        const values = [
            req.userid,
        ]
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    students: (req, callBack) => {

        const sql = 'call sp_thub_students(?)';

        const values = [
            req.userid,
        ]
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    createStudent: (req, callBack) => {

        const sql = 'call sp_thub_create_student(?,?,?,?,?,?,?,?,?,?)';

        const values = [
            req.userId,
            req.firstname,
            req.lastname,
            req.email,
            req.mobile,
            req.courseId,
            req.shift,
            req.classstatus,
            req.gender,
            req.city
        ]
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    updateStudent: (req, callBack) => {

        const sql = 'call sp_thub_update_student(?,?,?,?,?,?,?,?)';


        const values = [
            req.userId,
            req.studentId,
            req.firstname,
            req.lastname,
            req.email,
            req.mobile,
            req.courseId,
            req.shift
        ]
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    courses: (callBack) => {

        const sql = 'call sp_ga_courses()';


        pool.query(sql, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    createCourse: (req, callBack) => {

        const sql = 'call sp_ga_create_course(?,?,?,?,?, ?)';


        const values = [
            req.userId,
            req.courseName,
            req.courseFee,
            req.courseDesc,
            req.courseImage,
            req.courseLearn
        ]
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    
    updateCourse: (req, callBack) => {

        const sql = 'call sp_thub_update_course(?,?,?,?,?,?)';


        const values = [
            req.userId,
            req.courseId,
            req.coursename,
            req.coursefee,
            req.startdate,
            req.enddate
        ]
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    studentEnrolledCourses: (req, callBack) => {

        const sql = 'call sp_ga_student_courses(?)';

        const values = [
            req.userId
        ]
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    teacherCourses: (req, callBack) => {
        const sql = 'call sp_teacher_courses(?)';
        const values = [
            req.userId
        ]
        
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    getVideos: (req, callBack) => {

        const sql = 'call sp_ga_videos(?)';

        const values = [
            req.courseId
        ]
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    saveBilling: (req, callBack) => {

        const sql = 'call sp_save_billing(?,?,?,?,?,?,?,?,?,?,?,?)';


        const values = [
            req.userId,
            req.courseId,
            req.fname,
            req.lname,
            req.email,
            req.phone,
            req.country,
            req.city,
            req.refno,
            req.product,
            req.service,
            req.serviceAccount
        ]
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
    checkEnrollment: (req, callBack) => {

        const sql = 'call sp_check_course_enrollent(?,?)';

        const values = [
            req.userId,
            req.courseId
        ]
        pool.query(sql, values, (error, result) => {
            if (error)
                callBack(error)
            return callBack(null, result)
        })
    },
}