﻿create or replace package web_data_api is

    -- Author  : ASALKOV
    -- Created : 01.02.2021 14:31:46

    -- процедура получения данных для интерфейса по листу успеваемости
    function grade(p_data in varchar2) return clob;

    -- процедура получения данных для интерфейса по курсам
    function course(p_data in varchar2) return clob;

    -- процедура получения данных для интерфейса по студентам
    function student(p_data in varchar2) return clob;

    -- функция получения данных о оценке
    function post_grade(p_data in varchar2) return clob;

    -- функция записи данных о оценке
    function put_grade
        (
            p_code in number,
            p_data in varchar2
        )
        return varchar2;

    -- процедура удаления данных о оценке
    function delete_grade
        (
            p_code in number,
            p_data in varchar2
        )
        return varchar2;

    function init_data(p_data in varchar2) return clob;

end web_data_api;
/
create or replace package body web_data_api is

    gv_course_name ks_courses.name%type := 'Oracle + Vue';

    -- процедура получения данных по листу успеваемости
    function get_grades_cur(p_course_code in ks_grades_list.course_code%type -- Код курса
        ) return sys_refcursor
    is
        v_result sys_refcursor;
    begin
        open
            v_result
        for
            select
                a1.code                                         code,
                a1.student_code,
                a1.course_code,
                web_utils.date_to_unix_timestamp(a1.grade_date) grade_date,
                a1.grade                                        grade,
                a1.is_delete
            from
                ks_grades_list a1
            where
                a1.course_code = p_course_code;
        return v_result;
    end;

    -- процедура получения данных для интерфейса по листу успеваемости
    function grade(p_data in varchar2) return clob
    is
        l_course_code ks_courses.code%type;
    begin
        select
            nvl(code, 0)
        into
            l_course_code
        from
            ks_courses a1
        where
            a1.name = gv_course_name;
        return web_utils.cursor_to_json
               (
                   p_cursor    => get_grades_cur(l_course_code),
                   p_structure => '{"code" : "number", 
                                 "grade" : "number", 
                                 "is_delete" : "number", 
                                 "student_code" : "number", 
                                 "course_code" : "number", 
                                 "grade_date" : "number"}'
               );
    end;

    -- процедура получения данных для интерфейса по курсам
    function course(p_data in varchar2) return clob
    is
        l_cur sys_refcursor;
    begin
        open
            l_cur
        for
            select
                a1.code,
                a1.name,
                web_utils.date_to_unix_timestamp(a1.date_start) date_start,
                web_utils.date_to_unix_timestamp(a1.date_end)   date_end
            from
                ks_courses a1;
        return web_utils.cursor_to_json
               (
                   p_cursor    => l_cur,
                   p_structure => '{"code" : "number", "date_start" : "number", "date_end" : "number"}'
               );
    end;

    -- процедура получения данных для интерфейса по студентам
    function student(p_data in varchar2) return clob
    is
        l_cur sys_refcursor;
    begin
        open
            l_cur
        for
            select
                a1.code,
                a1.last_name || ' ' || a1.first_name || ' ' || a1.second_name full_name,
                web_utils.date_to_unix_timestamp(trunc(a1.datetime))          datetime
            from
                ks_students a1;
        return web_utils.cursor_to_json
               (
                   p_cursor    => l_cur,
                   p_structure => '{"code" : "number", "datetime" : "number"}'
               );
    end;

    -- функция получения данных о оценке
    function post_grade(p_data in varchar2) return clob
    is
        l_code         ks_grades_list.code%type;
        l_cur          sys_refcursor;
        l_student_code number;
        l_course_code  number;
        l_grade        number;
    begin
        l_student_code := json_object_t.parse(p_data).get_object('data').get_number('studentCode');
        l_course_code := json_object_t.parse(p_data).get_object('data').get_number('courseCode');
        l_grade := json_object_t.parse(p_data).get_object('data').get_number('grade');
        insert
        into
            ks_grades_list
            (
                student_code,
                course_code,
                grade_date,
                grade
            )
        values
            (
                l_student_code, /*/ => student_code /*/
                l_course_code,  /*/ => course_code  /*/
                sysdate,        /*/ => grade_date   /*/
                l_grade         /*/ => grade        /*/
            )
        returning
            code
        into
            l_code;
        -- Вернём строку
        open
            l_cur
        for
            select
                a1.code                                         code,
                a1.student_code,
                a1.course_code,
                web_utils.date_to_unix_timestamp(a1.grade_date) grade_date,
                a1.grade                                        grade,
                a1.is_delete
            from
                ks_grades_list a1
            where
                a1.code = l_code
            order by
                2;
        return web_utils.cursor_to_json
               (
                   p_cursor    => l_cur,
                   p_structure => '{"code" : "number", 
                                 "grade" : "number", 
                                 "is_delete" : "number", 
                                 "student_code" : "number", 
                                 "course_code" : "number", 
                                 "grade_date" : "number"}',
                   p_is_object => 1
               );
    end;

    -- функция записи данных о оценке
    function put_grade
        (
            p_code in number,
            p_data in varchar2
        )
        return varchar2
    is
        l_code  number;
        l_grade number;
    begin
        l_code := json_object_t.parse(p_data).get_object('data').get_number('code');
        l_grade := json_object_t.parse(p_data).get_object('data').get_number('grade');
        -- Обновим оценку
        update
            ks_grades_list a1
        set
            a1.grade    = l_grade,
            a1.datetime = sysdate
        where
            a1.code = l_code;
        return '{"resultCode" : 0}';
    exception
        when others then
            return '{"resultCode" : 1}';
    end;

    -- процедура удаления данных о оценке
    function delete_grade
        (
            p_code in number,
            p_data in varchar2
        )
        return varchar2
        is
    begin
        update
            ks_grades_list a1
        set
            a1.is_delete = 1
        where
            a1.code = p_code;
        return case when sql%rowcount = 1 then '{"resultCode" : 0}' else '{"resultCode" : 1}' end;
    end;

    function init_data(p_data in varchar2) return clob
        is
    begin
        delete
        from
            ks_grades_list;
        insert
        into
            ks_grades_list
            (
                student_code,
                course_code,
                grade_date,
                grade
            )
        select
            student_code, /*/ => student_code /*/
            course_code,  /*/ => course_code  /*/
            grade_date,   /*/ => grade_date   /*/
            grade         /*/ => grade        /*/
        from
            ks_grades_list_bck;
        return grade(p_data => p_data);
    end;

end web_data_api;
/
