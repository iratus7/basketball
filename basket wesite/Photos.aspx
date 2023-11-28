<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Photos.aspx.cs" Inherits="Photos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" />
    <script src="Scripts/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   

    <div class="CSSTableGenerator"> 
                
                       <table class="gallery clearfix">
                    <tr>
                        <th rowspan="5">
                            
                            <!--efe header--><div class="headerFilm"></div>

                        </th>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a1" runat="server"><asp:Image ID="i1" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><asp:Label runat="server" ID="t1"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a2" runat="server"><asp:Image ID="i2" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><asp:Label runat="server" ID="t2"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a3" runat="server"><asp:Image ID="i3" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><asp:Label runat="server" ID="t3"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a4" runat="server"><asp:Image ID="i4" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><asp:Label runat="server" ID="t4"></asp:Label></td>
                    </tr>
                    <tr>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a5" runat="server"><asp:Image ID="i5" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><asp:Label runat="server" ID="t5"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a6" runat="server"><asp:Image ID="i6" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><asp:Label runat="server" ID="t6"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a7" runat="server"><asp:Image ID="i7" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><asp:Label runat="server" ID="t7"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a8" runat="server"><asp:Image ID="i8" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><asp:Label runat="server" ID="t8"></asp:Label></td>
                    </tr>
                    <tr>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a9" runat="server"><asp:Image ID="i9" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><asp:Label runat="server" ID="t9"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a10" runat="server"><asp:Image ID="i10" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><asp:Label runat="server" ID="t10"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a11" runat="server"><asp:Image ID="i11" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><br /><asp:Label runat="server" ID="t11"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a12" runat="server"><asp:Image ID="i12" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><br /><asp:Label runat="server" ID="t12"></asp:Label></td>
                    </tr>
                    <tr>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a13" runat="server"><asp:Image ID="i13" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><br /><asp:Label runat="server" ID="t13"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a14" runat="server"><asp:Image ID="i14" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><br /><asp:Label runat="server" ID="t14"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a15" runat="server"><asp:Image ID="i15" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><br /><asp:Label runat="server" ID="t15"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a16" runat="server"><asp:Image ID="i16" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><br /><asp:Label runat="server" ID="t16"></asp:Label></td>
                    </tr>
                    <tr>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a17" runat="server"><asp:Image ID="i17" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><br /><asp:Label runat="server" ID="t17"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a18" runat="server"><asp:Image ID="i18" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><br /><asp:Label runat="server" ID="t18"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a19" runat="server"><asp:Image ID="i19" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><br /><asp:Label runat="server" ID="t19"></asp:Label></td>
                    <td><a href="#" rel="prettyPhoto[gallery2]" title="" id="a20" runat="server"><asp:Image ID="i20" runat="server" AlternateText="N/A IMAGE" alt="" /><br /></a><br /><asp:Label runat="server" ID="t20"></asp:Label></td>                   
                     </tr>
                          </table>
 
                    
            </div>



    <!--photo jquery -->
    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            $("area[rel^='prettyPhoto']").prettyPhoto();

            $(".gallery:first a[rel^='prettyPhoto']").prettyPhoto({ animation_speed: 'normal', theme: 'light_square', slideshow: 3000, autoplay_slideshow: true });
            $(".gallery:gt(0) a[rel^='prettyPhoto']").prettyPhoto({ animation_speed: 'fast', slideshow: 10000, hideflash: true });

            $("#custom_content a[rel^='prettyPhoto']:first").prettyPhoto({
                custom_markup: '<div id="map_canvas" style="width:260px; height:265px"></div>',
                changepicturecallback: function () { initialize(); }
            });

            $("#custom_content a[rel^='prettyPhoto']:last").prettyPhoto({
                custom_markup: '<div id="bsap_1259344" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div><div id="bsap_1237859" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6" style="height:260px"></div><div id="bsap_1251710" class="bsarocks bsap_d49a0984d0f377271ccbf01a33f2b6d6"></div>',
                changepicturecallback: function () { _bsap.exec(); }
            });
        });
    </script>

    <!-- Kinoumeno Background -->
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
</script>   


</asp:Content>

