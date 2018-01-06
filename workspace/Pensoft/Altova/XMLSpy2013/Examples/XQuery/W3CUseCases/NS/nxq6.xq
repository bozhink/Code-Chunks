(:
XML Query Use Cases: http://www.w3.org/TR/xquery-use-cases/
Copyright ©2003 World Wide Web Consortium, (Massachusetts Institute of Technology, European Research Consortium for Informatics and Mathematics, Keio University). All Rights Reserved. This work is distributed under the W3C® Software License [1] in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
[1] http://www.w3.org/Consortium/Legal/2002/copyright-software-20021231
 Filename: nsQ6.xq  Section: 1.7.4.6 Q6  Select the closing time elements of all AnyZone auctions currently monitored. :)

declare namespace ma = "http://www.example.com/AuctionWatch";
declare namespace anyzone = "http://www.example.com/auctioneers#anyzone";

<Q6 xmlns:ma="http://www.example.com/AuctionWatch">
  {
    doc("auction.xml")//ma:Auction[@anyzone:ID]/ma:Schedule/ma:Close
  }
</Q6>























