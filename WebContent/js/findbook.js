var pageSize = Number($("#pageS").val());
var page = 1;
var ref = "result-page-";
function prevpage() {
	$("#" + ref + page).css("display", "none");
	page--;
	if (page < 1) {
		page = pageSize;
	}
	$("#" + ref + page).removeAttr("style");
	r();
}
function nextpage() {
	$("#" + ref + page).css("display", "none");
	page++;
	if (page > pageSize) {
		page = 1;
	}
	$("#" + ref + page).removeAttr("style");
	r();
}
function r() {
	$("#currentPage").html("第" + page + "页，共" + pageSize + "页");
}
$("#btn_prev").click(prevpage);
$("#btn_next").click(nextpage);
r();
