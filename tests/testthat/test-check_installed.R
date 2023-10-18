testthat::describe("Is a package installed? (mock example)", code = {
  testthat::describe("Set condition for un-installed pakcage", {
    testthat::it("Error message from check_installed()", {
      local_mocked_bindings(is_installed = function(package) FALSE)
      expect_error(check_installed("foo"))
    })
  })
  testthat::describe("Set condition for installed pakcage", {
    testthat::it("No error message from check_installed()", {
      local_mocked_bindings(is_installed = function(package) TRUE)
      expect_silent(check_installed("base"))
    })
  })
})
