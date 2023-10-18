testthat::describe("Is a package installed? (mock example)", code = {
  testthat::describe("Set condition for un-installed pakcage", {
    testthat::it("Error message from check_installed()", {
      local_mocked_bindings(is_installed = function(package) {
        FALSE # value for is_installed
      })
      expect_error(check_installed("foo"))
    })
  })
  testthat::describe("Set condition for installed pakcage", {
    testthat::it("No error message from check_installed()", {
      local_mocked_bindings(is_installed = function(package) {
        TRUE # value for is_installed
      })
      expect_no_error(object = check_installed("base"))
    })
  })
})
