<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>cffedexshipper</title>
	<link href="main.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<h1><a href="/">cffedexshipper</a></h1>
	</header>
	<nav>
		<a href="index.cfm">GetRates</a> | <a href="ship.cfm">ProcessShipmentRequest</a> | <a href="pickup.cfm">CreatePickupRequest</a>
	</nav>
	<section id="content">
		<cfset fedexShipper = new FedexShipper(
			key = "AUTHENTICATION_KEY",
			password = "AUTHENTICATION_PASSWORD",
			accountNo = "ACCOUNT_NUMBER",
			meterNo = "METER_NUMBER",
			sandbox = true
		) />

		<cfset fedexReply = fedexShipper.createPickupRequest(
			shipperName = "Customer Service",
			shipperCompany = "Company Name",
			shipperPhone = "2141112233",
			shipperAddress1 = "6060 N Central Expwy.",
			shipperCity = "Dallas",
			shipperState = "TX",
			shipperZip = "75206",
			shipperCountry = "US",
			shipperIsResidential = false,
			
			weight = "1",
			packageCount = "1",
			pickupDate = DateAdd('h', Now(), 12),
			
			returnRawResponse = true
		) />

		<section id="fedexPickupRequest">
			<h2>Fedex Pickup Request</h2>
			<cfdump var="#fedexReply#" expand="true" label="Fedex Pickup Request Result" />
		</section>
	</section>
</body>
</html>