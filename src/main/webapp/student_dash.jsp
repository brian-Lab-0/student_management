<%@ page import="model.StudentGrade" %>
<%@ page import="java.util.List" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%--
  Created by IntelliJ IDEA.
  User: brian
  Date: 11/29/2024
  Time: 7:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <!-- Favicon -->
    <link href="img/favicon.png" rel="icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/index.js"></script>

    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        /* Top Navigation Bar */
        .top-bar {
            display: flex;
            justify-content: inherit;
            background-color: #457b9d;
            color: white;
            padding: 10px 20px;
            font-size: 20px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .top-bar span {
            font-weight: bold;
        }

        /* Sidebar */
        .sidebar {
            background-color: #a8dadc;
            height: calc(100vh - 50px);
            width: 20%;
            position: fixed;
            left: 0;
            padding: 20px 10px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar button {
            background-color: #457b9d;
            color: white;
            border: none;
            padding: 10px 20px;
            width: 100%;
            text-align: left;
            margin-bottom: 10px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .sidebar button:hover, .sidebar button.active {
            background-color: #1d3557;
        }

        /* Main Content */
        .main {
            margin-left: 20%;
            margin-top: 50px;
            padding: 20px;
        }

        /* Tabs Navigation */
        .tab-bar {
            background-color: #457b9d;
            display: flex;
            justify-content: space-around;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .tab-bar a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .tab-bar a:hover, .tab-bar a.active {
            background-color: #1d3557;
        }

        /* Content Container */
        .content-container {
            margin-top: 20px;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            background-color: #a8dadc;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        /* Footer */
        .footer {
            margin-top: 20px;
            text-align: center;
            color: gray;
            font-size: 14px;
        }



        /* Side Bar */
        .sidebar-container {
            display: flex;
        }

        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            height: 100vh;
            transition: width 0.3s ease;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .sidebar.small {
            width: 60px;
        }

        .sidebar .toggle-btn {
            background-color: #34495e;
            color: white;
            padding: 15px;
            cursor: pointer;
            text-align: center;
            font-size: 20px;
        }

        .sidebar .menu {
            list-style: none;
            padding: 0;
            margin: 0;
            flex: 1;
        }

        .sidebar .menu li {
            display: flex;
            align-items: center;
            padding: 15px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .sidebar .menu li:hover {
            background-color: #1abc9c;

        }

        .sidebar .menu .icon {
            margin-right: 15px;
            font-size: 18px;
        }

        .sidebar.small .menu .text {
            display: none;
        }

        .content {
            flex: 1;
            margin-top: 55px;
        }

        /* menu icon spaces*/
        .menu-icon {
            margin-left: 10px;
            margin-right: 10px;

        }


        .search_btn{
            margin-right: 10px;
            border-radius: 6px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }


    </style>


</head>
<body>
<!-- Top Bar -->
<div class="top-bar">
    <div class="toggle-btn menu-icon">☰</div>Welcome, <span><%= session.getAttribute("student_name") %></span>
    <a class="menu-icon" href="logout.jsp" style="color: #07070e; text-decoration: none;">Logout</a>
</div>

<div class="sidebar-container">
    <div class="sidebar">
        <ul class="menu">
            <li class="content">
                <i class="icon">📄</i>
                <span class="text">My Grades</span>
            </li>
            <li>
                <i class="icon">⭐</i>
                <span class="text">Reviews</span>
            </li>
            <li>
                <i class="icon">❓</i>
                <span class="text">Ask Teacher</span>
            </li>
        </ul>
    </div>
</div>



<!-- Main Content -->
<div class="main">
    <!-- Tabs -->
    <div class="tab-bar">
        <a href="#" class="active">My Grades</a>
        <a href="#">Homework</a>
        <a href="#">Attendance</a>
        <a href="#">Notifications</a>
    </div>

    <!-- Content Container -->
    <div class="content-container">
        <!-- Grades Content -->
        <h2>My Grades</h2>
        <p>Below is the list of grades for the current term:</p>
        <table>
            <thead>
            <tr>
                <th>Class ID</th>
                <th>Class Name</th>
                <th>Course</th>
                <th>Score</th>
                <th>Term</th>
            </tr>
            </thead>
            <tbody id="studentTable">
            <%
                List<StudentGrade> grades = (List<StudentGrade>) request.getAttribute("grades");
                if (grades != null) {
                    for (StudentGrade grade : grades) {
            %>
            <tr id="grades">
                <td><%= grade.getClassId() %></td>
                <td><%= grade.getClassName() %></td>
                <td><%= grade.getCourseName() %></td>
                <td><%= grade.getScore() %></td>
                <td><%= grade.getTerm() %></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5">No grades available.</td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <div class="layui-card-body layui-table-body layui-table-main">
        <!-- Using the method of rendering, you only need a table selector-->
        <table class="layui-hide" id="test" lay-filter="test"></table>
    </div>

    <!-- Footer -->
    <div class="footer">
        &copy; 2024 Student Dashboard
    </div>
</div>

<script>

    function toggleSidebar() {
        $('.sidebar').toggleClass('small');
    }

    $(document).ready(function () {
        $('.toggle-btn').click(toggleSidebar);
    });


    layui.use(['laydate', 'form', 'table', 'layer'], function() {
        var layer = layui.layer;
        var table = layui.table;
        var laydate = layui.laydate;
        var form = layui.form;

        // Parse the grades JSON passed from the servlet
        var gradesData = <%= request.getAttribute("gradesJson") %>;

        // If gradesData is available, parse it into an array
        if (gradesData) {
            gradesData = JSON.parse(gradesData); // Convert JSON string to JavaScript object
        } else {
            gradesData = [];
        }

        // Table data loading and rendering
        table.render({
            elem: '#test' // Specifies the table ID to render
            , height: '300px' // Set table height
            , data: gradesData // Use the grades data from the servlet
            , page: {
                layout: ['count', 'prev', 'page', 'next', 'skip'] // Customize Toolbar content
                , groups: 5 // Display up to 5 consecutive page numbers
            }
            , limit: 10
            , cellMinWidth: 35 // Defines the minimum width of a regular cell
            , title: 'Course List'
            , cols: [[
                {type: 'checkbox'},  // Add row check box
                {field: 'number', title: 'Serial', align: 'center', type: 'numbers', width: 50},
                {field: 'classid', width: 130, title: 'CLASS ID'},
                {field: 'classname', width: 150, title: 'CLASS NAME', type: 'text', sort: true},
                {field: 'coursenanme', title: 'COURSE NAME', width: 120, sort: true},
                {field: 'score', title: 'SCORE', width: 100, sort: true},
                {field: 'term', title: 'TERM', width: 130, sort: true},
                {fixed: 'right', title: '', toolbar: '#barDemo', width: 130}
            ]]
        });
    });

        //listen tools bar
        table.on('tool(test)', function(obj){//Obj stores the data of JSON objects
            //from multiple event lines
            var data = obj.data;
            if(obj.event === 'edit'){
                xadmin.open('Edit Score','scoreEdit.html#/scoreid='+data.scoreid,800,600);
                //Popup Message

            } else if(obj.event === 'del'){
                //Confirmation message box
                layer.confirm('Are you sure you want to delete it?', function(index){
                    $.ajax({
                        type:"get",
                        url:"score/deletescore?scoreid="+data.scoreid,
                        dataType:"json",
                        success:function (data) {
                            if(data.status==10001){
                                layer.alert(data.msg);
                                obj.del(); //Delete current row
                            }else{
                                layer.alert(data.msg);
                                return false;
                            }
                        }
                    });
                    layer.close(index); //Close the current deletion prompt form
                });
            }
    });

    /*Open the hotel add page*/
    function member_add(title,url,id,w,h){
        xadmin.open(title,url,id,w,h);
    }

    /*Delete the selected Hotel*/
    function delAll (argument) {
        var ids = [];

        // 获取选中的id
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
                ids.push($(this).val())
            }
        });

        layer.confirm('Are you sure you want to delete？'+ids.toString(),{icon:3,title:'Prompt information'},function(index){
            //Delete using asynchronous request
            layer.msg('Deletion succeeded', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }






</script>


</body>
</html>