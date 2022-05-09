use "task.sml";

fun test(function_name : string, true_result, fact_result) =
    if true_result = fact_result
    then (function_name, "Ok")
    else (function_name, "Failed");

(* 1 *)
test("is_older", true, is_older((2005, 1, 30), (2005, 1, 31)));
test("is_older", false, is_older((2010, 2, 2), (2005, 5, 31)));
test("is_older", false, is_older((2005, 1, 30), (2005, 1, 30)));


(* 2 *)
test("numbers_in_month", 3, numbers_in_month([(2005, 1, 30), (2005, 1, 30), (2005, 2, 30), (2005, 1, 30), (2005, 2, 30), (2005, 3, 30)], 1));
test("numbers_in_month", 0, numbers_in_month([(2005, 1, 30), (2005, 1, 30), (2005, 2, 30), (2005, 1, 30), (2005, 2, 30), (2005, 3, 30)], 5));
test("numbers_in_month", 1, numbers_in_month([(2005, 1, 30), (2005, 1, 30), (2005, 2, 30), (2005, 1, 30), (2005, 2, 30), (2005, 3, 30)], 3));


(* 3 *)
test("numbers_in_months", 4, numbers_in_months([(2005, 1, 30), (2005, 1, 30), (2005, 2, 30), (2005, 1, 30), (2005, 2, 30), (2005, 3, 30)], [1, 3]));
test("numbers_in_months", 2, numbers_in_months([(2005, 1, 30), (2005, 1, 30), (2005, 2, 30), (2005, 1, 30), (2005, 2, 30), (2005, 3, 30)], [2, 5]));
test("numbers_in_months", 0, numbers_in_months([(2005, 1, 30), (2005, 1, 30), (2005, 2, 30), (2005, 1, 30), (2005, 2, 30), (2005, 3, 30)], []));


(* 4 *)
test("dates_in_month", [(2001, 1, 30), (2002, 1, 30), (2004, 1, 30)], dates_in_month([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], 1));
test("dates_in_month", [], dates_in_month([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], 5));
test("dates_in_month", [(2006, 3, 30)], dates_in_month([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], 3));


(* 5 *)
test("dates_in_months", [(2001, 1, 30), (2002, 1, 30), (2004, 1, 30), (2006, 3, 30)], dates_in_months([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], [1, 3, 8]));
test("dates_in_months", [], dates_in_months([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], [4, 5]));
test("dates_in_months", [], dates_in_months([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], []));


(* 6 *)
test("get_nth", "e4", get_nth(["qwe1", "q2", "w3", "e4", "r5"], 4));
test("get_nth", "qwe1", get_nth(["qwe1", "q2", "w3", "e4", "r5"], 1));
test("get_nth", "r5", get_nth(["qwe1", "q2", "w3", "e4", "r5"], 5));


(* 7 *)
test("date_to_string", "February 28, 2022", date_to_string((2022, 2, 28)));
test("date_to_string", "April 2, 2010", date_to_string((2010, 4, 2)));
test("date_to_string", "December 12, 2012", date_to_string((2012, 12, 12)));


(* 8 *)
test("number_before_reaching_sum", 3, number_before_reaching_sum(7, [1, 2, 3, 4, 5]));
test("number_before_reaching_sum", 2, number_before_reaching_sum(6, [1, 2, 3, 4, 5]));
test("number_before_reaching_sum", 0, number_before_reaching_sum(4, [10, 2, 3, 4, 5]));


(* 9 *)
test("what_month", 8, what_month(215));
test("what_month", 1, what_month(1));
test("what_month", 12, what_month(365));


(* 10 *)
test("month_range", [], month_range(30, 1));
test("month_range", [1, 1, 2], month_range(30, 32));
test("month_range", [3, 3, 3], month_range(70, 72));


(* 11 *)
test("month_range", NONE, oldest_date([]));
test("month_range", SOME (2001, 1, 29), oldest_date([(2001, 1, 30), (2002, 1, 30), (2001, 2, 30), (2004, 1, 30), (2001, 1, 29), (2006, 3, 30)]));
test("month_range", SOME (2015, 1, 31), oldest_date([(2015, 2, 31), (2015, 2, 31), (2015, 1, 31)]));