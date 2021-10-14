<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>

        <!-- Title -->
        <title>ELMS | Home Page</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta charset="UTF-8">
        <meta name="description" content="Responsive Admin Dashboard Template" />
        <meta name="keywords" content="admin,dashboard" />
        <meta name="author" content="Steelcoders" />

        <!-- Styles -->
        <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.min.css" />
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="assets/plugins/material-preloader/css/materialPreloader.min.css" rel="stylesheet">


        <!-- Theme Styles -->
        <link href="assets/css/alpha.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css" />
        <style>
            .errorWrap {
                padding: 10px;
                margin: 0 0 20px 0;
                background: #fff;
                border-left: 4px solid #dd3d36;
                -webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
                box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
            }

           
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
            var Validate = function () {

               // console.log("hellooo");
                var flag = 1;

                //The Validations for Email(is empty or check format)
                var e = document.getElementById('username').value;

                if (e == "") {
                    document.getElementById('msgemail').innerHTML = "Please Enter Email Address";
                    document.getElementById('username').focus();
                    flag = 0;
                    return false;
                }
                else if (!e.match(/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/)) {
                    document.getElementById('msgemail').innerHTML = "Invalid Email Address";
                    document.getElementById('username').focus();
                    flag = 0;
                    return false;
                }

                //The Validations for Password Field(is Empty Or Check Format) 
                var pwd = document.getElementById('password').value;
                if (pwd == "") {
                    document.getElementById('msgpwd').innerHTML = "Please Enter Password";
                    document.getElementById('password').focus();
                    flag = 0;
                    return false;
                }
                else if (!pwd.match(/^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/)) {
                    document.getElementById('msgpwd').innerHTML = "Password is not a Correct";
                    document.getElementById('password').focus();
                    flag = 0;
                    return false;
                }

                return true;
            };




            //This Function is for set a null value to error label
            var nVal = function () {

                console.log("--------------");
                document.getElementById('msgemail').innerHTML = "";
                document.getElementById('msgpwd').innerHTML = "";


            };

        </script>


        </head>

    </head>

    <body>

        <div class="mn-content fixed-sidebar">
            <header class="mn-header navbar-fixed">
                <nav class="cyan darken-1">
                    <div class="nav-wrapper row">
                        <section class="material-design-hamburger navigation-toggle">

                        </section>
                        <div class="header-title col s4">
                            <span class="chapter-title"> Employee Leave Management System</span>
                        </div>


                        </form>


                    </div>
                </nav>
            </header>