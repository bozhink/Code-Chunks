
;; ===============================================
;; Script: age.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:14:50 UTC
;; owners: ajmartin + timjohnsonsw [script library
;; members who can update this script]
;; ===============================================
;; ===============================================
;; email address(es) have been munged to protect
;; them from spam harvesters.
;; If you were logged on the email addresses would
;; not be munged
;; ===============================================
REBOL [
    Title: "Age"
    Date: 1-Sep-2002
    Name: 'Age
    Version: 3.0.0
    File: %age.r
    Author: "Andrew Martin"
    Needs: [%Days%20Per%20Month.r]
    Purpose: "Calulates Age in Years, Months & Days."
    eMail: %Al--Bri--xtra--co--nz
    Web: http://valley.150m.com
    Acknowledgements: "Ladislav Mecir"
    library: [
        level: 'beginner
        platform: []
        type: 'function
        domain: 'math
        tested-under: none
        support: none
        license: none
        see-also: none
    ]
]

Age?: function [
	"Calulates Age in Years, Months & Days."
	Birth [date!]	"Date of Birth."
	Date [date!]	"'now or future date."
	] [Years Months Days New] [
	if Date < Birth [
		return Age? Date Birth
		]
	Days: Date/day - Birth/day
	if negative? Days [
		Months: Birth/month + 1
		Years: Birth/year
		if Months > 12 [
			Months: 1
			Years: Years + 1
			]
		New: to date! reduce [1 Months Years]
		Days: New - Birth + Date/day - 1
		Birth: New
		]
	Months: Date/month - Birth/month
	Years: Date/year - Birth/year
	if negative? Months [
		Months: Months + 12
		Years: Years - 1
		]
	make object! compose [Years: (Years) Months: (Months) Days: (Days)]
	]

