teach_message <- function(args) {
  fun_name <- rlang::ctxt_frame(n = 2)$fn_name
  if (length(args) <= 1) {
    message(
      fun_name,
      " call can be substituted with:\n",
      "theme(",
      paste(names(args), args, sep = " = "),
      ")"
    )
  } else {
    message(
      fun_name,
      " call can be substituted with:\n",
      "theme(\n  ",
      paste(names(args), args, sep = " = ", collapse = ",\n  "),
      "\n)"
    )
  }
}
