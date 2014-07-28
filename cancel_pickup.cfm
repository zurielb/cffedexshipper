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

		<cfset fedexReply = fedexShipper.cancelPickupRequest(
			confirmationNumber = 1,
			location = "GVTA",
			scheduledDate = DateAdd('h', 12, Now()),
			carrierCode = "FDXE",
			reason = "Not needed anymore",
			
			returnRawResponse = false
		) />

		<section id="fedexPickupRequest">
			<h2>Fedex Cancel Pickup Request</h2>
			<cfdump var="#fedexReply#" expand="true" label="Fedex Cancel Pickup Request Result" />
		</section>
	</section>
</body>
</html>