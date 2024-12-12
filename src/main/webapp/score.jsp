
<%--
  Created by IntelliJ IDEA.
  User: brian
  Date: 12/1/2024
  Time: 4:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm" lang="en">
<head>
    <meta charset="UTF-8">

    <!-- Favicon -->
    <link href="img/favicon.png" rel="icon">

  <%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.7.6/css/layui.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/layui/2.7.6/layui.js"></script>

--%>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <!-- Favicon -->
    <link href="img/favicon.png" rel="icon">


    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/iconfont.css">
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/index.js"></script>


</head>

<script type='text/javascript' data-cfasync='false'>window.purechatApi = { l: [], t: [], on: function () { this.l.push(arguments); } }; (function () { var done = false; var script = document.createElement('script'); script.async = true; script.type = 'text/javascript'; script.src = 'https://app.purechat.com/VisitorWidget/WidgetScript'; document.getElementsByTagName('HEAD').item(0).appendChild(script); script.onreadystatechange = script.onload = function (e) { if (!done && (!this.readyState || this.readyState == 'loaded' || this.readyState == 'complete')) { var w = new PCWidget({c: 'e6a74b84-385b-46d3-86a6-979a93598bfc', f: true }); done = true; } }; })();</script>
<body>

<!-- top start -->
<div class="container" style="background: #064d5d">
    <div class="left_open">
        <a><i title="Expand the left column" class="iconfont" style="color: #FFFFFF">&#xe699;</i></a>
    </div>
    <div class="logo">
        <a href="index.html">
            <svg
                    class="lucide lucide-classroom"
                    stroke-linejoin="round"
                    stroke-linecap="round"
                    stroke-width="2"
                    stroke="white"
                    fill="none"
                    viewBox="0 0 24 24"
                    height="14"
                    width="14"
                    xmlns="http://www.w3.org/2000/svg"
            >
                <rect x="2" y="5" width="20" height="14" rx="2"></rect>
                <line x1="2" y1="9" x2="22" y2="9"></line>
                <line x1="6" y1="17" x2="10" y2="17"></line>
                <line x1="14" y1="17" x2="18" y2="17"></line>
            </svg>


            School page</a>
    </div>
  <%--  <span id="login-user">👨‍🎓 <%= session.getAttribute("student_name") %></span>--%>
    <ul class="layui-nav right" style="margin-right: 50px;" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">👨‍🎓 <span id="login-user"> <%= session.getAttribute("student_name") %></span></a>
            <dl class="layui-nav-child">
                <dd><a href="students_login.jsp">Change account</a></dd>
                <dd><a href="./index.html">Exit</a></dd>
            </dl>
        </li>
    </ul>

</div>
<!-- start end -->
<!-- center start -->
<!-- left menu start -->
<div class="left-nav" style="background: #068999">
    <div id="side-nav"  >
        <ul id="nav" >

            <li class="layui-nav-item home" >
                <a href="javascript:;" >
                    <i class="layui-icon iconfont left-nav-li" style="color: #FFFFFF">&#xe68e;</i>
                    <cite style="color: #FFFFFF">My Grades</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>

        </ul>
        <%--<ul id="nav" >
            <li class="layui-nav-item home" >
                <i class="layui-icon">&#xe68e;</i>
                <cite>My Grades</cite>
        </ul>--%>
    </div>
</div>


<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false" >
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>My Grades</li></ul>

        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5">
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="classid" name="classid"  placeholder="Class ID" autocomplete="off" class="layui-input">
                                </div>

                                <%--<div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="classname" name="classname"  placeholder="Class Name" autocomplete="off" class="layui-input">
                                </div>--%>
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="coursenanme" name="coursenanme"  placeholder="Course Name" autocomplete="off" class="layui-input">
                                </div>

                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" class="layui-input"  autocomplete="off" placeholder="Score" name="score" id="score">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="term" name="term"  placeholder="Term" autocomplete="off" class="layui-input">
                                </div>


                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn"  lay-submit lay-filter="search" style="background: #ff8321"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>

                        <div class="layui-card-body layui-table-body layui-table-main">
                            <!-- Using the method of rendering, you only need a table selector-->
                            <table class="layui-hide" id="st_score" lay-filter="test"></table>
                        </div>

                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
<div class="page-content-bg"></div>
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="edit">Edit</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">Del</a>
</script>


<script>


    layui.use(['laydate','form','table','layer'], function(){
        var layer = layui.layer
            ,table = layui.table
            ,laydate = layui.laydate
            ,form = layui.form;

        var gradesData = <%= request.getAttribute("gradesJson") %>;
        //Table data loading and rendering
        table.render({
            elem: '#st_score' //Specifies the table ID to render
            ,height: '300px' //Set table height
            ,data: gradesData //Specify the JSON file to load data
            ,page: { //Define toolbar
                layout: ['count', 'prev', 'page', 'next', 'skip'] //Customize Toolbar content
                ,groups: 5 //Display up to 5 consecutive page numbers
            }
            ,limit:10
            ,cellMinWidth: 35 //Defines the minimum width of a regular cell
            //,toolbar: '#toolbarDemo'
            ,title: 'Blog list'
            ,cols: [[
                {type: 'checkbox'}, // Add checkbox column
                {field: 'classid', title: 'CLASS ID', width: 130},
                {field: 'classname', title: 'CLASS NAME', width: 150, sort: true},
                {field: 'coursenanme', title: 'COURSE NAME', width: 120, sort: true},
                {field: 'score', title: 'SCORE', width: 100, sort: true},
                {field: 'term', title: 'TERM', width: 130, sort: true}
            ]]
        });


        form.on('submit(search)', function(data) {
            // Parse the `gradesData` variable, assuming it's already passed as JSON


            // Extract query parameters
            var filters = data.field;

            // Filter `gradesData` based on input criteria
            var filteredData = gradesData.filter(item => {
                return (!filters.classid || item.classid.includes(filters.classid)) &&
                    (!filters.classname || item.classname.toLowerCase().includes(filters.classname.toLowerCase())) &&
                    (!filters.coursenanme || item.coursenanme.toLowerCase().includes(filters.coursenanme.toLowerCase())) &&
                    (!filters.score || Number(item.score) === Number(filters.score)) &&
                    (!filters.term || item.term.toLowerCase().includes(filters.term.toLowerCase()));
            });

            // Render the filtered data
            table.render({
                elem: '#st_score',
                height: '300px',
                data: filteredData, // Directly pass the filtered data
                page: {
                    layout: ['count', 'prev', 'page', 'next', 'skip'],
                    groups: 5
                },
                limit: 10,
                cellMinWidth: 35,
                title: 'Filtered Data',
                cols:[[
                    {type: 'checkbox'}, // Add checkbox column
                    {field: 'classid', title: 'CLASS ID', width: 130},
                    {field: 'classname', title: 'CLASS NAME', width: 150, sort: true},
                    {field: 'coursenanme', title: 'COURSE NAME', width: 120, sort: true},
                    {field: 'score', title: 'SCORE', width: 100, sort: true},
                    {field: 'term', title: 'TERM', width: 130, sort: true}
                ]]
            });

            return false;
        });



    });



</script>
</body>
</html>
