<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <link rel="stylesheet" href="css/styleSlider.css" type="text/css" media="screen"/>
                            <script  src='Scripts/jquery.circulate.js'></script> 

                    <script  src="Scripts/jQueryRotate.js"></script>    
        <script  src="Scripts/jquery.easing.1.3.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div id="contentInside">
            <a class="back" href=""></a>
            <div class="rotator">
                <ul id="rotmenu">
                    <li>
                        <a href="rot1"><asp:Label runat="server" ID="ONE_WORDLabel1" /></a>
                        <div style="display:none;">
                            <div class="info_image">imagesSlide/1.jpg</div>
                            <div class="info_heading"><asp:Label runat="server" ID="TITLELabel1" CssClass="SliderText"/></div>
                            <div class="info_description">
				 <asp:Label runat="server" ID="TextLabel1" CssClass="SliderText"/>... 
                                <a id="Link1" runat="server" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="rot2"><asp:Label runat="server" ID="ONE_WORDLabel2" /></a>
                        <div style="display:none;">
                            <div class="info_image">imagesSlide/2.jpg</div>
                            <div class="info_heading"><asp:Label runat="server" ID="TITLELabel2" CssClass="SliderText"/></div>
                            <div class="info_description">
				 <asp:Label runat="server" ID="TextLabel2" CssClass="SliderText"/>...
                                <a id="Link2" runat="server" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="rot3"><asp:Label runat="server" ID="ONE_WORDLabel3" /></a>
                        <div style="display:none;">
                            <div class="info_image">imagesSlide/3.jpg</div>
                            <div class="info_heading"><asp:Label runat="server" ID="TITLELabel3" CssClass="SliderText"/></div>
                            <div class="info_description">
				 <asp:Label runat="server" ID="TextLabel3" CssClass="SliderText"/>...
                                <a id="Link3" runat="server" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="rot4"><asp:Label runat="server" ID="ONE_WORDLabel4" /></a>
                        <div style="display:none;">
                            <div class="info_image">imagesSlide/4.jpg</div>
                            <div class="info_heading"><asp:Label runat="server" ID="TITLELabel4" CssClass="SliderText"/></div>
                            <div class="info_description">
				<asp:Label runat="server" ID="TextLabel4" CssClass="SliderText"/>...				
                                <a id="Link4" runat="server" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="rot5"><asp:Label runat="server" ID="ONE_WORDLabel5" /></a>
                        <div style="display:none;">
                            <div class="info_image">imagesSlide/5.jpg</div>
                            <div class="info_heading"><asp:Label runat="server" ID="TITLELabel5" CssClass="SliderText"/></div>
                            <div class="info_description">
                                <asp:Label runat="server" ID="TextLabel5" CssClass="SliderText" />...				
                                <a id="Link5" runat="server" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                </ul>
                <div id="rot1">
                    <img src="" width="800" height="300" class="bg" alt=""/>
                    <div class="heading">
                        <h1></h1>
                    </div>
                    <div class="description">
                        <p></p>

                    </div>    
                </div>
            </div>


        <div class="WelcomeText">We Love This Game</div>
       <hr width="75%" size="10" noshade="NOSHADE">

          </div>
   

   <!--eisodos tou kuklikou menu -->
        <script type="text/javascript">  
           /* $(".wrapper").fadeIn('slow', function () {
                $(this).animate({ 'top': '90px', 'left': '200px' }, 'slow');
                $(".circleBig").rotate({
                    angle: 0,
                    animateTo: 720,
                    duration: 2500
                });
            });*/


            $(".circle-container").fadeIn(function () {
            $(this).animate({
                left: 650, top: 70
            }, 1500); $(this).rotate({
                angle: 0,
                animateTo: 720,
                duration: 2000
            });
            }); 


            $(".wrapper").fadeIn(function () {
                $(this).animate({
                    left: 200, top: 90
                }, 1500); $(this).rotate({
                    angle: 0,
                    animateTo: 720,                 
                    duration: 2000
                });
            });



           /* $(".circle-container").fadeIn('slow', function () {
                $(this).animate({ 'top': '70px', 'left': '650px'}, 'slow');
                $(this).rotate({
                    angle: 0,
                    animateTo: 360,
                    easing: $.easing.easeInOutElastic,
                    duration: 2000
                });
            });*/
            $("#changing").delay(1800);
            $("#changing").hide();
            /*$("#FrontBall").fadeIn('slow', function () {
                $(this).animate({ 'top': '0px', 'left': '0px' }, 'slow');
            });

            $("#changing").delay(2000);
            $("#changing").animate({ height: 'toggle' }, "slow");*/

            /* $('#changing').hide(0).delay(2000).show(0);
             */


            /*ball moving*/
            $("#unicorn").delay(2000);

            $('.divball').css({ 'display': 'block' });

            $(window).load(function () {
         $("#unicorn").css("left", $("#unicorn").position().left).circulate({
             sizeAdjustment: 140,
             speed: 2000,
             width: -1920,
             height: 350,
             loop: true,
             zIndexValues: [-1, 50, 50, -1]
         });

         var angle = 0;
         setInterval(function(){
             angle+=3;
             $("#unicorn").rotate(angle);
         }, 50);   
         });
            /*End ball moving*/

            </script>


      <!-- Kinoumeno Background 
    <script type="text/javascript" charset="utf-8">

        $('.headerFilm').css({ 'display': 'block' });
        $('.footerFilm').css({ 'display': 'block' });

        var scrollSpeed = 70;       // Speed in milliseconds
        var step = 1;               // How many pixels to move per step
        var current = 0;            // The current pixel row

        var currentf = -450;            // The current pixel row of (footer)

        var imageHeight = 4256;     // Background image height
        var headerHeight = 414;     // How tall the header is.

        //The pixel row where to start a new loop
        var restartPosition = -(imageHeight - headerHeight);

        function scrollBg() {

            //Go to next pixel row.
            current -= step;

            //Go to next pixel row.(footer)
            currentf -= step;

            //If at the end of the image, then go to the top.
            if (current == restartPosition) {
                current = 0;
            }

            //If at the end of the image, then go to the top.(footer)
            if (currentf == restartPosition) {
                currentf = -450;
            }

            //Set the CSS of the header.
            $('.headerFilm').css("background-position", "0 " + current + "px");

            //Set the CSS of the footer.
            $('.footerFilm').css("background-position", "0 " + currentf + "px");

        }

        //Calls the scrolling function repeatedly
        var init = setInterval("scrollBg()", scrollSpeed);
