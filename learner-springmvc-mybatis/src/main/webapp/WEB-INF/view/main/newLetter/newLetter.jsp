<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
 content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-title" content="english bady" />
<meta name="application-name" content="english bady" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="robots" content="noindex,nofollow">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<link rel="icon" href="resources/favicon.ico">
<link rel="apple-touch-icon" href="resources/yarukey_favorite.png" />
<spring:url value="../resources/js" var="publicResourceJsRoot" />
<spring:url value="../resources/img" var="publicResourceImgRoot" />
<spring:url value="../resources/dist" var="dist" />
<spring:url value="../resources/bower_components" var="bower_components" />
<!-- Bootstrap css -->
<link href="${publicResourceJsRoot}/bootstrap/css/bootstrap.min.css"
 rel="stylesheet">
<link
 href="${publicResourceJsRoot}/bootstrap/css/bootstrap-theme.min.css"
 rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet"
 href="${bower_components }/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
 href="${bower_components }/Ionicons/css/ionicons.min.css">

<link rel="stylesheet"
 href="${bower_components }/datatables.net-bs/css/dataTables.bootstrap.css">

<!-- Theme style -->
<link rel="stylesheet" href="${dist }/AdminLTE.min.css">

<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${dist }/skins/_all-skins.min.css">

<style type="text/css">
.ztree li span.button.add {
 margin-left: 2px;
 margin-right: -1px;
 background-position: -144px 0;
 vertical-align: top;
 *vertical-align: middle
}

td.details-control {
 background: url('../resources/img/details_open.png') no-repeat center
  center;
 cursor: pointer;
}

tr.shown td.details-control {
 background: url('../resources/img/details_close.png') no-repeat center
  center;
}
</style>
<title>菜单管理</title>
</head>

