<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Gifts Order</title>
<!-- CSS -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jNice.js"></script>
<script language="JavaScript" src="js/calendar_us.js"></script>
<link rel="stylesheet" href="css/calendar.css">
</head>
<body>
<!--#include virtual="/includes/connection.asp"-->
<div id="wrapper">
  <!--#include file="includes/topMenu.asp"-->
  <!-- // #end mainNav -->
  <div id="containerHolder">
    <div id="container">
      <div id="sidebar">
        <!--#include file="includes/leftMenu.asp"-->
        <!-- // .sideNav -->
      </div>
      <!-- // #sidebar -->
      <!-- h2 stays for breadcrumbs -->
      <h2><a href="home.asp">Home</a> &raquo; <a href="ups_ordered_gifts.asp" class="active">Order Gifts</a></h2>
      <div id="main">
        <h3>Order Gifts</h3>
        <fieldset>
		<form action="ccc.asp" method="post">
        <table border="0" cellpadding="15" cellspacing="10" width="70%">
			<tr>
				<td colspan="2"><b><div align="center">Gifts</div></b></td>
				<td><b>Expected Date</b></td>
			</tr>
			<tr>
				<td width="25%">4 in 1 Pens :</td><td width="15%"><input type="text" name="pens" size="2" /></td>
				<td><form name="pensForm">
						<input type="text" name="pensCal" size="10" />
							<script language="JavaScript">
								new tcal ({
								// form name
								'formname': 'pensForm',
								// input name
								'controlname': 'pensCal'
							});
							</script>
					</form>
				</td>
			</tr>
			<tr>				
				<td>Highlighter Neon Yellow :</td><td><input type="text" name="pens" size="2" /></td>
				<td><form name="yellowForm">
						<input type="text" name="yellowCal" size="10" />
							<script language="JavaScript">
								new tcal ({
								// form name
								'formname': 'yellowForm',
								// input name
								'controlname': 'yellowCal'
							});
							</script>
					</form>
				</td>
			</tr>
			<tr>
				<td>Highlighter Neon Green :</td><td><input type="text" name="pens" size="2" /></td>
				<td><form name="greenForm">
						<input type="text" name="greenCal" size="10" />
							<script language="JavaScript">
								new tcal ({
								// form name
								'formname': 'greenForm',
								// input name
								'controlname': 'greenCal'
							});
							</script>
					</form>
				</td>
			</tr>
			<tr>
				<td>Pencil - Z- Grip :</td><td><input type="text" name="pens" size="2" /></td>
				<td><form name="pencilForm">
						<input type="text" name="pencilCal" size="10" />
							<script language="JavaScript">
								new tcal ({
								// form name
								'formname': 'pencilForm',
								// input name
								'controlname': 'pencilCal'
							});
							</script>
					</form>
				</td>
			</tr>
			<tr>
				<td>Quick point Pen Holder :</td><td><input type="text" name="pens" size="2" /></td>
				<td><form name="penholderForm">
						<input type="text" name="penholderCal" size="10" />
							<script language="JavaScript">
								new tcal ({
								// form name
								'formname': 'penholderForm',
								// input name
								'controlname': 'penholderCal'
							});
							</script>
					</form>
				</td>
			</tr>
			<tr>
				<td>Robot Series Calculator :</td><td><input type="text" name="pens" size="2" /></td>
				<td><form name="calcuForm">
						<input type="text" name="calcuCal" size="10" />
							<script language="JavaScript">
								new tcal ({
								// form name
								'formname': 'calcuForm',
								// input name
								'controlname': 'calcuCal'
							});
							</script>
					</form>
				</td>
			</tr>
			<tr>
				<td>Backpack Travel :</td><td><input type="text" name="pens" size="2" /></td>
				<td><form name="backpackForm">
						<input type="text" name="backpackCal" size="10" />
							<script language="JavaScript">
								new tcal ({
								// form name
								'formname': 'backpackForm',
								// input name
								'controlname': 'backpackCal'
							});
							</script>
					</form>
				</td>
			</tr>
			<tr>
				<td>Cap :</td><td><input type="text" name="pens" size="2" /></td>
				<td><form name="capForm">
						<input type="text" name="capCal" size="10" />
							<script language="JavaScript">
								new tcal ({
								// form name
								'formname': 'capForm',
								// input name
								'controlname': 'capCal'
							});
							</script>
					</form>
				</td>
			</tr>
			<tr>
				<td>Stress Ball :</td><td><input type="text" name="pens" size="2" /></td>
				<td><form name="ballForm">
						<input type="text" name="ballCal" size="10" />
							<script language="JavaScript">
								new tcal ({
								// form name
								'formname': 'ballForm',
								// input name
								'controlname': 'ballCal'
							});
							</script>
					</form>
				</td>
			</tr>
			<tr>
				<td>Post It Notes :</td><td><input type="text" name="pens" size="2" /></td>
				<td><form name="notesForm">
						<input type="text" name="notesCal" size="10" />
							<script language="JavaScript">
								new tcal ({
								// form name
								'formname': 'notesForm',
								// input name
								'controlname': 'notesCal'
							});
							</script>
					</form>
				</td>
			</tr>
          	<tr>
				<td colspan="3"><div align="center"><input type="submit" name="sumbit" value="Submit" />&nbsp;&nbsp;<input type="reset" value="Reset" /></div></td>
			</tr>
        </table>
		</form>
        </fieldset>
      </div>
      <!-- // #main -->
      <div class="clear"></div>
    </div>
    <!-- // #container -->
  </div>
  <!-- // #containerHolder -->
  <p id="footer">&nbsp;</p>
