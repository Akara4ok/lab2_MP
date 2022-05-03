(* 1 *)
fun is_older (first_date : int*int*int, second_date : int*int*int) =
    if #1 first_date * 365 + #2 first_date * 31 + #3 first_date < #1 second_date * 365 + #2 second_date * 31 + #3 second_date
    then true
    else false;

val y = is_older((2005, 1, 30), (2005, 1, 31));


(* 2 *)
fun numbers_in_month (dates : (int*int*int) list, month : int) =
    if null dates
    then 0
    else (if #2 (hd dates) = month then 1 else 0) + numbers_in_month(tl dates, month); 

val y = numbers_in_month([(2005, 1, 30), (2005, 1, 30), (2005, 2, 30), (2005, 1, 30), (2005, 2, 30), (2005, 3, 30)], 1);

val y = numbers_in_month([(11, 12, 1), (10, 10, 10), (1, 2, 6)], 1)

(* 3 *)
fun numbers_in_months (dates : (int*int*int) list, months : int list) = 
    if null months
    then 0
    else numbers_in_month(dates, hd months) + numbers_in_months(dates, tl months);

val y = numbers_in_month([(11, 12, 1), (10, 10, 10), (1, 2, 6), (11, 12, 1), (10, 8, 10)], [12, 10, 9]);

val y = numbers_in_months([(2005, 1, 30), (2005, 1, 30), (2005, 2, 30), (2005, 1, 30), (2005, 2, 30), (2005, 3, 30)], [1, 3]);


(* 4 *)
fun dates_in_month (dates : (int*int*int) list, month : int) =
    if null dates
    then []
    else 
        if #2 (hd dates) = month 
        then hd dates :: dates_in_month(tl dates, month)
        else dates_in_month(tl dates, month);

val y = dates_in_month([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], 1);


(* 5 *)
fun dates_in_months (dates : (int*int*int) list, months : int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months);

val y = dates_in_months([(2001, 1, 30), (2002, 1, 30), (2003, 2, 30), (2004, 1, 30), (2005, 2, 30), (2006, 3, 30)], [1, 3]);


(* 6 *)
fun get_nth (strings : string list, n : int) =
    if n = 1
    then hd strings
    else get_nth (tl strings, n - 1);

val y = get_nth(["qwe1", "q2", "w3", "e4", "r5"], 6);


(* 7 *)
fun date_to_string(date : int*int*int) =
    get_nth([
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
    ], #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date);
    
val y = date_to_string((2022, 2, 28));


(* 8 *)
fun number_before_reaching_sum(sum : int, numbers : int list) =
    let fun reaching_sum(count: int, currSum: int, numbers : int list) =
        if (currSum + hd numbers >= sum)
        then count
        else reaching_sum(count + 1, currSum + hd numbers, tl numbers)
    in
        reaching_sum(0, 0, numbers)
    end;

val y = number_before_reaching_sum(6, [1, 2, 3, 4, 5]);


(* 9 *)
fun what_month(day: int) =
    number_before_reaching_sum(day, [31, 28, 31, 30, 31, 31, 30, 31, 30, 31, 30, 31]) + 1;

val y = what_month(365);


(* 10 *)
fun month_range(day1: int, day2: int) =
    if (day1 > day2)
    then []
    else what_month(day1) :: month_range(day1 + 1, day2);

val y = month_range(30, 1);

(* 11 *)
fun oldest_date (xs : (int*int*int) list) =
    if null xs
    then NONE
    else 
    let fun oldest_date_nonempty (xs : (int*int*int) list) =
            if null (tl xs)
            then hd xs
            else 
            let val tl_ans = oldest_date_nonempty(tl xs)
            in
                if is_older(hd xs, tl_ans)
                then hd xs
                else tl_ans
            end
    in
        SOME (oldest_date_nonempty(xs))
    end

val y = valOf(oldest_date([(2001, 1, 30), (2002, 1, 30), (2001, 2, 30), (2004, 1, 30), (2001, 1, 29), (2006, 3, 30)]));