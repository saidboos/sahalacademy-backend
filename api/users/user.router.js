const {
    create,
    login,
    profile,
    students,
    createStudent,
    updateStudent,
    createCourse,
    courses,
    updateCourse,
    studentEnrolledCourses,
    teacherCourses,
    getVideos,
    saveBilling,
    checkEnrollment,
    pay
} = require('./user.controller')
const router = require('express').Router();
const { checkToken } = require('../../auth/token_validation')


router.post('/register', create);
router.post('/login', login);
router.post('/profile', profile);
router.post('/students', students);
router.post('/createstudent', createStudent);
router.post('/updatestudent', updateStudent);
router.post('/courses', courses);
router.post('/createcourse', createCourse);
router.post('/updatecourse', updateCourse);
router.post('/studentenrolledcourses', studentEnrolledCourses);
router.post('/studentenrolledcourses', studentEnrolledCourses);
router.post('/teachercourses', teacherCourses);
router.post('/coursevideos', getVideos);
router.post('/savebilling', saveBilling);
router.post('/checkenrollment', checkEnrollment)
router.post('/makepayment', pay)

module.exports = router;