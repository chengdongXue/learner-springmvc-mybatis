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
<spring:url value="resources/js" var="publicResourceJsRoot" />
<spring:url value="resources/img" var="publicResourceImgRoot" />
<spring:url value="resources/dist" var="dist" />
<spring:url value="resources/bower_components" var="bower_components" />
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
<!-- DataTables -->
<link rel="stylesheet"
 href="${bower_components }/datatables.net-bs/css/dataTables.bootstrap.css">
<%-- <link rel="stylesheet" href="${bower_components }/datatables.net-bs/css/jquery.dataTables.css"> --%>
<!-- Theme style -->
<link rel="stylesheet" href="${dist }/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${dist }/skins/_all-skins.min.css">

<title>DashBoard Controller</title>
</head>

<body class="hold-transition skin-blue sidebar-mini">
 <div class="wrapper">

  <!-- Header page -->
  <jsp:include page="header.jsp"></jsp:include>
  <!-- Header page -->

  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="menu.jsp"></jsp:include>
  <!-- Left side column. contains the logo and sidebar -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
    <h1>
     Data Tables <small>advanced tables</small>
    </h1>
    <ol class="breadcrumb">
     <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
     <li><a href="#">Tables</a></li>
     <li class="active">Data tables</li>
    </ol>
   </section>

   <!-- Main content -->
   <section class="content">
    <div class="row">
     <div class="col-xs-12">
      <div class="box">
       <div class="box-header">
        <h3 class="box-title">Data Table With Full Features</h3>
       </div>
       <button type="button" class="btn btn-primary"
        data-toggle="button" id="Delbutton" style="margin-left: 10px;">
        Delete selecd row</button>
       <button type="button" class="btn btn-primary"
        data-toggle="button" id="AddButton" style="margin-left: 10px;">
        Add new row</button>
        <button type="button" class="btn btn-primary"
        data-toggle="button" id="SubmitButton" style="margin-left: 10px;">
        Submit add rows</button>
       <!-- /.box-header -->
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
       <!-- /.box-body -->
      </div>
      <!-- /.box -->
     </div>
     <!-- /.col -->
    </div>
    <!-- /.row -->
   </section>
   <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Footer page -->
  <jsp:include page="footer.jsp"></jsp:include>
  <!-- Footer page -->

  <!-- Control Sidebar -->
  <jsp:include page="controlSidebar.jsp"></jsp:include>
  <!-- /.control-sidebar -->

  <!-- Add the sidebar's background. This div must be placed  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
 </div>
 <!-- ./wrapper -->

 <script type="text/javascript"
  src="${publicResourceJsRoot}/jquery.min.js?20170925_01"></script>
  
<script type="text/javascript"
  src="${publicResourceJsRoot}/jquery.serialize-json.js?20170925_01"></script>
  
 <script type="text/javascript"
  src="${publicResourceJsRoot}/bootstrap/js/bootstrap.min.js"></script>
 <!-- DataTables -->
 <script
  src="${ bower_components}/datatables.net/js/jquery.dataTables.min.js"></script>
 <script
  src="${ bower_components}/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

 <!-- AdminLTE App -->
 <script src="${ dist}/adminlte.min.js"></script>

 <!-- AdminLTE for demo purposes -->
 <script src="${ dist}/demo.js"></script>

 <script type="text/javascript">
        $(function() {
            $('#example1')
                    .DataTable(
                            {
                                "processing" : true,
                                "ajax" : "/learner-springmvc-mybatis/systemInfo/getAllMenuDataList",
                                "columns" : [ {
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

                            $('#Delbutton').click(function() {
                                table.row('.selected').remove().draw(false);
                            });

                            var counter = 1;
                            $('#AddButton')
                                    .on(
                                            'click',
                                            function() {
                                                table.rows
                                                        .add(
                                                                [{
                                                                    "menuName" : "<td><input name='menuName' id='menuName' type='text' value=''></td>",
                                                                    "siteUrl" : "<td><input name='siteUrl' id='siteUrl'  type='text' value=''></td>",
                                                                    "menuIcon" : ' <td><select name="menuIcon" id="menuIcon" size="1">'
                                                                            + '<option value="fa-meh-o" selected="">fa-meh-o</option>'
                                                                            + '<option value="fa-odnoklassniki" selected="">fa-odnoklassniki</option>'
                                                                            + '<option value="fa-bars" selected="">fa-bars</option>'
                                                                            + '</select></td>'
                                                                } ]).draw()
                                                        .nodes().to$()
                                                        .addClass('new');
                                                counter++;
                                            });

                            $('#SubmitButton').click( function(){
                                var data = table.$('input, select').serializeJson();
                                console.log(data);
                                
                                return false;
                            });
                        });
    </script>
</body>
</html>