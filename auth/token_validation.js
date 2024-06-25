const { verify } = require('jsonwebtoken')

module.exports = {
    checkToken: (req, res, next) => {
        let token = req.get('authorization');
        if(token){
            token = token.slice(7);
            verify(token, 'qwe123', (err, decoded)=>{
                if(err){
                    res.json({
                        code:'406',
                        message:'Invalid token'
                    });
                } else {
                    next();
                }
            });
        } else {
            res.json({
                code:'405',
                message: 'Access denied! unautorized user'
            });
        }
    }
}