Root = require "./root"
Post = require "./post"

module.exports = (next) ->
    (payload) ->

        dest =
            Root.url "api/admin/signin"

        body =
            username: payload[0]
            password: payload[1]

        Post dest, body, next

