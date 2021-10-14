
 <%@ include file="../include/header.jsp" %>
            <main class="mn-inner">
                <div class="row">
                    <div class="col s12">
                        
                          <div class="col s12 m6 l8 offset-l2 offset-m3">
                              <div class="card white darken-1">
							  

    
                                  <div class="card-content ">
                                      <span class="card-title" style="font-size:20px;">Sign In</span>
                                         
                                       <div class="row">
                                           <form class="col s12" name="signin" method="post" action="beans/Login" onsubmit="return Validate();" >
                                            <div class="errorWrap"><strong></strong>  <label id="msgemail"  onblur="nVal();"></label> 
                                                <label id="msgpwd"  onblur="nVal();"></label>
                                            </div>
                                            
                                                <div class="input-field col s12">
                                                   <input id="username" type="text" name="username" class="validate"  >
                                                   <label for="email">Email Id</label>
                                                   
                                               </div>
                                               <div><label id="msgemail"  onblur="nVal();"></label></div>
                                               <div class="input-field col s12">
                                                   <input id="password" type="password" class="validate" name="password" >
                                                   <label for="password">Password</label>
                                               </div>
                                               <div class="col s12 right-align m-t-sm">
                                                    
                                                   <input type="submit" name="signin" value="Sign in" class="waves-effect waves-light btn teal">
                                                   <div>Don't have an Account <a href="addemployee.jsp">Sign up</a></div>
                                                </div>
                                           </form>
                                      </div>
                                  </div>
                              </div>
                          </div>
                    </div>
                </div>
            </main>

        </div>
        <div class="left-sidebar-hover"></div>

        <!-- Javascripts -->
        <script src="assets/plugins/jquery/jquery-2.2.0.min.js"></script>
        <script src="assets/plugins/materialize/js/materialize.min.js"></script>
        <script src="assets/plugins/material-preloader/js/materialPreloader.min.js"></script>
        <script src="assets/plugins/jquery-blockui/jquery.blockui.js"></script>
        <script src="assets/js/alpha.min.js"></script>

    </body>
</html>
