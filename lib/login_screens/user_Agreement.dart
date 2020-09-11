import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class agree extends StatefulWidget {
  agree({Key key}) : super(key: key);

  @override
  _agreeState createState() => _agreeState();
}

class _agreeState extends State<agree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

  appBar: AppBar(
                centerTitle: true,
                title: Text(
    translator.translate("user")+" "+translator.translate("agreement")
,

                ),
                flexibleSpace: Image(
                  image: AssetImage('assets/appbar_bg.png'),
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    padding: const EdgeInsets.only(right: 20.0),
                    icon: Icon(
                      FontAwesomeIcons.commentAlt,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // do something
                    },
                  )
                ],
              ),

body:Padding(
  padding: const EdgeInsets.all(15.0),
  child:   SingleChildScrollView(
  
  
  
  child: Text(
  
  '''
  
  Article 1. Parties: This Framework Payment Services Agreement ("Agreement"); SiPay Electronic Money and Payment Services Inc. (SiPay) (MERSIs No: , Address: Maslak Mah. Bilim Sok. No:5 Sun Plaza Kat:7 Maslak-Sarıyer, Istanbul, Turkey - [info@sipay.com.tr] / [0212 706 11 12]) and payment service user who has approved this Agreement to provide the payment services specified under this Agreement from SIPAY ("Customer") (SIPAY and Customer will be separately referred to as "Parties").
  
  
  
  Article 2. Definitions: Unless expressly stated otherwise in the convention and annexes, it means the following. Buyer: The monetary value of payment storing electronically and used in the payment transactions accepted by Electronic Money: SIPAY and Its Representatives, which provide any support request [0850 210 5659] call center, which meets the call center of [0850 210 5659], which is requested by the fund subject to the payment and/or electronic money transaction and/or customer payment using SIPAY services to provide goods or services, Sensitive Payment Data: Personal security information for payment instrument, such as password, security question, certificate, encryption key and PIN, card number, expiration date, CVV2, CVC2 code used in issuance or authentication, which may allow fraud or fraudulent transactions if compromised or modified, from Monday to Friday except on Business Day: Public holidays , İşlem Limiti: Tek seferde ve/veya aylık olarak (toplamda) Müşteri tarafından gerçekleştirilebilen azami işlem tutarını, Kanun: 6493 sayılı Ödeme ve Menkul Kıymet Mutabakat Sistemleri, Ödeme Hizmetleri ve Elektronik Para Kuruluşları Hakkında Kanun'u, Kurum: Bankacılık Düzenleme ve Denetleme Kurumu'nu, Mevzuat: Kanun, Yönetmelik ve ilgili sair düzenlemeleri, SIPAY Hizmetleri: SIPAY tarafından BDDK'dan alınan izin kapsamında Alıcı tarafından sağlanan ürün/hizmet/servisler (alışveriş, tahsilat vb.) kapsamında Müşteriler'in Ödeme Hesabı'nda olan mevcut TL'leri üzerinden veyahut ihraç ettirecekleri Elektronik Para vasıtası ile ürün/hizmet/servis bedelinin tahsil edilerek Alıcı'ya ve/veya Alıcı'ya aktarılmak üzere ÖDEME HİZMETİ SAĞLAYICISI'na iletilmesine imkân sağlayan servisi, Ödeme Aracı: Ödeme Emri'ni vermek için kullanılan, Müşteri'ye ait şifre ve benzeri kişiye özel aracı, Ödeme Emri: Müşteri tarafından ödeme işleminin gerçekleşmesi amacıyla verilen talimatı , Payment Services: All payment and electronic money services provided by SIPAY based on the powers in the Law under this Agreement, Payment Service Provider: The organizations that have the necessary permissions in accordance with the legislation and provide payment services within the framework of these permissions shall refer to the Payment Account: Payment Services user on behalf of the Customer in the name of SIPAY and used in the execution of payment transactions that will match the Customer's GSM number, representative: Persons/persons acting on behalf of SIPAY on behalf of SIPAY and in order to carry out transactions within the scope of the services undertaken by SIPAY in the Agreement, Regulation: Payment Services and Electronic Money Obligation and Payment Institutions and Electronic Institutions and Electronic Institutions and Electronic Institutions.
  
  
  
  Article 3. Subject of the Agreement: Determination of the scope of the SIPAY Services and the rights and obligations of the Parties relating to these services to be presented to the Client in accordance with the Legislation by SIPAY.
  
  
  
  Article 4. With the Terms of Service, SIPAY is committed to providing the Customer with services as of the date of approval of the Agreement in accordance with articles 12 and 18 of the Law through SIPAY Services through the Fulfillment of the requirements for the service by the Customer. SIPAY is authorized to provide the SIPAY Services issued under this Agreement in person or through the Representative, and the rights and powers contained in the Agreement to the extent permitted by the Legislation and the operations of SIPAY may be fulfilled by the Representative.
  
  
  
  4.1 The Customer agrees that it cannot perform transactions on the Transaction Limit set out by SIPAY under Article 6.3 of the Agreement. SIPAY will be able to update the Transaction Limit at any time by reporting in accordance with the methods and periods set out in the Agreement.
  
  
  
  4.2 Under the Agreement, SIPAY is responsible for the transfer of the fees submitted by the Customer to him correctly and in accordance with Article 52(1) of the Regulation to the Buyer or Buyer's Payment Service Provider within the periods specified under the contract specified under the contract of the relevant party. If SIPAY does not fulfill this responsibility, it will refund the unrealized or incorrect portion of the payment process to the Customer without delay. In this context, SIPAY will be responsible for the relevant amounts if the Customer is paid any interest or fees. About Consumers: If the services under this Agreement are presented with a defective customer service, customer service is free to reappear, remedy the shame result of the service, discount the defective rate or one of the right to return from the Agreement.
  
  
  
  4.3 Customer shall not in any way allow access to the Payment Account to be created by SIPAY, as well as the Payment Agent and Sensitive Payment Data to which the account is associated, and will be responsible for ensuring their security. Customer also agrees that it will not disclose, use or use such information as a username and password for the Payment Account to third parties in any way, and will not use it for the purpose of being given to it. Customer agrees, declares and undertakes responsibility as specified in Article 4.5.2 in relation to damages caused by the use of both the Payment Tool and the username and password and/or its use of the password outside the intended purpose. Customer is obliged to notify SIPAY immediately through the Call Center if the Payment Tool is lost, stolen or a transaction that occurred against the customer's will is learned.
  
  
  
  4.4 Errant/Unauthorized Transactions:
  
  
  
  4.4.1 If sipay is notified of unauthorized or incorrect transactions in any transaction, it will be able to request a correction within 13 (thirteen) months following the payment process immediately and in any case. In this case, the relevant transaction fee will not be transferred to the Buyer or Buyer's Payment Service Provider and will be returned directly to Customer by SIPAY. If the relevant transaction fee has been transferred to the Buyer or Buyer's Payment Service Provider as of the date of the notice in question, SIPAY transfers the relevant amounts to customer by requesting a refund from the Buyer or Buyer's Payment Service Provider.
  
  
  
  4.4.2 In the event that the Payment Tool is used by others due to the use of a lost or stolen Payment Instrument or because personal security information is not properly stored, customer is responsible for the portion of the damage arising from the payment transactions not authorized by the Customer to 150 Turkish Liras. The Customer shall not be liable for the unauthorized payment transactions that take place after the notice made in accordance with Article 4.4. However, customer shall be liable for all damages arising from unauthorized transaction if he fraudulently uses the Payment Tool and does not fulfill his obligations under Article 4.4 with intentional or gross negligence.
  
  
  
  4.4.3 Both buyer and/or recipient's Payment Service Provider, and SIPAY, shall not accept the payment in the event of fraudulent action by examining customer's authorizations if the person who uses the unauthorized transaction (the person who uses any Payment Agent is not the person authorized or who has information to perform the transaction) shall not accept the payment in the event of fraudulent action. Customer agrees that there will be no right to claim in this case.
  
  
  
  4.4.4 The amount of sipay's damages arising from the transaction may be deducted from the relevant price if the buyer and/or buyer's payment service provider is withdrawn due to incorrect and unauthorized transaction. The customer is obliged to notify SIPAY immediately of incorrect and unauthorized transactions.
  
  
  
  4.4.5 Reimbursement for transactions initiated by the Buyer: Customer may request payment of the amount of payment at the time of authorization in the payment process authorized by the Buyer or initiated through the Buyer within 2 (two) months from the date of the payment process, and if the amount of the payment transaction realized exceeds the amount stipulated by taking into account the expense history, contract terms and other relevant considerations, the amount of the payment process shall be repaid as much as the amount of the payment transaction. SIPAY has the right to ask The Client to provide facts-based evidence of his request. However, if the confirmation for the payment process is submitted directly to SIPAY or the payment is notified to customer at least 1 (one) month before the date from which payment must be made, Customer may not request any refund for the relevant payment transaction. In cases where a refund is requested in accordance with this article, SIPAY will make the payment within 10 (ten) Business Days or report the decision of refusal by showing the legal means that the Customer may apply, along with the reasons.
  
  
  
  4.5 The following information about the payment transactions carried out under the Agreement will be shared with the Customer through the mobile application to which the Payment Account is linked after each transaction:
  
  
  
  4.5.1 Payment-specific reference information and information about buyer
  
  
  
  4.5.2 Amount of payment transaction in the currency in which customer's Payment Account is charged or in the currency specified in the payment order
  
  
  
  4.5.3 Breakdown of total fees and fees to be paid by customer for payment
  
  
  
  4.5.4 Exchange rate information applied in the payment process, if any, and the amount of the payment transaction calculated using this exchange rate
  
  
  
  4.5.5 Information about the date when the Payment Order was received or the customer's account was charged
  
  
  
  4.6 SIPAY is responsible for transferring amounts that can only be charged to the Buyer or Buyer's Payment Service Provider from customer and not returned to customer in accordance with the applicabil regulatory provisions and rules and practices. Customer agrees that buyer and/or Recipient's Payment Service Provider may request directly from him regarding amounts that cannot be collected from customer for any reason, and in this context, SIPAY shall not be liable.
  
  
  
  4.7           Müşteri’nin SIPAY Hizmetleri’ni kullanarak Alıcı’dan temin ettiği mal veya hizmet yahut bunların temin veya teslimi ile ilgili SIPAY’ın herhangi bir sorumluluğu bulunmamaktadır. Mal veya hizmetin yasalara ve ahlaka uygun olmasını ve eksiksiz olarak temin veya teslim edilmesini sağlamak ilgili mal veya hizmetin sağlayıcısının yükümlülüğündedir. Müşteri, mal veya hizmetin sağlayıcısı ile arasında çıkabilecek her türlü ihtilafta SIPAY’ın taraf olmadığını; burada sayılanlarla sınırlı olmaksızın, işleme itiraz etmesi, mal veya hizmeti iade talep etmesi, ayıplı mal veya hizmet iddiasında bulunması dahil Tüketicinin Korunması Hakkında Kanun, Borçlar Kanunu ve ilgili mevzuata dayanan taleplerini doğrudan ilgili mal veya hizmetin sağlayıcısına ileteceğini, bu kapsamda doğacak talep, itiraz, soru, sorun, şikayet ve benzeri hallerde SIPAY’ın herhangi bir sorumluluğu bulunmadığını kabul, beyan ve taahhüt eder. Müşteri tarafından satın alımı gerçekleştirilen mal ve/veya hizmetlere ilişkin faturayı/fişi doğrudan mal ve/veya hizmeti temin eden Alıcı kesecek olup, Müşteri bu kapsamda SIPAY’ın herhangi bir sorumluluğunun söz konusu olmadığını kabul eder. Müşteri, kural olarak Alıcı’dan temin ettiği mal veya hizmete ilişkin talep ve şikayetlerini doğrudan ilgili mal veya hizmetin sağlayıcısı konumundaki Alıcı’ya yöneltecektir. Bu madde kapsamında Müşteri, mal veya hizmet temin veya teslimine ilişkin olarak SIPAY’a ilettiği her türlü talep, itiraz, soru, sorun, şikayet vs. bildirimin ilgilisine yönlendirileceğini ve bu talep, itiraz, soru, sorun, şikayet vs. bildirimin giderilmesi ile ilgili olarak SIPAY’ın herhangi bir sorumluluğunun söz konusu olmadığını kabul eder. Temin edilen mal veya hizmetler ile bunların iadesine ilişkin olarak ilgili mal veya hizmetin sağlayıcısı konumundaki Alıcı tarafından öngörülen kurallar geçerli olacaktır.
  
  
  
  4.8           SIPAY, Sözleşme kapsamında tahsil edilen tutarlara faiz işletmeyecek yahut mal veya hizmet alımından kaynaklanan ödeme işleminin gerçekleştirilmesi amacıyla herhangi bir ödeme hesabına bağlı Ödeme Aracı ihracında bulunmayacak, kredi verme, taksitlendirme, tahsil edilemeyen tutarlara ilişkin ödeme veya ödeme garantisi verme yahut bu anlama gelecek faaliyetler gerçekleştirmeyecektir. SIPAY, Elektronik Para karşılığında alınan fona faiz işletmeyecek, Müşteri’ye fonun miktarına veya tutulduğu süreye bağlı menfaat sağlamayacaktır. Müşteri, SIPAY’tan bu kapsamda bir talepte bulunamayacağını kabul ve beyan eder.
  
  
  
  4.9           SIPAY Hizmetleri’nin kullanılabileceği mecralar ile SIPAY Hizmeti kullanılarak temin edilebilecek mal ve hizmetler, Mevzuat uyarınca münhasıran SIPAY tarafından belirlenmektedir. SIPAY bu mecraları, mal ve/veya hizmetleri dilediği zamanda herhangi bir bildirim yükümlülüğü söz konusu olmaksızın değiştirebilecektir. Müşteri, bu kapsamda SIPAY’tan herhangi bir talep hakkı olmayacağını kabul eder.
  
  
  
  4.10        Müşteri, işbu Sözleşme kapsamında sunulan hizmetleri yasalara ve ahlaka aykırı amaçlarla, yasalara veya ahlaka aykırı ürün veya hizmetlerin temini amacıyla kullanmamayı kabul, beyan ve taahhüt eder. Müşteri’nin işbu madde başta olmak üzere işbu Sözleşme’ye aykırılığı halinde SIPAY aykırılık giderilene kadar Sözleşme ve Sözleşme kapsamında sağladığı hizmetleri askıya alabilecektir.
  
  
  
  Madde 5.         Hizmet Süreçleri
  
  
  
  5.1           Müşteri tarafından işbu Sözleşme kapsamında SIPAY kurumsal web sitesinde (“Sipay.com.tr”) belirtilen yöntemler ile SIPAY Hizmeti gerçekleştirilebilmektedir. Bahsi geçen yöntemlerin kapsam ve içeriği, bu yöntemlerle hizmet sunulmasına devam edilmesi, yeni yöntemler eklenmesi veya bazı yöntemlerin kullanılmamasına karar verilmesi münhasıran SIPAY takdirinde olacaktır.  Bu kapsamda Müşteri, Elektronik Para’ya ilişkin olarak aktivasyonunu yapmadığı bir hesaba/Elektronik Para Ürününe ilişkin SIPAY’a karşı kayıp, çalıntı veya 3. Kişilerce ele geçirilmesi vb. herhangi bir hak ve alacak iddiasında bulunmayacağını, SIPAY’ın bu hususta hiçbir sorumluluğu olmadığını kabul eder.
  
  
  
  5.2           Müşteri, SIPAY’ın işbu Sözleşme kapsamındaki hizmetlerinden SIPAY nezdinde oluşturacağı kullanıcı hesabı aracılığı ile veyahut SIPAY’tan ilgili süreçleri tamamlayarak edineceği bir ödeme aracı aracılığı ile faydalanabilecektir.
  
  
  
  5.3 If customer requests electronic money issuance, SIPAY will issue Electronic Money as much as the amount of funds transmitted through the credit card or bank account registered on behalf of the Customer, requested by the methods it envisages, including [mobile application], and will submit this amount to the Customer and will forward the receipt to the Customer, which will then submit this amount to the amount of funds received in exchange for the Electronic Currency he has issued. In accordance with Article 13.6 of the Agreement, the beneficiary of electronic money shall be considered as the Payment Account holder unless otherwise stated in writing by the Customer. Otherwise, customer's information to SIPAY and the completion of the necessary identification and/or information supply within the scope of customer recognition procedure may be requested by SIPAY. Electronic Money products that are not activated are lost, stolen or 3. The responsibility for the seizure by persons is entirely the responsibility of the person who owns the property, sipay has no responsibility for the loss or damage in this case. During the activation process, SIPAY may request information from the Customer regarding TCKN, Name, Last Name identification and may not complete the activation process if this information is not given. Electronic money cannot be monetized, refundable, replaced without activation. Although the expiration date of Electronic Money is not found, if no transactions are taken for 12 (twelve) months without interruption from the date of installation or within the period of use, the monthly service fee of 1.00.-TL (oneTurkLira) will be retrospectively charged at the relevant Electronic Currency amount. SIPAY may request and update additional fees in accordance with the Legislation for processes such as the translation, refund, etc. of Electronic Money to the fund by posting it on the corporate website ("Sipay.com.tr"). However, Customer will be able to request that electronic money be partially or completely converted into funds at any time through the petition or epara@3pay.com email address. SIPAY shall carry out transactions relating to the payment of all information, including the IBAN number, to SIPAY at this request of the Customer, and to the account IBAN, which is forwarded by the Customer within 15 working days after the legal obligations are fulfilled, and the payment of the funds forwarded by the Customer in exchange for Electronic Money, unless there is any otherwise entitlement or obligation in the legislation. If the Payment Account has a balance equal to or less than the payment cost, a receipt/invoice for the fund translation will be issued, but no transfer will be made to customer. For these refunds, the requirement that the IBAN information to be returned belongs to the account holder and the relevant checks can be made by calling the Customer phone number. Customer agrees that the cost of converting to a fund at a rate/amount of 100,00.-TL (hundredTurkishLira) will be deducted from the total price to be transmitted to him. If the amount requested by the Customer and/or the monthly balance and/or usage amount exceeds the numerical limits stipulated by applicable legislation, he acknowledges that he will have to make identification by going to the locations to be shown by SIPAY for the refund, otherwise there will be no refund. SIPAY has the right to short-term interruption of electronic money use until identification is complete. In the event of a return to the fund, if the Customer owes siPAY a debt, the price will be deducted from the Customer's Electronic Money and the remaining amount (if applicable) will be returned to the Customer. In cases where the Customer has transferred, returned the Payment Account/vehicle, and so on, it is obligatory to collect the electronic currency balance before the transaction and report the change to SIPAY.
  
  
  
  5.4 Payment will be deemed authorized by the Customer to be approved by the verification code that SIPAY will transmit to in the relevant field, etc. Customer will only be able to undo its approval for the periods specified in Article 5.5 below.
  
  
  
  5.5 The Customer agrees that the Payment Order will be accepted as soon as the Payment Order reaches SIPAY and will not be able to undo the Payment Order as of this time. If the Payment Order reaches SIPAY after 24:00 on any Business Day, the first Business Day following is deemed to have arrived. Customers
  
  
  
  5.5.1 Where the payment process is initiated by buyer or through the Buyer, you may not revoke the Payment Order unless the Buyer has otherwise agreed to have the Payment Order forwarded to SIPAY or after you have approved the payment process to be performed,
  
  
  
  5.5.2 Agrees that payment can be withdrawn by the end of the working day before the agreed day to make the payment process at the latest, if it is agreed to be made on a given day, at the end of a given period, or on the day customer leaves funds for payment to SIPAY.
  
  
  
  5.5.3 If customer withdraws the Payment Order as set out above, the SIPAY transaction will be charged as specified on the SIPAY corporate website ("Sipay.com.tr").
  
  
  
  5.6 SIPAY reserves the right to unilaterally modify and update the Agreement and its attachments. However, if such changes or changes to the practice within the scope of the obligations determined/determined by the legislation will cause a change in the terms of this Agreement, the Client shall be notified of the scope of the change 30 (thirty) days before the effect of the relevant amendment, the effective date and information about the Client's right to terminate the Agreement. In this case, the Customer will be able to terminate the Contract. If 30 (thirty) does not report termination within a daily period, the Customer will assume that the relevant change has been accepted. In this case, Customer agrees that sipay will not be entitled to any claim. If any changes required under the legislation are given less than 30 (thirty) days in the relevant legislation, this issue will be specified in the notification to be forwarded to the Customer and the period stipulated by the legislation will be applied instead of the period specified in this article.
  
  
  
  5.7 The Customer agrees and declares that information and documentation relating to any transactions carried out under this Agreement may be shared with the Representative by SIPAY for the purpose of performing the services under the Agreement. Customer's information may also be shared and/or anonymized with the relevant institutions and organizations in order to fulfill their legal obligations by SIPAY. The Customer shall immediately agree and commit to submit the information and documents requested by the Institution or other institutions and organizations within the scope of applicable regulations to SIPAY and/or the relevant institution.
  
  
  
  5.8 Except when the Customer first logged on, the change of the list of secure recipients defined by the Customer and the transaction list that can be made using single-component authentication is carried out using two-component authentication (these two components are "known" to the person as part of an authentication mechanism consisting of at least two components independent of each other, except as the customer logged on for the first time. is selected to belong to two different types of element classes that are "owned" or "have a biometric characteristic").
  
  
  
  In order to remain liabilities relating to Law No. 5.9 5549, two-component authentication is not required for transactions that must be carried out by two-component authentication if customer is approved by contract or by secure methods, or if the payment process is carried out with a recipient in the list of secure recipients. Approval to be received with an electronic agreement can only be made when signing in for the first time and provided that the Customer is clearly informed.
  
  
  
  5.10 Customer agrees that all of the businesses where Sipay is contracted are a secure buyer and can be processed with single-component authentication within the scope of the services.
  
  
  
  Madde 6.         Mali Hükümler İşbu Sözleşme kapsamında sağlanan hizmetler aracılığı ile temin edilen mal ve hizmetlere ilişkin ücretler ve bu ücretlerin tahsilatına ilişkin koşullar ilgili mal ve/veya hizmetin sağlayıcısı konumundaki Alıcı tarafından belirlenmekte olup Müşteri bu hususta SIPAY’ın herhangi bir yetki veya sorumluluğunun söz konusu olmadığını kabul eder. İşbu Sözleşme’ye konu ödemeler Türk Lirası cinsinden yapılacaktır.
  
  
  
  6.1           İşbu Sözleşme kapsamında aylık toplamda yapılan işlemlerin İşlem Limiti SIPAY tarafından belirlenecek olup, işbu İşlem Limitleri herhangi bir zamanda revize edilebilecektir. Ancak, İşlem Limitinin yükseltilmesinin Müşteri tarafından talep edilmesi halinde, SIPAY web adresi/linki (“http://www.Sipay.com.tr/epara”) üzerinden duyurduğu ücret karşılığında tek seferlik ve/veya aylık toplam işlemleri için belirlenen İşlem Limitini yükseltebilecektir.
  
  
  
  6.2           Müşteri, Alıcı’ya ödemekle yükümlü olduğu tutarları kısmen veya tamamen zamanında ödememesi nedeniyle Alıcı tarafından mevzuata uygun şekilde tahakkuk ettirilecek gecikme faizinin de SIPAY Hizmetleri aracılığı ile ödenebileceğini, Alıcı’nın bu yöndeki talimatına istinaden Müşteri’nin Ödeme Hesabı’nın ilgili tutar kadar borçlandırılabileceğini kabul eder. Faiz tutarı Alıcı tarafından belirlenecek olup Müşteri bu kapsamda SIPAY’tan herhangi bir talepte bulunamayacağını, faiz işletilmesi veya miktarı ile vb. konulara ilişkin taleplerini doğrudan Alıcı’ya yöneltmesi gerektiğiniz kabul eder. Madde 7. Kart Saklama Hizmeti
  
  
  
  7.1           Müşteri işbu Sözleşme kapsamında, gerçekleştireceği işlemler özelindeki onayı dahilinde ödeme işlemlerinin kolaylaştırılması amacı ile kullanılmak üzere kredi kartı bilgilerini SIPAY ile kendi rızası ile paylaşmaktadır. Paylaşılan bu bilgiler; kredi kartının ve banka kartının bağlı olduğu banka, kredi kartının ön yüzünde yer alan ad soyad, kart numarası, son kullanım tarihi ile sınırlıdır.
  
  
  
  7.2           Müşteri, işbu hizmet kapsamında sağlanan bilgilerin kendisine ait olduğunu, doğru ve gerçek olduğunu, söz konusu kredi kartı ile yapılan tüm işlemlerden tek başına sorumlu olduğunu, bu işlemlere ilişkin olarak her türlü hukuki ve cezai sorumluluğun kendisine ait olduğunu kabul ve taahhüt eder.
  
  
  
  7.3           Müşteri kart numarası, son kullanma tarihi ve güvenlik kodu bilgilerini sisteme girerek yapacağı ilk geçerli ödeme işlemi ile sisteme kayıt olur. Bu kapsamda; Müşteri kendi inisiyatifi doğrultusunda istediği adette kredi kartını sisteme ekleyebilir. Müşteri, tüm bu kredi kartları ve bunların kullanımı ile gerçekleştirilen işlemlere ilişkin olarak işbu Sözleşme’nin geçerli olduğunu kabul eder.
  
  
  
  7.4           Müşteri kredi kartı ile ödeme kanallarından birisinde işlem yapmak istediğinde, kendisine kayıtlı kredi kart(lar)ını ayırt edebileceği bilgiler (kart rumuzu, kartın son 4 hanesi vb) listelenerek, bu kart(lar)ı ile işlem yapmak isteyip istemediği sorulacak, isteyen Müşteri’nin vereceği işlem onayı ile birlikte SIPAY tarafından belirlenecek bir kimlik doğrulama sistemine Müşterilerin  vereceği onay ile sona erecektir. SIPAY ileride işlem akışında değişiklik yapabilir, Müşteri’nin güvenliği için ek önlemler (şifre vb.) getirebilir. Müşteri, bu sistem dahilinde belirleyeceği ve kullanacağı tüm şifrelerin güvenliğinden ve gizliliğinden tek başına sorumlu olduğunu, şifrelerini üçüncü kişilerle paylaşmamayı, sisteme tanımladığı kredi kartı ile yapılan tüm işlemlerden tek başına sorumlu olduğunu kabul ve taahhüt eder.
  
  
  
  7.5           Müşteri SIPAY’ın grup şirketleri ve iş ortaklarına ait kanallardan kaydettiği kartını kaybetmesi veya çaldırması durumunda bankası ile iletişime geçmek ve çalınan kartın kapatılmasını sağlamaktan kendisi sorumludur.
  
  
  
  7.6           İşbu hizmet SIPAY tarafından ücretsiz olarak sunulabileceği gibi, zaman zaman çeşitli kampanyalara konu edilebilecek veya Müşteri’yi bilgilendirmek suretiyle ücrete tabi bir şekilde sunulabilecektir. Müşteri, hizmeti kullandığı müddetçe SIPAY’ın ücretlendirme politikası ile bağlı olduğunu kabul eder. Ücretlendirme politikası ve hizmet için ödenecek ücretlerde değişiklik olması halinde Müşteri bu değişikliklerden 7 (yedi) gün önce haberdar edilecektir.
  
  
  
  Madde 8.         Tazminat: Müşteri’nin işbu Sözleşme ile yürürlükte bulunan düzenlemelere aykırı hareket etmesi nedeniyle SIPAY’ın mahkum edileceği ve/veya maruz kalacağı her türlü ceza, masraf ve tazminat vb. mali yükümlülükleri (her türlü doğrudan ve dolaylı zararlar, Alıcı ve/veya Alıcı’nın Ödeme Hizmeti Sağlayıcı’nın talepleri ve Kurum tarafından uygulanabilecek yaptırımlar dahil) hiçbir hüküm istihsaline gerek kalmadan ve SIPAY’ın ilk yazılı talebini takip eden 7 (yedi) gün içinde karşılayacağını kabul, beyan ve taahhüt eder.
  
  
  
  Madde 9.         Sözleşme’nin Süresi ve Feshi
  
  
  
  9.1  Sözleşme, onay tarihinde yürürlüğe girecek olup Sözleşme’de belirtilen şekilde feshedilmediği sürece yürürlükte kalacaktır. SIPAY, herhangi bir zamanda 2 (iki) ay öncesinde yapacağı yazılı bildirimle Sözleşme’yi herhangi bir tazminat ödemeksizin feshedebilecektir. Müşteri ise, Sözleşme’yi herhangi bir nedene dayanmaksızın feshetmek istediği takdirde bu durumu 1 (bir) ay öncesinden SIPAY’a bildirecektir.
  
  
  
  9.2           Taraflar’dan birinin sözleşmesel yükümlülüklerini ihlal etmesi ve ihlalin düzeltilmesine ilişkin olarak karşı Tarafça iletilen talebe rağmen ilgili ihlalin 7 (yedi) iş günü içerisinde düzeltilmemesi halinde, Sözleşme ihtarı gönderen Tarafça yazılı olarak iletilecek bir ihbarla derhal tazminat ödemeksizin feshedebilir. İhlalin Müşteri’den kaynaklı olması durumunda SIPAY bu süre içerisinde aykırılığın giderilmemesi halinde kendi tercihine göre geçici olarak Sözleşme’yi askıya alma hakkını da kullanabilecektir.
  
  
  
  9.3           Müşteri’nin işbu Sözleşme kapsamında sunulan hizmetleri yasalara ve ahlaka aykırı amaçlarla, yasalara veya ahlaka aykırı ürün veya hizmetlerin temini amacıyla kullandığının tespit edilmesi halinde işbu Sözleşme SIPAY tarafından herhangi bir ihbar süresi verilmeksizin derhal feshedilebilecektir.
  
  
  
  9.4           SIPAY’ın Kanun kapsamında Kurum’dan temin ettiği iznin iptali veya sona ermesi halinde işbu Sözleşme SIPAY’ın yapacağı bildirime istinaden SIPAY tarafında herhangi bir tazminat yükümlülüğüne neden olmaksızın feshedilecektir.
  
  
  
  9.5           Sözleşme kapsamında hileli veya yetkisiz kullanım şüphesinin ve benzeri durumların söz konusu olduğu hallerde SIPAY Müşteri’ye sunduğu hizmetleri askıya alabilecek, Ödeme Aracı’nı kullanıma kapatabilecektir. Bu durumda SIPAY (Mevzuat’ta bilgi verilmesini engelleyici düzenlemeler bulunması veya güvenliği tehdit edici objektif nedenlerin varlığı dışında) Müşteri’yi bilgilendirecek ve askıya alınma sebebi ortadan kalktığında hizmetleri ve Ödeme Aracı’nı yeniden Müşteri kullanımına sunacaktır.
  
  
  
  9.6           Sözleşme, ayrıca Müşteri’nin ödeme aracının süreli veya süresiz olarak kullanıma kapatılması halinde de askıya alınacaktır. Ödeme aracının kapanması Madde 5.2’ye aykırılık teşkil edecek ve işbu Sözleşme’nin SIPAY tarafından Madde 9.2’de belirtilen yöntemle feshi söz konusu olabilecektir. Müşteri’nin Sözleşme kapsamındaki hizmetleri kullanımından doğan tutarları son ödeme gününde ödememesi halinde ve SIPAY için risk oluşturan benzeri hallerde SIPAY Müşteri’ye sunduğu hizmetleri askıya alabilecek, Ödeme Aracı’nı kullanıma kapatabilecektir. Bu durumda SIPAY Müşteri’yi bilgilendirecek ve askıya alınma sebebi ortadan kalktığında hizmetleri ve Ödeme Aracı’nı yeniden Müşteri kullanımına sunacaktır. Madde 10.       Feshin Sonuçları
  
  
  
  10.1         Sözleşmenin feshi veya herhangi bir nedenle sona ermesi, Taraflar’ın fesih tarihinden önceki yükümlülüklerini ortadan kaldırmaz.
  
  
  
  10.2        Taraflar’ın işbu Sözleşme’de yer alan gizlilik ve bilgi güvenliğine ilişkin yükümlülükleri Sözleşme’nin sona ermesi veya feshinden sonra da devam edecektir.
  
  
  
  Madde 11.        Gizlilik ve Bilgi Güvenliği
  
  
  
  11.1 Kişisel veriler, doğrudan Müşterilerden veya Sipay’ın iş ortakları aracılığıyla elektronik ortamda toplanmaktadır. Müşteri, işbu Sözleşme kapsamında kendisi ile ilgili olarak temin edilen kişisel bilgilerin ve bu bilgilerin kullanımı ile gerçekleşen işlemler ile ilintili olarak, SIPAY başta olmak üzere grup şirketleri veya satın alınmak istenen ürün veya hizmeti sağlayan/sunan veya ödeme işleminin yapılabilmesini sağlayan iş ortakları uhdesinde üreyen tüm bilgilerin, işbu Sözleşme yürürlük süresi boyunca kaydedilmesine, SIPAY grup şirketleri ve/veya satın alınmak istenen ürün veya hizmeti sağlayan/sunan iş ortakları ile Sözleşme kapsamındaki hizmetlerin ve ilgili ödemelerin gerçekleştirilmesini ve Müşteri’ye kampanya sunulmasını temin amacıyla paylaşılmasına ve yine aynı amaçlarla bu taraflarca işlenmesine izin vermektedir. Müşteri; SIPAY Hizmetleri’nin sunulması, risk tespiti/düzeyinin belirlenmesi, hizmet kalitesi, ilgili mevzuatlardaki yükümlülüğünün tam ve eksiksiz yerine getirilmesi amacı ile Sözleşme süresince Müşteri’nin telefon numarası, TCKN, ad, soyad vb kimlik bilgileri, adres, iletişim bilgisi ve bu bilgilerin güncelliği, konum bilgisi, limit bilgisi, risk vb. bilgileri başta olmak üzere ödemeye ilişkin talimatlar, aylık harcama limiti ve bu limiti ulaşılması, bakiye yetersizliği sebebiyle başarısız işlem olup olmadığı, başarısız işlem sayısı hakkındaki bilgilerinin; SIPAY ve grup şirketleri (Sipay AG & Sipay Bank AG) tarafından işlenmesine, ayrıca anılan süreler ve amaçlar dahilinde bu maddede sayılan bilgilerin Müşteri’nin mal ve hizmet sağladığı Üye İş Yeri / SIPAY Hizmeti Kullanıcısı/İş Ortakları/Ödeme Hizmet Sağlayıcıları/Temsilcileri/ Dış Hizmet Sağlayıcıları/ ilgili Finansal Kuruluşlar/ Banka ile karşılıklı olarak paylaşılmasına ve yine aynı amaçlarla bu taraflarca işlenmesine izin vermektedir. Bahsi geçen bilgiler, mevzuattaki düzenlemeler saklı kalmak üzere; Sözleşme ve mevzuat yükümlülükleri süresince saklanacak ve bu süre sonunda silinecektir. Sözleşme süresine ek olarak, SIPAY, işbu Sözleşme’den doğabilecek herhangi bir uyuşmazlık durumunda, uyuşmazlık kapsamında gerekli savunmaların gerçekleştirilebilmesi amacıyla sınırlı olmak üzere ve ilgili mevzuat uyarınca belirlenen zamanaşımı süreleri boyunca kişisel verileri saklayabilecektir.
  
  
  
  11.2     Müşteri, Kişisel Verilerin Korunması Kanunu’nun 11. maddesinin yürürlüğe girmesi ve işbu Sözleşme kapsamında uygulanmasının gerekmesi ile birlikte SIPAY’a başvurarak kendisiyle ilgili; Kişisel veri işlenip işlenmediğini öğrenme, kişisel verileri işlenmişse buna ilişkin bilgi talep etme, kişisel verilerin işlenme amacını ve bunların amacına uygun kullanılıp kullanılmadığını öğrenme, yurt içinde veya yurt dışında kişisel verilerin aktarıldığı üçüncü kişileri bilme, kişisel verilerin eksik veya yanlış işlenmiş olması halinde bunların düzeltilmesini isteme, ilgili mevzuatta öngörülen şartlar çerçevesinde kişisel verilerin silinmesini veya yok edilmesini isteme, ilgili mevzuat uyarınca yapılan düzeltme, silme ve yok edilme işlemlerinin, kişisel verilerin aktarıldığı üçüncü kişilere bildirilmesini isteme, işlenen verilerin münhasıran otomatik sistemler vasıtasıyla analiz edilmesi suretiyle kişinin kendisi aleyhine bir sonucun ortaya çıkmasına itiraz etme, kişisel verilerin kanuna aykırı olarak işlenmesi sebebiyle zarara uğraması halinde zararın giderilmesini talep etme haklarına sahiptir. Söz konusu haklar, yukarıda belirtilen kanalların yanı sıra [destek@3pay.com] adresine yazılı talep iletilerek kullanılabilecektir.
  
  
  
  11.3     SIPAY, yukarıda yer alan talepler uyarınca, gerekçeli olumlu/olumsuz yanıtını, yazılı veya dijital ortamdan gerçekleştirebilir. Taleplere ilişkin gerekli işlemler için ücret alınmaması esastır. Bununla birlikte, işlemlerin bir maliyet gerektirmesi halinde, Kişisel Verilerin Korunması Kurulu tarafından, Kişisel Verilerin Korunması Kanunu’nun 13. maddesine göre belirlenen tarife üzerinden ücret talep edilmesi mümkündür.
  
  
  
  11.4 Müşteri, veri işleme iznini her zaman Çağrı Merkezi vb. SIPAY Grup Şirketlerince yönetilen kanallar aracılığıyla iptal edebilir. Veri işleme izninin iptali, bu Sözleşme uyarınca paylaştığı ve Sözleşme kapsamındaki SIPAY Hizmeti’nin sunulması ve/veya SIPAY ve ilgili SIPAY grup şirketlerinin yasal yükümlülüklerinin ifası için işlenmesi zorunlu olan bilgilerin işlenmesi gibi Kişisel Verilerin Korunması Kanunu’nun saydığı istisnai durumların varlığında işlenmesi ve yine bu amaçlarla paylaşılmasına engel teşkil etmez ancak Müşteri veri işleme iznini iptal etmesi durumunda SIPAY’ın Sözleşme konusu hizmetleri tam ve gereği gibi sunamayabileceğini kabul eder.
  
  
  
  11.5 Müşteri SIPAY Grup Şirketlerine ve iş ortaklarına ait kanallardan kaydettiği kartını kaybetmesi veya çaldırması durumunda bankası ile iletişime geçmek ve çalınan kartın kapatılmasını sağlamaktan kendisi sorumludur.
  
  
  
  11.6 SIPAY, ilgili mevzuatta belirlenen veya işbu Sözleşme’de ifade edilen şartlarda, işbu Sözleşme kapsamında kendisine elektronik ortamda iletilen, kişisel verilerin hukuka aykırı olarak işlenmesini, kişisel verilere hukuka aykırı olarak erişilmesini, ve kişisel verilerin muhafazasını sağlamak amacıyla uygun güvenlik düzeyini temin etmeye yönelik gerekli her türlü teknik ve idari tedbirleri almayı, gerekli denetimleri yaptırmayı taahhüt eder.
  
  
  
  11.7     Yukarıdaki hususlara ek olarak, Taraflar’dan her biri işbu Sözleşme kapsamında bir diğerine ilişkin olarak edindiği bilgileri devamlı olarak gizli tutacağını ve saklayacağını kabul eder. SIPAY, Sözleşme kapsamında sunduğu hizmetlere ilişkin Mevzuat’ta öngörülen bilgi güvenliği yükümlülüklerine uyacağını, Sözleşme kapsamındaki bilgilerin Sözleşme’de açıkça düzenlenen haller dışında yetkili herhangi bir resmi kurum, merci veya makam tarafından talep edilmedikçe hiçbir şekilde 3. kişilerle paylaşılmayacağını kabul ve beyan eder. Ancak SIPAY, Müşteri’nin Mobil Ödeme Servisi ve Elektronik Para kullandırılması da dahil tüm SIPAY Hizmetleri üzerinden gerçekleştirdiği işlemlere ilişkin bilgileri şikayet sonucu ya da şüpheli işlem durumlarında veya işlemin detaylı incelenmesini gerektiren diğer hallerde mal veya hizmetlerin temin edildiği sağlayıcı ya da fonun aktarıldığı kişi veya ilgili işlem kapsamında hizmetlerinden faydalanılmış bulunan Temsilci ve/veya Ödeme Hizmeti Sağlayıcısı ile paylaşabilir.
  
  
  
  11.8 Müşteri, SIPAY’ın başta Temsilci vasıtasıyla gerçekleşen işlemlerde SIPAY Hizmetleri’nin sunulabilmesi ve ilgili mevzuattan kaynaklanan yükümlülüklerini yerine getirebilmesi için gerekli TCKN, adres, imza beyanı, yetki belgesi, imza sirküleri, pasaport/kimlik fotokopisi ve sair kişisel verilerinin SIPAY temsilcisi tarafından Sözleşme süresince SIPAY’a aktarılmasına ve yukarıda belirtilen amaçlarla SIPAY tarafından işlenmesine muvafakat eder.
  
  
  
  11.9 Eksik bilgiye mahal vermemek adına, Sipay tarafından Müşterilerin’ın kişisel verilerin işlenmesine ilişkin detaylı bilgilere https://www.Sipay.com.tr/gizlilik-politikasi adresinde yer alanSipay Gizlilik Politikası Ve Kişisel Verilerin İşlenmesine İlişkinAydınlatma Ve Rıza Metni’nden ulaşılabilecektir.
  
  
  
  Madde 12.        Uyuşmazlıkların Çözümü: Taraflar, ihtilaf halinde İstanbul (Çağlayan) Mahkemeleri ve İcra Müdürlüklerinin yetkili olduğunu beyan, kabul ve taahhüt ederler. Tüketiciler Hakkında: Tüketiciler, ihtilaf halinde yetkili tüketici hakem heyetleri ve tüketici mahkemelerine başvurma hakkında sahiptir.
  
  
  
  Madde 13.       Genel Hükümler:
  
  
  
  13.1 Devir: Müşteri, SIPAY’ın ön yazılı onayı olmadan doğrudan veya dolaylı olarak tamamen veya kısmen Sözleşme’yi ve Sözleşme konusu hak ve yükümlülüklerini başkalarına devir ve temlik edemez. SIPAY, her zaman için Sözleşme’den doğan hak, yükümlülük, alacak ve sorumluluklarını üçüncü şahıslara devir ve temlik edebilir, alt yüklenici veya Sözleşme’de belirtilen dışında Temsilci kullanabilir.
  
  
  
  13.2 Bildirimler: SIPAY, işbu Sözleşme kapsamında Müşteri’ye yapacağı bildirimleri Sözleşme’de belirtilen zamanlarda Müşteri’nin kendisine bildirdiği e-posta veya posta adresine yapacağı gönderim ile Müşteri’nin cep telefonuna SMS göndererek veya Çağrı Merkezi aracılığı ile Müşteri’yi arayarak iletecektir. Müşteri, Sözleşme kapsamındaki bilgilendirmelere ek bilgilendirme talebinde bulunduğu takdirde, bu talep SIPAY tarafından kabul edildiği takdirde ücreti mukabilinde yerine getirilebilecektir. Müşteri, dilediği zamanda işbu Sözleşme’nin bir örneğine SIPAY kurumsal web sitesinden (“[Sipay.com.tr]”) ulaşabilecektir.
  
  
  
  13.3 Sözleşme’nin Bütünlüğü: Sözleşme’deki bir hükmün geçersizliği Sözleşme’nin amacını tamamıyla bozmadığı veya Taraflar’dan birinin menfaatini önemli ölçüde zedelemediği takdirde, böyle bir hüküm yokmuş gibi, Sözleşme’nin diğer hükümleri geçerli sayılacaktır.
  
  
  
  13.4 Fikri Mülkiyet: Sözleşme ile Taraflar arasında herhangi bir fikri mülkiyet hakkı devri veya lisans gibi kullandırma anlaşması kurulmamaktadır. Taraflar’ın her birine ait ve/veya kullanımında olan her nevi fikri mülkiyet hakkı konusu unsuru kullanmaları ancak bu kapsamda açık bir yazılı anlaşma bulunması halinde mümkün ve bununla sınırlıdır.
  
  
  
  13.5 Force Majeure: Human ities and natural disasters, war, mobilization, fire, strike, lockout, sipay license that does not exist at the time of the signing of the Agreement, who are unforeseen and unpredictable outside the control of the Parties, are considered force majeure. The Force Subject to force majeure immediately informs the other Party in writing and the parties' operations will be suspended for the duration of the force majeure. When force majeure disappears, the Contract picks up where it left off. The obligations of the Party, whose rights are not exercised during the force majeure period, will also be suspended. If the force majeure lasts more than 90 (ninety) days, the Party whose rights have been violated may terminate the Contract without compensation.
  
  
  
  13.6 COMPLIANCE: The customer will report his/her account in writing to SIPAY in accordance with Law No. 5549 if he acts on his behalf and on his own account, and will submit the Payment Account in writing to The 3rd Amendment. He agrees that if the information subject to identity, communication and other identification changes with the transfer to a person, he will report this situation to SIPAY in writing and that sipay may be requested to provide identification/information in accordance with customer's notice under this article. Otherwise, customer, sipay's unauthorized, incorrect transactions with the Customer, 3. He acknowledges and declares that there will be no legal /criminal liability, including unjust, unlawful use of persons, fraud, etc. and that he has the right to unilaterally terminate this Agreement.
  
  
  
  13.7 DISAPPLICATION: The provisions of this Agreement regarding consumers shall not apply to the Customer, even if the Customer has approved the Agreement, in the cases where the Customer purchases the services under this Agreement for professional and commercial purposes.
  
  '''
  
  ,
  
  style: TextStyle(
  
  
  
    fontSize: 18,
  
 // fontWeight: FontWeight.bold,
  
    
  
    color: Colors.black
  
    
  
    
  
  
  
  ),
  
  
  
  
  
  
  
  ),
  
  
  
  ),
)
    );
  }
}