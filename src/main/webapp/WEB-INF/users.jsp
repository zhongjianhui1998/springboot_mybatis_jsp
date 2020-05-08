<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户表</title>
    <style>
        .window {
            width: 250px;
            background-color: gray;
            position: absolute;
            padding: 5px;
            margin: 10px;
            display: none;
            left: 40%;
            top: 0px
        }

        #content {
            height: 300px;
            background-color: white;
            font-size: 16px;
            overflow: auto;
        }

        .title {
            padding: 2px;
            color: white;
            font-size: 15px;
        }

        .title img {
            float: right;
        }
    </style>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" media="screen" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/paging.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
<script type="text/javascript">
</script>
<body style="background-color:#FFEBCD;">
<div align="center">
    <form action="" id="form">
        <input id="pageSize" name="pageSize" type="hidden" value="5"/><!-- 默认每页3条 -->
        <input id="pageNum" name="pageNum" type="hidden" value="1"/><!-- 默认第一页 -->
        <input id="order" name="order" type="hidden" value="0"/><!-- 默认排序倒序 -->
        <p>
            <a href="${pageContext.request.contextPath}/user/add">添加</a>
            <button type="button" id="asc">id顺序查询</button>
            <button type="button" id="desc">id倒序查询</button>
        </p>
    </form>
    <table id="myTable" border="1" cellpadding="10" cellspacing="0" style="border-collapse: collapse;">
        <!-- 表头 -->
        <thead>
        <tr align="center">
            <td>id</td>
            <td>用户姓名</td>
            <td>账号</td>
            <td>密码</td>
            <td>用户性别</td>
            <td>用户年龄</td>
            <td>联系电话</td>
            <td>邮箱</td>
            <td>用户地址</td>
            <td>账号状态</td>
            <td>操作</td>
        </tr>
        </thead>
        <!-- 主体 -->
        <tbody id="tables">
        </tbody>
        <!-- 页脚 -->
        <tfoot>
        </tfoot>
    </table>
    <div class="pagination">
        <ul id="paging">
        </ul>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        tableData();//调用方法查询数据
    });

    function tableData() {
        $("#tables,#paging").empty();//清空表的值和页码数
        var form = $('form').serializeArray();//获取表单所有值的json格式
        $.ajax({//用ajax静态访问servlet
            type: "GET",
            url: "${pageContext.request.contextPath}/users",
            dataType: "json",
            async: false,//设置为同步请求
            data: form,
            success: function (data) {//成功则调用函数tableData添加数据到页面
                if (data.dataList == "") {
                    if ($("#wu").text() == "") {//如果无数据则满足条件(也就是只报一次无数据)
                        $("#myTable").after("<h2 id='wu'>无数据</h2>");
                    }
                } else {
                    if ($("#wu").text() == "无数据") {//如果无数据则满足条件(也就是只报一次无数据)
                        $("#wu").remove();
                    }
                    for (var i in data.dataList) {
                        $("#tables").append("<tr>"
                            + "<td>" + data.dataList[i].id + "</td>"
                            + "<td>" + data.dataList[i].username + "</td>"
                            + "<td>" + data.dataList[i].account + "</td>"
                            + "<td>" + data.dataList[i].password + "</td>"
                            + "<td>" + data.dataList[i].sex + "</td>"
                            + "<td>" + data.dataList[i].age + "</td>"
                            + "<td>" + data.dataList[i].phone + "</td>"
                            + "<td>" + data.dataList[i].mailbox + "</td>"
                            + "<td>" + data.dataList[i].address + "</td>"
                            + "<td>" + data.dataList[i].status + "</td>"
                            + "<td name='myButton'>"
                            + "<input type='button' name='update' class='updatebutton' value='修改' onclick='update(" + data.dataList[i].id + ");'/>"
                            + "<input type='button' onclick='deletes(this)' style='background-color:#FA5858;border: 1px solid #FA5858' class='updatebutton' value='删除' />"
                            + "<input type='button' onclick='role_setting(this)' style='background-color:#FA5858;border: 1px solid #FA5858' class='updatebutton' value='角色设置' />"
                            + "</td>"
                            + "</tr>"
                        );

                    }
                    //参数依次为	总页数，当前页数，总条数，当前大小，页码数，分页所放的ul的ID的值 ，搜索框的值
                    myFunction(data.pageCount, data.pageNum, data.totalCount, data.pageSize, 3, "paging", data.search);
                    var pageNum = $("#pageNum").val();//当点击按钮页数，id为pageNumber就会获得点击的页数，用变量接住页数的值
                    $("ul button").each(function () {//匹配ul下的button的值
                        if (pageNum == $(this).text()) {//当页数和该对象的文本值相等时
                            $(this).attr("style", "color: #2eccfa;background: #dddddd;border: 1px solid #dddddd;");//就改变该按钮的样式
                        }
                    });
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("错误: " + XMLHttpRequest.status);
            }
        })
        ;
    }
</script>
</html>