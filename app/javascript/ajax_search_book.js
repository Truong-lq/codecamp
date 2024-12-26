function AjaxSearchBook() {
  if (!(this instanceof AjaxSearchBook)) return new AjaxSearchBook();

  this.onChange = () => {
    const container = $("#js-ajax-search-book");
    const input = $("#query");
    const url = "/ajax_search_book";

    input.on("input", function () {
      $.ajax({
        url,
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          query: $(this).val(),
        }),
        success: (res) => {
          container.html(res);
        },
      });
    });
  };
}

AjaxSearchBook().onChange();