<body class="hold-transition skin-blue sidebar-mini">
 <div class="wrapper">

  <!-- Header page -->
  <jsp:include page="../header.jsp"></jsp:include>
  <!-- Header page -->

  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="../menu.jsp"></jsp:include>
  <!-- Left side column. contains the logo and sidebar -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
    <h1>
     新闻管理 <small>新闻信息</small>
    </h1>
    <ol class="breadcrumb">
     <li><a href="#"><i class="fa fa-dashboard"></i> 新闻管理</a></li>
     <li><a href="#">新闻信息</a></li>
    </ol>
   </section>

   <!-- Main content -->
   <section class="content">
    <div class="panel panel-default">
     <div class="panel-heading">
      <h3 class="panel-title">新闻信息</h3>
     </div>
     <div class="panel-body">
      <button type="button" class="btn btn-primary" data-toggle="button"
       id="Delbutton" style="margin-left: 10px;">删除</button>
      <button type="button" class="btn btn-primary" data-toggle="button"
       id="AddButton" style="margin-left: 10px;">添加</button>
      <button type="button" class="btn btn-primary" data-toggle="modal"
       data-target="#exampleModal" data-editMenuTitle="编辑菜单信息"
       id="EditButton" style="margin-left: 10px;">编辑</button>

      <div class="box-body">
       <table id="example1" class="table table-bordered table-striped">
        <thead>
         <tr>
          <th>菜单名称</th>
          <th>访问路径</th>
          <th>菜单图标</th>
         </tr>
        </thead>
       </table>
      </div>
     </div>
    </div>

   </section>
   <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Footer page -->
  <jsp:include page="../footer.jsp"></jsp:include>
  <!-- Footer page -->

  <!-- Control Sidebar -->
  <jsp:include page="../controlSidebar.jsp"></jsp:include>
  <!-- /.control-sidebar -->

  <!-- Add the sidebar's background. This div must be placed  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
 </div>
 <!-- ./wrapper -->
 <script type="text/javascript"
  src="${publicResourceJsRoot}/jquery.min.js?20170925_01"></script>

 <script type="text/javascript"
  src="${publicResourceJsRoot}/jquery.serialize-json.js?20170925_01"></script>

 <script src="${ bower_components}/bootbox.min.js"></script>

 <!-- DataTables -->
 <script
  src="${ bower_components}/datatables.net/js/jquery.dataTables.min.js"></script>
 <script
  src="${ bower_components}/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

 <script type="text/javascript"
  src="${publicResourceJsRoot}/bootstrap/js/bootstrap.min.js"></script>
 <!-- AdminLTE App -->
 <script src="${ dist}/adminlte.min.js"></script>

 <!-- AdminLTE for demo purposes -->
 <script src="${ dist}/demo.js"></script>

 <script type="text/javascript">
        $(function() {
            var table = $('#example1')
                    .DataTable(
                            {
                                "processing" : true,
                                "ajax" : "/learner-springmvc-mybatis/systemInfo/getAllMenuDataList",
                                "columns" : [{
                                    "data" : "menuName"
                                }, {
                                    "data" : "siteUrl"
                                }, {
                                    "data" : "menuIcon"
                                } ],
                                'autoWidth' : true
                            });
        });

        $(document)
                .ready(
                        function() {
                            var table = $('#example1').DataTable();
                            $('#example1').on(
                                    'click',
                                    'tr',
                                    function() {
                                        if ($(this).hasClass('selected')) {
                                            $(this).removeClass('selected');
                                        } else {
                                            table.$('tr.selected').removeClass(
                                                    'selected');
                                            $(this).addClass('selected');
                                        }
                                    });

                            $('#Delbutton')
                                    .click(
                                            function() {
                                                if (table.rows('.selected')
                                                        .data().length > 0) {
                                                    if (table.rows('.selected')
                                                            .data()[0].menuName
                                                            .indexOf("<td>") != -1) {
                                                        table.rows('.selected')
                                                                .remove().draw(
                                                                        false);
                                                    } else {
                                                        byIdDeleteTrees(
                                                                table,
                                                                table
                                                                        .rows(
                                                                                '.selected')
                                                                        .data()[0].menuId);
                                                    }
                                                } else {
                                                    commonBootboxDailog("请选择删除项!");
                                                    return false;
                                                }
                                            });

                            $('#AddButton').on('click', function(event) {
                                window.location.href = '${pageContext.request.contextPath}/newletter/jumpAdd';
                            });
                            
                            $('#EditButton').click(function() {
                                window.location.href = '${pageContext.request.contextPath}/newletter/jumpAdd';
                             });

                            $('#submitEdit').click(function() {
                                byIdUpdateMenus();
                            });

                        });

        function byIdUpdateMenus() {
            var params = {
                "siteUrl" : $("#siteUriModel").val(),
                "menuName" : $("#menuNameModel").val(),
                "menuIcon" : $("#menuIconModel").val(),
                "menuId" : $("#menuIdModel").val()
            }
            $.ajax({
                type : "POST",
                url : "/learner-springmvc-mybatis/systemInfo/byIdUpdateMenus",
                dataType : "json",
                data : JSON.stringify(params),
                contentType : "application/json; charset=UTF-8",
                success : function(data) {
                    if (data) {
                        $('#exampleModal').modal('hide');
                        document.location.reload();
                    } else {
                        commonBootboxDailog("更新失败!");
                    }
                },
                error : function(XMLHttpRequest, textStatus) {
                    commonBootboxDailog("通信ERROR!");
                }
            });
        }

        function byIdDeleteTrees(table, menuId) {
            var params = {
                "id" : menuId
            };
            $.ajax({
                type : "GET",
                url : "/learner-springmvc-mybatis/systemInfo/byIdDeleteTrees",
                dataType : "json",
                data : params,
                contentType : "application/json; charset=UTF-8",
                success : function(data) {
                    if (data) {
                        table.rows('.selected').remove().draw(false);
                    } else {
                        commonBootboxDailog("删除失败!");
                    }
                },
                error : function(XMLHttpRequest, textStatus) {
                    commonBootboxDailog("通信ERROR!");
                }
            });
        }

        function commonBootboxDailog(message) {
            bootbox.alert({
                size : "small",
                title : "warning",
                message : message,
                callback : function() {
                }
            })
        }
    </script>
</body>
</html>