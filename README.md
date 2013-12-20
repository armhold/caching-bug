### This program demonstrates what I believe to be [a bug](https://github.com/rails/rails/issues/10360) in ActionController::caches_action



### Notes
 
1. config/environments/test.rb has been modified with `config.action_controller.perform_caching = true`
2. Test runs leave caching files behind in tmp; best to `rm -rf tmp/*` between runs of the suite.
3. When [the tests](https://github.com/armhold/caching-bug/blob/master/test/functional/main_controller_test.rb) are run in succession, "first run" passes; "second run" fails, presumably because caching from the first test fails to save the `Cache-Control` header.
