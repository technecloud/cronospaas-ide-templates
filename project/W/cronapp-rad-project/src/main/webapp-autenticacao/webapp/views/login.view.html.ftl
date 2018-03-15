<div class="container-full" data-container="true">
    <div class="container-fluid" data-container="true">
        <div class="row component-holder ">
            <div class="col-xs-12">
                <br>
                <img src="plugins/cronapp-framework-js/dist/img/logo.png" class="center-block" width="" height="50">
                <br>
            </div>
        </div>
        <div class="row component-holder">
          <div class="col-xs-12 col-sm-3 col-lg-4"></div>
          <div class="col-xs-12 col-sm-6 col-lg-4" data-container="true">
            <form class="form-validation" autocomplete="off" name="form" ng-submit="login()" role="form">
                <div class="text-danger wrapper text-center" ng-show="authError"></div>
                <div class="col-xs-12 col-md-9 col-md-push-1" data-container="true">
                    <div class="form-group" data-container="true">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" ng-model="username.value" id="username" placeholder="{{'Login.view.Username' | translate}}">
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-9 col-md-push-1" data-container="true">
                    <div class="form-group" data-container="true">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
                            <input type="password" class="form-control" ng-model="password.value" id="password" placeholder="{{'Login.view.Password' | translate}}"> 
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-9 col-md-push-1" data-container="true">
                    <div class="form-group" data-container="true">
                        <div class="messages">
                          <div ng-show="message.error" class="help-block">{{message.error}}</div> 
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-9 col-md-push-1" data-container="true">
                    <div class="form-group" data-container="true">
                        <button type="submit" class="btn btn-primary btn-block" ng-disabled="form.$invalid || vm.dataLoading">{{"Login.view.Login" | translate}}</button>
                        <!--<button class="btn btn-lg btn-primary btn-block" type="submit" ng-disabled="form.$invalid || vm.dataLoading">{{"Login.view.Login" | translate}}</button>-->
                    </div>
                </div>
                
            </form>
          </div>
          <div class="col-xs-12 col-sm-3 col-lg-4" data-container="true"></div>
        </div>
        <div class="row component-holder">
            <div class="col-xs-12 col-sm-3 col-lg-4" data-container="true"></div>
            <div class="col-xs-12 col-sm-6 col-lg-4" data-container="true">
                <div class="col-xs-10 col-md-8 col-md-push-2 col-xs-push-1" data-container="true">
                    <ul class="list-inline center-block text-center">
						<#if social?? && social?lower_case == "sim">
                            <li>
                                <form action="/signin/facebook" method="POST" id="facebook">
                                    <input type="hidden" name="scope" value="email,public_profile">
                                    <a title="Facebook" role="button" onclick="document.getElementById('facebook').submit();"><i class="fa fa-2x fa-facebook"></i></a>
                                </form>
                            </li>
                            <li>
                                <form action="/signin/github" method="POST" id="github">
                                    <input type="hidden" name="scope" value="email,public_profile">
                                    <a title="GitHub" role="button" onclick="document.getElementById('github').submit();"><i class="fa fa-2x fa-github-alt"></i></a>
                                </form>
                            </li>
                            <li>
                                <form action="/signin/linkedin" method="POST" id="linkedin">
                                    <input type="hidden" name="scope" value="r_emailaddress">
                                    <a title="LinkedIn" role="button" onclick="document.getElementById('linkedin').submit();"><i class="fa fa-2x fa-linkedin-square"></i></a>
                                </form>
                            </li>
                            <li>
                                <form action="/signin/google" method="POST" id="google">
                                    <input type="hidden" name="scope" value="email">
                                    <a title="Google" role="button" onclick="document.getElementById('google').submit();"><i class="fa fa-2x fa-google"></i></a>
                                </form>
                            </li>
                            <li>
                                <form action="/signin/cronapp" method="POST" id="cronapp">
                                    <input type="hidden" name="scope" value="email">
                                    <a title="CronApp" role="button" onclick="document.getElementById('cronapp').submit();"><i class="fa fa-2x fa-cloud"></i></a>
                                </form>
                            </li>
						</#if>
                    </ul>
                </div>
            </div>
            <div class="col-xs-12 col-sm-3 col-lg-4" data-container="true"></div>
        </div>
    </div>
</div>
