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
		<a href="index.cfm">GetRates</a> | <a href="ship.cfm">ProcessShipmentRequest</a> | <a href="pickup.cfm">CreatePickupRequest</a> | <a href="cancel_pickup.cfm">CancelPickupRequest</a>
	</nav>
	<section id="content">
		<cfset fedexShipper = new FedexShipper(
			key = "AUTHENTICATION_KEY",
			password = "AUTHENTICATION_PASSWORD",
			accountNo = "ACCOUNT_NUMBER",
			meterNo = "METER_NUMBER",
			sandbox = true
		) />

		<cfset fedexReply = fedexShipper.processShipmentRequest(
			shipperName = "Customer Service",
			shipperCompany = "Company Name",
			shipperPhone = "2141112233",
			shipperAddress1 = "6060 N Central Expwy.",
			shipperCity = "Dallas",
			shipperState = "TX",
			shipperZip = "75206",
			shipperCountry = "US",
			shipperIsResidential = false,
			
			shipToName = "First Last",
			shipToCompany = "Company Name",
			shipToPhone = "2145554433",
			shipToEmail = "first@firstlast.com",
			shipToAddress1 = "3217 Hidden Cove Drive",
			shipToCity = "Plano",
			shipToState = "TX",
			shipToZip = "75075",
			shipToCountry = "US",
			shipToResidential = false,
			
			weight = "1",
			length = "10",
			width = "20",
			height = "20",
			packagingType = "YOUR_PACKAGING",
			shippingMethod = "FEDEX_GROUND",
			shipDate = Now(),
			paymentType = "SENDER",
			billingAct = "ACCOUNT_NUMBER",
			
			imageType = "PNG",
			labelDirectory = ExpandPath('Labels/'),
			labelStockType = "PAPER_7X4.75"
		) />

		<section id="fedexShipmentRequest">
			<h2>Fedex Shipment Request</h2>
			<cfdump var="#fedexReply#" expand="true" label="Fedex Shipment Result" />
		</section>
	</section>
</body>
</html>