</script>   -->



        <!-- The JavaScript -->
       
    
        <script type="text/javascript">
            $(function () {
                var current = 1;

                var iterate = function () {
                    var i = parseInt(current + 1);
                    var lis = $('#rotmenu').children('li').size();
                    if (i > lis) i = 1;
                    display($('#rotmenu li:nth-child(' + i + ')'));
                }
                display($('#rotmenu li:first'));
                var slidetime = setInterval(iterate, 3000);

                $('#rotmenu li').bind('click', function (e) {
                    clearTimeout(slidetime);
                    display($(this));
                    e.preventDefault();
                });

                function display(elem) {
                    var $this = elem;
                    var repeat = false;
                    if (current == parseInt($this.index() + 1))
                        repeat = true;

                    if (!repeat)
                        $this.parent().find('li:nth-child(' + current + ') a').stop(true, true).animate({ 'marginRight': '-20px' }, 300, function () {
                            $(this).animate({ 'opacity': '0.7' }, 700);
                        });

                    current = parseInt($this.index() + 1);

                    var elem = $('a', $this);

                    elem.stop(true, true).animate({ 'marginRight': '0px', 'opacity': '1.0' }, 300);

                    var info_elem = elem.next();
                    $('#rot1 .heading').animate({ 'left': '-420px' }, 500, 'easeOutCirc', function () {
                        $('h1', $(this)).html(info_elem.find('.info_heading').html());
                        $(this).animate({ 'left': '0px' }, 400, 'easeInOutQuad');
                    });

                    $('#rot1 .description').animate({ 'bottom': '-270px' }, 500, 'easeOutCirc', function () {
                        $('p', $(this)).html(info_elem.find('.info_description').html());
                        $(this).animate({ 'bottom': '0px' }, 400, 'easeInOutQuad');
                    })
                    $('#rot1').prepend(
                    $('<img/>', {
                        style: 'opacity:0',
                        className: 'bg'
                    }).load(
                    function () {
                        $(this).animate({ 'opacity': '1' }, 600);
                        $('#rot1 img:first').next().animate({ 'opacity': '0' }, 700, function () {
                            $(this).remove();
                        });
                    }
                ).attr('src', 'images/' + info_elem.find('.info_image').html()).attr('width', '800').attr('height', '300')
                );
                }
            });            
        </script>
 
</asp:Content>

