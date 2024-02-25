import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';


class NameModel {
  final String title;
  final String body;
  final PDFView? sfPdfViewer;

  NameModel({
    this.sfPdfViewer,
    required this.title,
    required this.body,
  });
}

class LocalData {
  List<NameModel> nameList = [
    NameModel(
      title: 'من وين اجيب جدولي ؟',
      body:
          'من البوابة الإلكترونية للطالب من القائمة -> اكاديمي -> جدول الطالب, أو بتقدر تطبعه من القبول والتسجيل',
    ),
    NameModel(
      title: 'شو الإجراءات للتسجيل ؟',
      body:
          'بتختار التخصص الي بدك اياه وبتروح عالقبول والتسجيل ومن هناك بتمشي بالإجراءات',
    ),
    NameModel(
      title: 'شو طرق الدفع للرسوم الدراسية؟',
      body:
          'في طريقتين الاولى من خلال مبنى القبول والتسجيل, الثانية عن طريق البنك الإسلامي',
    ),
    NameModel(
      title: 'كم رسوم التسجيل الفصلية؟',
      body: 'الفصل الدراسي الاول والثاني 250 دينار, الفصل الدراسي الصيفي 180',
    ),
    NameModel(
      title: 'من وين اجيب الكتب الدراسية المطلوبة للمواد؟',
      body:
          'بالعادة الدكتور ببعث المادة بي دي اف، أو بتقدر تجيب كتاب المادة من البوك شوب؛ مكانه بجانب كلية تكنلوجيا المعلومات.',
    ),
    NameModel(
      title: 'كيف بقدر اوصل للمرافق الرياضية بالجامعة؟',
      body: 'مبنى الآداب -> الطابق الثالث',
    ),
    NameModel(
      title: 'بقدر انزل جدول اون لاين؟',
      body:
          'نعم بتقدر, من البوابة الإلكترونية من القائمة -> التسجيل -> التسجيل الإلكتروني',
    ),
    NameModel(
      title: 'هل في مبادات بالجامعة؟ وكيف اشارك فيها؟',
      body: 'في مبادرات من مجلس شؤون الطلبة وغيرها وبنزلوها على موقع الجامعة',
    ),
    NameModel(
      title: 'هل هناك دورات بالجامعة ؟',
      body: '',
    ),
    NameModel(
      title: 'بقدر انقل من تخصص لتخصص ؟',
      body: 'نعم بتقدر, راجع القبول والتسجيل',
    ),
    NameModel(
      title: 'وين اماكن الباصات ؟',
      body: '',
      sfPdfViewer: const PDFView(filePath: 'assets/PDF/Calender.pdf',enableSwipe: true,),
    ),
    NameModel(
      title: 'نصائح عامة للطلاب الجدد',
      body:
          'المعدل: اهتم بإنك تجيب معدل عالي بأول فصل خصوصاً؛ لأنه إذا جبت معدل عالي بأول فصل فا بيكون صعب إنه ينزَل لقدام، وإذا جبت معدل منخفض فا صعب إنك ترفعه لقدام.\n\n الدورات: كُلّما زادت مهاراتك زاد احتياج سوق العمل إليك و زاد استغنائك عن سوق العمل، وكُلّما نقصت مهاراتك زاد احتياجك لسوق العمل و زاد استغناء سوق العمل عنك. والمهارات بتوخذها من الدورات، فا اهتم بإنك توخذ دورات بجانب دراستك للجامعة لأنها مهمة جداً لسيرتك الذاتية بسوق العمل، وبلّش توخذ دورات من أول فصل عادي، لا تأجل لحد ما تتخرج زي كثير طلاب راسهم مربع \n\n المواد: لا تنزل كل المواد الإختيارية أو مواد غير التخصص بفصل واحد، ممكن تنزل كل فصل مادة وحدة وإذا كان معدلك منخفض وبدك ترفعه فا ممكن تنزل مادتين، بس الأصل إنو لو كل فصل مادة بيكون ممتاز، عشان لقدام يكون معك مجال انك تنزلهم وما يكون كل جدولك مواد تخصص. ',
    ),
    NameModel(
      title: 'شو الخدمات الصحية المقدمة للطالب وكيف بقدر اوصللها ؟',
      body:
          'يوجد تأمين صحي للطالب، ويوجد عيادة للجامعة بجانب مبنى القبول والتسجيل',
    ),
    NameModel(
      title: 'فاتني امتحان ايش اعمل ؟',
      body:
          'راجع دكتور المادة ولازم يكون معك عذر مقبول عشان تعيد الإمتحان تكميلي والأفضل ما تغيب عن الامتحانات لأنه عادة الامتحان التكميلي بيكون أصعب، وامتحان الفاينل لما بدك تعيده بتعيده الفصل القادم فا دير بالك من هاي النقطة.',
    ),
    NameModel(
      title: 'كيف تحسب تقديرات المعدل الجامعي ؟',
      body:
          ' اقل من 50 راسب, 50 الى 60 ضعيف, 60 الى 68 مقبول, 68 الى76 جيد, 76 الى 84 جيد جداً, 84 الى 100 امتياز',
    ),
  ];
}
