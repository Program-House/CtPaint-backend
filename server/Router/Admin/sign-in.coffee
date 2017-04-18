crypto = require "../../crypto"
verify = require "../../db/Admin/verify"
cryptico = require "cryptico"
app = (require "../../Main").getApp()

module.exports = (path) ->
    app.post path.get, (req, res) ->
        crypto.decrypt req.body.cipher, (json) ->
            verify.password json, (result) ->
                if result.msg is "success"
                    reply result, res


reply = (result, res) ->
    body =
        msg: "success"
        sessionToken: result.sessionToken

    encryption = cryptico.encrypt (JSON.stringify body), result.clientsKey

    if encryption.status is "success"
        res.send (JSON.stringify (cipher: encryption.cipher))
    else
        console.error "Encryption failed"