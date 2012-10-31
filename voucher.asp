<%@LANGUAGE="javascript"%>
<!--#include virtual="/PDF/fpdf.asp"-->
<%//=======================================================
  //Written By : vinaya
  //Written Date : 31/03/2011
  //Description : This page is for converting form values in to pdf 
  //=======================================================
%>

<%

   var fname = Session("FirstName");
   var lname = Session("LastName");
      var Country = Session("CountryOrigin");
   var Vocherno = Session("vocher_Number1");
   var Vno = Vocherno
  var Date1 = Session("vocher_ValidDate1");
   var validate = Date1; 
   
  

    //var Date1= (new Date()).format('dddd, mmmm dd, yyyy.');
   //var Date1 = Day((Session("vocher_ValidDate1")));
   //var d = (new Date());
   //var d1=new Date(dateString)
 
var datetime=new Date();

var month=datetime.getMonth() 

var d=datetime.getDate() 

var datetime=new Date() 


//var d1=new Date();
//d1.toString('yyyy-MM-dd');       //returns "2009-06-29"
//d1.toString('dddd, MMMM ,yyyy') 
//
// var now = new Date();
//    var days = new Array(
//      'Sunday','Monday','Tuesday',
//      'Wednesday','Thursday','Friday','Saturday');
//    var months = new Array(
//      'January','February','March','April','May',
//      'June','July','August','September','October',
//      'November','December');
//    var date = ((now.getDate()<10) ? "0" : "")+ now.getDate();
//    function fourdigits(number)	{
//      return (number < 1000) ? number + 1900 : number;}
//    today =  days[now.getDay()] + ", " +
//       months[now.getMonth()] + " " +
//       date + ", " +
//       (fourdigits(now.getYear()));
    

   //var name = fname &" "& lname;
   //Response.write(Session("vocher_Number1"))
  Response.write(d)
//    Response.write(Date1)
//   
  

    // Creation of the object
     pdf = new FPDF();
     
    // Header functions
     pdf.Header = function Header()
     {
       // image name,x position,y position,width and height
	   this.Image('Header.JPG',15,14,180,20);
	   //Carries out line interruption
       this.Ln(12);
      }
	 // Footer function
	 pdf.Footer = function Footer()
     {
       this.SetY(-20);
       this.SetFont('Arial','',8.5);
	   this.Image('footer-border.JPG',15,275,180,0.005);
	   this.Cell(0,4,'© 2011 Edusys Services Private Limited, UK (VMEdu, Inc., US)',0,1,'C');
	   this.Cell(20);
	   this.Cell(40,4,'ITIL®  is a registered trade mark of the Cabinet Office. The Swirl logo™ is a trade mark of the Cabinet Office.',0);
       /*this.Cell(0,10,'Page '+ this.PageNo()+ '/{nb}',0,0,'C');*/
	   
      }

    // Main
    pdf.CreatePDF();
    //It sets up the containing distance of directory the fonts,
   //the extensions and the models
    pdf.SetPath("fpdf/");
   // create a new document pdf
    pdf.Open();
   //add one page to document pdf
    pdf.AddPage();
	// create  border for the page using line 
   //set the width of the line
    pdf.SetLineWidth (0.4)
	//set the color of the line
	pdf.SetDrawColor(128,128,128)
	//left side line
    pdf.Line(7,7,7,290)
	//top line
	pdf.Line(7,7,202.5,7)
	//right side line
	pdf.Line(202.5,7,202.5,290)
	//bottom line
	pdf.Line(7,290,202.5,290)
	
    pdf.Image('watermark.JPG',60,36,97,70);
	// Text the font to use (Arial), style and dimension (6)
	pdf.SetFont('Times','B',20);
	//line break
	pdf.Ln(20);
	pdf.SetTextColor(70,130,180 );
    pdf.Cell(190,7,'ITILstudy Exam voucher',0,1,'C');
	pdf.Ln(20);
	 
	pdf.SetTextColor(0,0,0);
	pdf.SetFont('Arial','',11);
	pdf.Ln(10);
	pdf.Cell (20);
	pdf.MultiCell(150,5,'This voucher entitles  '+ fname +' ' + lname +'  to take the ITIL® Foundation Exam.',0,'J',0);
	
	pdf.Ln(8);
	pdf.Cell (20)
	pdf.Cell (150,4,'Your unique voucher code is:  '+ Vocherno+'  and is valid till  '+  d + ' ',0);
	pdf.Ln(8);
	pdf.Image('signature.JPG',30,97,150,13);
	pdf.Ln(35);
	pdf.SetFillColor(245,245,245);
	pdf.SetDrawColor(144,238,144)
	//
	w=pdf.GetStringWidth('Valid only for : ITIL® Foundation Exam')+3.5;
    pdf.SetX((100-w)/2);
    //cell width(40),height(5),string,border(0),line break(1),text align(c)
    pdf.Cell(180,8,'Valid only for : ITIL® Foundation Exam',1,1,'C',true);
    pdf.SetFillColor(0,0,0);
	pdf.Ln(6);
	pdf.Cell (20);
	pdf.SetFont('Arial','B',11);
	pdf.Cell (150,4,'Points to note:',0);
	pdf.SetFont('Arial','',11);
	pdf.Ln(7);
	pdf.Cell (30);
	pdf.Cell (150,4,'1. Please ensure that you have your voucher with you when you arrange your exam.',0);
	pdf.Ln(5);
	pdf.Cell (30);
	pdf.Cell (150,4,'2. Please present your voucher at the exam centre.',0);
	pdf.Ln(5);
	pdf.Cell (30);
	pdf.Cell (150,4,'3. Voucher can be presented only once at an exam centre.',0);
	pdf.Ln(5);
	pdf.Cell (30);
	pdf.Cell (150,4,'4. The voucher is valid only in '+ Country +' ',0);
	pdf.Ln(5);
	pdf.Cell (30);
	pdf.Cell (150,4,'5. This voucher is non-transferable.',0);
	pdf.Ln(10);
	pdf.Cell (20);
	pdf.SetFont('Arial','B',11);
	pdf.Cell (150,4,'HOW TO REDEEM YOUR EXAM VOUCHER AND SCHEDULE YOUR EXAM',0);
	pdf.SetFont('Arial','',11);
	pdf.Ln(7);
	pdf.Cell (30);
	pdf.Cell (4,5,'1. ',0);
	pdf.MultiCell(150,5,'For students based in the US, please email to examination@apmg-us.com with your unique 10-digit code to redeem your voucher and schedule your exam. Please note that there will be an additional fee of US $50 for Foundation level exam and $67 for Non-Foundation Level Exam, for booking your exam at PSI, payable at the time of booking with PSI. For details please visit http://candidate.psiexams.com/ .',0,'L',0);
	pdf.Ln(4);
	pdf.Cell (30);
	pdf.Cell (4,5,'2. ',0);
	pdf.MultiCell(150,5,'For other students, visit the APMG website and find your local APMG office to redeem your voucher and schedule your exam.',0,'L',0);
	pdf.Ln(4);
	pdf.Cell (30);
	pdf.Cell (4,5,'3. ',0);
	pdf.MultiCell(150,5,'If you cannot find a local APMG office please contact APMG-UK via email at servicedesk@APMG-international.com or call +44 1494 452450 to redeem your voucher and schedule your exam.',0,'L',0);
		
	 
  pdf.Output();
 %>