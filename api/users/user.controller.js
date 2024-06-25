const { json } = require('express');
const {
    create,
    login,
    userProfile,
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
    checkEnrollment
}
    = require('./user.service');
const { sign } = require('jsonwebtoken')
const request = require('request');

module.exports = {
    create: (req, res) => {
        const body = req.body;
        create(body, (err, results) => {
            if (err) {
                console.log(err)
                return res.status(500).json({
                    success: 0,
                    message: err
                });
            }

            return res.status(200).json(
                results[0][0])
        });
    },
    login: (req, res) => {
        const body = req.body;
        login(body, (err, results) => {
            if (err) {
                console.log(err)
                return res.status(500).json({
                    success: 0,
                    message: err
                });
            }

            const result = results[0][0];


            if (result.code === '100') {
                var userType = results[1][0].userType


                const user = {
                    uType: userType,
                    userId: results[1][0].userId,
                    firstName: results[1][0].firstName,
                    lastName: results[1][0].lastName,
                    userEmail: results[1][0].userEmail,
                    phoneNumber: results[1][0].phoneNumber,
                }

                const jsontoken = sign({ data: user }, "qwe123", {
                    expiresIn: '30m'
                })


                return res.status(200).json(
                    { ...result, userId: results[1][0].userId, token: jsontoken }
                )
            } else if (result.code === '101') {

                return res.status(200).json(
                    result
                )
            } else {
                return res.status(500).json(
                    results
                )
            }

        });
    },
    profile: (req, res) => {
        const body = req.body;
        userProfile(body, (err, results) => {
            if (err) {
                console.log(err)
                return res.status(500).json({
                    success: 0,
                    message: err
                });
            }

            return res.status(200).json({
                userProfile: results[0][0],
                recentStudents: results[1],
                activeStudents: results[2][0].activeStudents,
                activeCourses: results[3][0].activeCourses
            })
        });
    },
    students: (req, res) => {
        const body = req.body;
        students(body, (err, results) => {
            if (err) {
                console.log(err)
                return res.status(500).json({
                    success: 0,
                    message: err
                });
            }

            return res.status(200).json({
                students: results[0],
            })
        });
    },
    createStudent: (req, res) => {
        const body = req.body;
        getVideos(body, (err, results) => {
            if (err) {
                console.log(err)
                return res.status(500).json({
                    success: 0,
                    message: err
                });
            }

            return res.status(200).json(
                results[0][0],
            )
        });
    },
    updateStudent: (req, res) => {
        const body = req.body;
        updateStudent(body, (err, results) => {
            if (err) {
                console.log(err)
                return res.status(500).json({
                    success: 0,
                    message: err
                });
            }

            return res.status(200).json(
                results[0][0],
            )
        });
    },
    courses: (req, res) => {
        courses((err, results) => {
            if (err) {
                console.log(err)
                return res.status(500).json({
                    success: 0,
                    message: err
                });
            }

            var courses = results[0]
            var coursesWithObjs = []
            var objs = results[1]
            courses.forEach(loopCourses);

            function loopCourses(course) {
                var newCourse = { ...course, objs: [] }
                objs.forEach(obj => {
                    if (course.courseId == obj.courseId) {
                        delete obj.courseId
                        newCourse.objs.push(obj)
                    }
                })

                coursesWithObjs.push(newCourse)
            }




            return res.status(200).json({
                courses: coursesWithObjs
            })
        });
    },
    createCourse: (req, res) => {
        const body = req.body;
        if (body.userId == '' || body.courseName == '' || body.courseFee == '' || body.courseDesc == '' || body.courseImage == ''|| body.courseLearn == '' || body.courseLearn === undefined) {
            return res.status(200).json({
                code: "105",
                message: 'Enter all required data'
            })
        } else {
            createCourse(body, (err, results) => {
                if (err) {
                    console.log(err)
                    return res.status(500).json({
                        success: 0,
                        message: err
                    });
                }

                return res.status(200).json(
                    results[0][0],
                )
            });
        }
    },
    updateCourse: (req, res) => {
        const body = req.body;
        updateCourse(body, (err, results) => {
            if (err) {
                console.log(err)
                return res.status(500).json({
                    success: 0,
                    message: err
                });
            }

            return res.status(200).json(
                results[0][0],
            )
        });
    },
    studentEnrolledCourses: (req, res) => {
        const body = req.body;
        studentEnrolledCourses(body, (err, results) => {
            if (err) {
                console.log(err)
                return res.status(500).json({
                    success: 0,
                    message: err
                });
            }

            console.log(results)
            const code = results[0][0].code;

            if (code === '100')
                return res.status(200).json({
                    code: results[0][0].code,
                    message: results[0][0].message,
                    enrolledCourses: results[1]
                })

            return res.status(200).json({
                code: results[0][0].code,
                message: results[0][0].message
            })
        });
    },
    teacherCourses: (req, res) => {
        const body = req.body;
        teacherCourses(body, (err, results) => {
            if (err) {
                console.log(err)
                return res.status(500).json({
                    success: 0,
                    message: err
                });
            }

            const code = results[0][0].code;

            if (code === '100')
                return res.status(200).json({
                    code: results[0][0].code,
                    message: results[0][0].message,
                    teacherCourses: results[1]
                })

            return res.status(200).json({
                code: results[0][0].code,
                message: results[0][0].message
            })
        });
    },
    getVideos: (req, res) => {
        const body = req.body;
        getVideos(body, (err, results) => {
            if (err) {
                console.log(err)
                return res.status(500).json({
                    success: 0,
                    message: err
                });
            }


            const code = results[0][0].code;
            if (code === '102' || code === '103')
                return res.status(200).json({
                    code: results[0][0].code,
                    message: results[0][0].message,
                })




            return res.status(200).json({
                code: results[0][0].code,
                message: results[0][0].message,
                videos: results[1],
            })
        });
    },
    saveBilling: (req, res) => {
        const body = req.body;
        if (body.userId == '' || body.fname == '' || body.lname == '' || body.email == '' || body.mobile == '') {
            return res.status(200).json({
                code: "105",
                message: 'Enter all the required data'
            })
        } else {
            saveBilling(body, (err, results) => {
                if (err) {
                    console.log(err)
                    return res.status(500).json({
                        success: 0,
                        message: err
                    });
                }

                return res.status(200).json(
                    results[0][0],
                )
            });
        }
    },

    checkEnrollment: (req, res) => {
        const body = req.body
        checkEnrollment(body, (err, results) => {
            if (err) {
                return res.status(500).json({
                    success: 0,
                    message: err
                });
            }

            return res.status(200).json(
                results[0][0],
            )
        })
    },

    pay: (req, res) => {

        // var returnBody = new Promise((resolve, reject) => {

        // })

        var username = process.env.ONE
        var password = process.env.TWO

        // var payReq = {
        //     account: "252907417769",
        //     gateway: "waafi",
        //     amount: "5",
        //     currency: "USD",
        //     order_id: "ABC123"
        // }

        var payReq = req.body

        console.log(payReq)

        var options = {
            url: process.env.U,
            method: 'POST',
            json: true,
            body: payReq,
            auth: {
                user: username,
                password: password
            }
        }

        request(options, (err, re, body) => {
            if (err) {
                console.dir(err)
                return
            }

            return res.status(200).json({
                code: body.code,
                message:body.response
            }
            )
        })


    }
}