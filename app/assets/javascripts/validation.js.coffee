jQuery ->
  $("[data-validate~=parsley]").parsley(
    errors: {
      classHandler: (el) -> ($ el).closest("div.input")
      errorsWrapper: "<div></div>",
      errorElem: "<span></span>"
    }
  )