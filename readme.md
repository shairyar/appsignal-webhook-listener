A sinatra based application that you can use to listen to the webhook.

### Installation
1. Clone the repository
2. Run `bundle install`
3. Run `bundle exec ruby app.rb`

### Adding a notifier
1. Add a new class in the `lib/notifiers` directory that inherits from `BaseNotifier`
2. Implement the `listening_to?` and `notify` methods.
3. The job of the `listening_to?` method is to return a boolean value based on whether the notifier is listening to the webhook or not.
4. The job of the `notify` method is to send the payload to a third party service for example GitHub, Jira, Incident.io etc.

### Usage
1. Run the application
2. To test send a POST request to `http://localhost:4567/listener`.
```shell
curl -X POST http://localhost:4567/listener -H "Content-Type: application/json" -d '{"marker":{"time":"2019-01-10 10:45:41 +0100","marker_id":"5c3714455ac13f7df09437f0","site":"My test app","environment":"development","revision":"abc123","user":"tom","repository":"https://github.com/my_org/my_repo","url":"https://appsignal.com/test/sites/5bd867fa2213937f3666ae7b/dashboard"}}'
```