<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <spring:url value="resources/dist" var="dist"/>
  
<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${dist}/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${message }</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
      <li class="header">Main  Navigation</li>
     <c:forEach var="menu" items="${menuList}">
          <li class="treeview active">
              <a href="${menu.siteUrl}">
                <i class="fa  ${menu.menuIcon}"></i>
                <span>${menu.menuName}</span>
                <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                 </span>
              </a>
              <ul class="treeview-menu">
              <c:forEach var="menuChildren" items="${menu.childrenMenusList}">
                <li class="active"><a href="${menuChildren.siteUrl}"><i class="fa  ${menuChildren.menuIcon}"></i>${menuChildren.menuName}</a></li>
              </c:forEach>
              </ul>
            </li>
     </c:forEach>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>