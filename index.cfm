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

		<cfset result = fedexShipper.getRates(
			shipperZip = "75201",
			shipperState = "TX",
			shipperCountry = "US",
			shipToZip = "75301",
			shipToState = "TX",
			shipToCountry = "US",
			pkgWeight = "1",
			pkgValue = "10",
			shipToResidential = true
		) />

		<section id="residentialFedexShipper">
			<h2>Residential Fedex Rates</h2>
			<cfif result.success>
				<ul>
					<cfloop from="1" to="#arraylen(result.rates)#" index="n">
						<cfoutput>
							<li>#result.rates[n].type# - #DollarFormat(result.rates[n].totalNetCharge)#</li>
						</cfoutput>
					</cfloop>
				</ul>
			</cfif>
			<cfdump var="#result#" expand="false" label="Fedex Rates" />
		</section>

		<cfset result = fedexShipper.getRates(
			shipperAddress1 = "6060 N Central Expwy.",
			shipperCity = "Dallas",
			shipperState = "TX",
			shipperZip = "75206",
			shipperCountry = "US",
			shipToAddress1 = "3217 Hidden Cove Drive",
			shipToCity = "Plano",
			shipToState = "TX",
			shipToZip = "75075",
			shipToCountry = "US",
			pkgWeight = "1",
			shipToResidential = false
		) />

		<section id="commercialFedexShipper">
			<h2>Commercial Fedex Rates</h2>
			<cfif result.success>
				<ul>
					<cfloop from="1" to="#arraylen(result.rates)#" index="n">
						<cfoutput>
							<li>#result.rates[n].type# - #DollarFormat(result.rates[n].totalNetCharge)#</li>
						</cfoutput>
					</cfloop>
				</ul>
			</cfif>
			<cfdump var="#result#" expand="false" label="Fedex Rates" />
		</section>
	</section>
</body>
</html>