</div>
<!-- This Script For Calendar -->
<script type="text/javascript">
   			<!--  to hide script contents from old browsers
   			var startDate;
   			var endDate;

   			function resetDates() {
   				startDate = endDate = null;
   			}

   			function filterDates1(cal) {
   				startDate = new Date(cal.date)
   				startDate.setHours(0,0,0,0)	// used for compares without TIME
   				/* If they haven't chosen an
   				end date before we'll set it to the same date as the start date This
   				way if the user scrolls in the start date 5 months forward, they don't
   				need to do it again for the end date.
   				*/

   				if (endDate == null) {
   					Zapatec.Calendar.setup({
   						inputField     :    "checkOut_date",
   						button         :    "button8b",  // What will trigger the popup of the calendar
   						ifFormat       :    "%b %d, %Y",
   						date           :     cal.date,
   						showsTime      :     false,          //no time
   						dateStatusFunc		:    disallowDateBefore, //the function to call
   						onUpdate       :    filterDates2
   					});
   				}
   			}

   			function filterDates2(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}

   			/*
   			* This functions return true to disallow a date
   			* and false to allow it.
   			*/


   			/*
   			* Check-Out calendar allowed dates
   			* Check-Out date can not be BEFORE Check-In date
   			* Check-Out date can not be before today
   			*/
   			function disallowDateBefore(dateCheckOut) {
   				dateCheckOut.setHours(0,0,0,0)
   				if ((startDate != null) && startDate > dateCheckOut)
   					// startDate is defined, make sure cal date is NOT before start date
   					return true;

   				var now = new Date()
   				now.setHours(0,0,0,0)
   				if (dateCheckOut < now)
   					// check out date can not be befor today if startDate NOT defined
   					return true;

   				return false;
   			}

   			/*
   			* Check-In date checking
   			* Check-In date can not be AFTER Check-Out date
   			* Check-In date can not be before today
   			*/
   			function disallowDateAfter(dateCheckIn) {
   				dateCheckIn.setHours(0,0,0,0)
   				if ((endDate != null) && dateCheckIn > endDate)
   					// endDate defined, calendar date can NOT be after endDate
   					return true;

   				var now = new Date()
   				now.setHours(0,0,0,0)

   				if (dateCheckIn < now)
   					// endDate NOT defined, calendar date can not be before today
   					return true;

   				return false;
   			}

   			// end hiding contents from old browsers  -->
   		</script>
<script type="text/javascript">

   			var disallowDateAfter
   			var disallowDateBefore
   			var filterDates1
   			var filterDates2
   			var cal = new Zapatec.Calendar.setup({

   	         inputField     :    "checkIn_date",   // id of the input field
   	         button         :    "button8a",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         dateStatusFunc    :    disallowDateAfter, //the function to call
   	         onUpdate       :    filterDates1

   			});

   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkOut_date",
   	         button         :    "button8b",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         dateStatusFunc    :    disallowDateBefore, //the function to call
   	         onUpdate       :    filterDates2
   	      });

   		</script>
<!-- // #wrapper -->
</body>
</html>
