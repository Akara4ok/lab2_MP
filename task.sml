(* 1 *)
fun is_older (first_date : int*int*int, second_date : int*int*int) =
    if #1 first_date * 365 + #2 first_date * 31 + #3 first_date < #1 second_date * 365 + #2 second_date * 31 + #3 second_date
    then true
    else false;


(* 2 *)
fun numbers_in_month (dates : (int*int*int) list, month : int) =
    if null dates
    then 0
    else (if #2 (hd dates) = month then 1 else 0) + numbers_in_month(tl dates, month); 


(* 3 *)
fun numbers_in_months (dates : (int*int*int) list, months : int list) = 
    if null months
    then 0
    else numbers_in_month(dates, hd months) + numbers_in_months(dates, tl months);


(* 4 *)
fun dates_in_month (dates : (int*int*int) list, month : int) =
    if null dates
    then []
    else 
        if #2 (hd dates) = month 
        then hd dates :: dates_in_month(tl dates, month)
        else dates_in_month(tl dates, month);


(* 5 *)
fun dates_in_months (dates : (int*int*int) list, months : int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months);


(* 6 *)
fun get_nth (strings : string list, n : int) =
    if n = 1
    then hd strings
    else get_nth (tl strings, n - 1);


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


(* 8 *)
fun number_before_reaching_sum(sum : int, numbers : int list) =
    let fun reaching_sum(count: int, currSum: int, numbers : int list) =
        if (currSum + hd numbers >= sum)
        then count
        else reaching_sum(count + 1, currSum + hd numbers, tl numbers)
    in
        reaching_sum(0, 0, numbers)
    end;


(* 9 *)
fun what_month(day: int) =
    number_before_reaching_sum(day, [31, 28, 31, 30, 31, 31, 30, 31, 30, 31, 30, 31]) + 1;


(* 10 *)
fun month_range(day1: int, day2: int) =
    if (day1 > day2)
    then []
    else what_month(day1) :: month_range(day1 + 1, day2);


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
    end;
