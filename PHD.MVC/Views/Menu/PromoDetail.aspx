﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/PHD3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="PHD.Session.Classes" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="NHibernate.Criterion" %>
<%@ Import Namespace="PHD.Service.ModelService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    PromoDetail
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    function checkEvent(id) {
    //var nilai = document.getElementById("modifier0").value;
    //var nilai = $('input:radio[name=modifier0:checked').val();
    //alert(nilai);
    if(validate(id)){
    var nilai = '1';
        $.ajax({
            type: 'POST',
            dataType: 'json',
            cache: false,
            url: '<%:Url.Content("~/Menu/CheckEvent/") %>',
            data: {
            pizzatype : nilai,
        },
        success: function (data) {
            result = data;
            if (result != null) {
                //alert('usa');
                document.getElementById("popup").click();
                //$('#popup').trigger('click');
            }
            else {
                $("#PromoDetail").submit(); //$.post(id);
            }
        }
    })
    }
}

function validate(idmenu)
{
    var ret = true;
    if(idmenu == 20 || idmenu == 21 || idmenu == 22){
        if($('input:radio[name=modifier0]:checked').length <= 0){
            alert('Pilih topping Original Pizza Regular pertama');
            ret = false;
        }
        if($('input:radio[name=modifier1]:checked').length <= 0){
            alert('Pilih topping Original Pizza Regular kedua');
            ret = false;
        }
    }

    return ret;
}

</script>
    <div class="menu-title">
	    <img src="<%:Url.Content("~/Content/_design/images/hotpromo.png") %>">
    </div>
    <div class="content-left">
	    <nav class="nav-content-left">
		    <ul>
			    <li class = "active">
					<a id="menu1" href="<%:Url.Content("~/menu/promo")%>"><span>Hot Promo</span></a>
				</li>
				<li>
					<a id="menu2" href="<%:Url.Content("~/menu/hemat")%>"><span>Hot Hemat</span></a>
				</li>
                 <li>
					<a id="menu5" href="<%:Url.Content("~/menu/DoublePizza")%>"><span>Pizza Double</span></a>
				</li>
				<li>
					<a id="menu3" href="<%:Url.Content("~/menu/hotmenu")%>"><span>Hot Menu</span></a>
				</li>
				<li>
					<a id="menu4" href="<%:Url.Content("~/menu/favorite")%>"><span>My Favorite</span></a>
				</li>
               
		    </ul>
	    </nav>
        <form method="post" id="PromoDetail">
        <input type="hidden" name="box" id="box"/>
	    <div class="content-left-container">
		    <nav class="nav-menu">
			   <ul>
                <% foreach (var item in ViewBag.menu)
                    {%>
					<li>
						<a href="/Menu/MenuUtama/<%:item.Id%>"><%: item.title %></a>
					</li>
                    <%} %>
				</ul>
		    </nav>
		    <p class="menu-notes">
			    <small>Harga dalam .000 Rupiah dan sudah termasuk pajak.</small>
		    </p>
		    <div class="hot-promo-container">
							
			    <div class="menu-container">
				    <div class="title">
					    <%: ViewBag.submenupromo.name %>
				    </div>
				    <ul class="menu-list">
					    <li>
						    <%: ViewBag.submenupromo.text %>
					    </li>
				    </ul>
				    <div class="price">
					    Rp <%: ViewBag.submenupromo.price %>
				    </div>
                    <% IEnumerable<Modifier> modpromoall = (IEnumerable<Modifier>)ViewBag.modpromoall;%>
				    <div class="menu-slide-container">
					    <ul class="menu-slide-list">
                        <% int i = 0; %>
                        <% while (i <= modpromoall.Max(x => x.sequence))
                           { %>
                           <%List<ICriterion> Crit = new List<ICriterion>();
                             Crit.Add(Restrictions.Eq("menu.Id", ViewBag.submenupromo.menu.Id));
                             Crit.Add(Restrictions.Eq("sequence", i));

                             Modifier modifiertop = new ModifierService().FindByCriteria(Crit);
                             string txtchecked = ""; %>
                        <li>
                                <div class="title">
								    <%: modifiertop.text%>
							    </div>
							    <div class="menu-slide menu-white-box">
                                <ul class="slide">
                                <%foreach (var item in modpromoall)
                                  {
                                      if (item.sequence == i)
                                      {%>
                                       <% if(item.position==0) {
                                           txtchecked = "checked";
                                       } else {
                                           txtchecked = null;}
                                        %>
                                        <li>
                                        <label>
								            <div class="title">
									            <%: item.name%>
								            </div>
	    							        <img src="<%: Url.Content("~"+item.image) %>">
                                        </label>
                                        <div>
                                           <input id="Radio1" name="modifier<%:i%>" type="radio" value="<%:item.Id %>">
                                           </div>
								         </li>

                                 <%     }
                                  }%>
                                  </ul>
                                </div>
                        </li>
                        <%i++;
                           } %>
					    </ul>
									
				    </div>

			    </div>
							
			    <input type="button" id="submitbtn"  value="Pesan" onclick="checkEvent(<%:ViewBag.data %>);" class="order-button">
							
		    </div>
	    </div>
        </form>
					
	    <div class="content-left-bottom">
        <div style="display:none">
        <a id="popup" class="ir fancybox-area fancybox.ajax"
        href="<%:Url.Content("~/Menu/PickBox/"+ViewBag.data) %>"><span>asdf</span></a>
        </div>
	    </div>
    </div>
				

</asp:Content>
