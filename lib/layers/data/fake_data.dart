import 'package:government_project/layers/data/model/decision.dart';
import 'package:government_project/layers/data/model/events.dart';
import 'package:government_project/layers/data/model/news.dart';
import 'package:government_project/layers/data/model/service.dart';
import 'package:government_project/layers/view/decisions/decision_screen.dart';

class FakeData {
  static List<String> eventsCategories = [
    "الكل",
    "ترفيهي",
    "تجاري",
  ];

  static List<String> servicesCategories = [
    "الكل",
    "عقاري",
    "تجاري",
  ];

  static List<News> news = [
    News(
        mainImage:
            "https://imageio.forbes.com/specials-images/imageserve/61087d7b46c544dc3d1910e1/People-Need-Continued-Recovery-For-Real-Financial-Security/960x0.jpg?format=jpg&width=960",
        subImages: [
          "https://s44650.pcdn.co/wp-content/uploads/2023/03/gdp-growth-region-2022-1654625402.jpg",
          "https://upload.wikimedia.org/wikipedia/commons/8/8d/Cairo_International_Book_Fair_%282019%29-01.jpg",
          "https://assafirarabi.com/wp-content/uploads/2019/02/%D9%85%D8%B9%D8%B1%D8%B6-%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9.jpg"
        ],
        title: "رفع سوية الاقتصاد وفرص العمل في المنطقة",
        desc:
            "تعزيز التنمية الاقتصادية: نجح مجلس البلدية في جذب الاستثمارات وتشجيع إقامة المشاريع الصناعية والتجارية في المدينة. تم توفير فرص عمل جديدة وتعزيز النشاط الاقتصادي المحلي. كما تم تنفيذ سياسات داعمة لريادة الأعمال وتشجيع الابتكار وتطوير الصناعات المحلية، مما أدى إلى زيادة الاستدامة الاقتصادية وتحسين مستوى المعيشة للسكان.",
        date: "3/آب/2024"),
    News(
        mainImage:
            "https://thearchitectsdiary.com/wp-content/uploads/2021/10/Do-you-need-an-architect-or-builder-for-your-new-custom-home.jpg",
        subImages: [
          "https://media.vanityfair.com/photos/56fda2cdd92b97f810ed1672/master/w_1600%2Cc_limit/zaha-hadid-obituary-02.jpg",
          "https://www.civitatis.com/blog/wp-content/uploads/2021/12/puente-huangpu-china.jpg",
          "https://leonard.vinci.com/wp-content/uploads/2020/10/tunnel-tech.jpg",
        ],
        title: "إصلاحات شاملة للبنية التحتية",
        desc:
            "تحسين البنية التحتية: نجح مجلس البلدية في تحسين البنية التحتية للمدينة، حيث تم إعادة بناء وتجديد الطرق والجسور الرئيسية، وتحسين شبكة الصرف الصحي والتصرف في المياه. كما تم توسيع شبكة الكهرباء وتقديم خدمات الاتصالات عالية الجودة، مما ساهم في تعزيز التنمية العمرانية وجذب الاستثمارات.",
        date: "30/حزيران/2024"),
    News(
        mainImage:
            "https://cdn.britannica.com/30/128430-050-D6578398/Boston-Public-Garden.jpg",
        subImages: [
          "https://ourmanorpark.org.uk/wp-content/uploads/2022/08/park_opening-16.jpg",
          "https://agendabrussels2.imgix.net/2efda25e4a040036f340dede2e31dbd203802448.jpg",
          "https://metropolregion.hamburg.de/resource/image/11880/landscape_ratio3x2/565/377/63148ff8fdeb026bb674cd77ece4465b/8B5C8227D98F3412D6951D7B2A38C67D/14-rencks-park-neumuenster-079.jpg",
        ],
        title: "تنفيذ حدائق ومواقف ترفيهية في كامل المنطقة",
        desc:
            "تعزيز الحياة الثقافية والترفيهية: عمل مجلس البلدية على تعزيز الحياة الثقافية والترفيهية في المدينة من خلال إقامة فعاليات ثقافية وفنية ورياضية متنوعة. تم توفير مرافق ترفيهية مثل الحدائق والمتنزهات والملاعب، وتنظيم فعاليات ثقافية مثل المهرجانات والمعارض الفنية. هذا ساهم في تعزيز الروح المجتمعية، وتعزيز التفاعل الثقافي، وتوفير بيئة حيوية ومليئة بالنشاطات للسكان والزوار.",
        date: "32/نيسان/2024"),
  ];

  static List<Decision> decision = [
    Decision(
        mainImage:
            "https://s44650.pcdn.co/wp-content/uploads/2023/03/gdp-growth-region-2022-1654625402.jpg",
        title: "رفع سوية الاقتصاد وفرص العمل في المنطقة",
        desc:
            "تعزيز التنمية الاقتصادية: نجح مجلس البلدية في جذب الاستثمارات وتشجيع إقامة المشاريع الصناعية والتجارية في المدينة. تم توفير فرص عمل جديدة وتعزيز النشاط الاقتصادي المحلي. كما تم تنفيذ سياسات داعمة لريادة الأعمال وتشجيع الابتكار وتطوير الصناعات المحلية، مما أدى إلى زيادة الاستدامة الاقتصادية وتحسين مستوى المعيشة للسكان.",
        date: "3/آب/2024"),
    Decision(
        mainImage:
            "https://unitedco.com.au/wp-content/uploads/united-co-shared-office-space-melbourne-scaled.jpg",
        title: "تم توليد هذا النص من مولد النص العربى",
        desc:
            "إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.",
        date: "30/حزيران/2024"),
    Decision(
        mainImage:
            "https://s44650.pcdn.co/wp-content/uploads/2023/03/gdp-growth-region-2022-1654625402.jpg",
        title: "لأنه مازال نصاً بديلاً ومؤقتاً.",
        desc:
            "هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم.",
        date: "32/نيسان/2024"),
  ];

  static List<Event> events = [
    Event(
        mainImage:
            "https://images.coasterpedia.net/thumb/1/1a/AmusementPark.jpg/800px-AmusementPark.jpg",
        title: "رفع سوية الاقتصاد وفرص العمل في المنطقة",
        desc:
            "تعزيز التنمية الاقتصادية: نجح مجلس البلدية في جذب الاستثمارات وتشجيع إقامة المشاريع الصناعية والتجارية في المدينة. تم توفير فرص عمل جديدة وتعزيز النشاط الاقتصادي المحلي. كما تم تنفيذ سياسات داعمة لريادة الأعمال وتشجيع الابتكار وتطوير الصناعات المحلية، مما أدى إلى زيادة الاستدامة الاقتصادية وتحسين مستوى المعيشة للسكان.",
        date: "3/آب/2024",
        category: eventsCategories[1]),
    Event(
        mainImage:
            "https://www.annajah.net/article-images/%D9%85%D8%B9%D8%B1%D8%B6-%D8%A3%D8%A8%D9%88-%D8%B8%D8%A8%D9%8A-%D8%A7%D9%84%D8%AF%D9%88%D9%84%D9%8A-%D9%84%D9%84%D9%83%D8%AA%D8%A7%D8%A8.jpg_70cfbea49e58596_large.jpg",
        title: "تم توليد هذا النص من مولد النص العربى",
        desc:
            "إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.",
        date: "30/حزيران/2024",
        category: eventsCategories[2]),
    Event(
        mainImage:
            "https://aguacalientecasinos.com/wp-content/uploads/2021/09/Main-Entertainment-Hero-scaled.jpg",
        title: "لأنه مازال نصاً بديلاً ومؤقتاً.",
        desc:
            "هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم.",
        date: "32/نيسان/2024",
        category: eventsCategories[1]),
  ];

  static List<Service> services = [
    Service(
        mainImage:
            "https://contactcars.fra1.cdn.digitaloceanspaces.com/contactcars-production/Images/Small/News/8a4bcdd2-19c2-4b5a-b844-4533dcd374fb.jpg",
        required_papers: [
          "صورة شخصية",
          "صورة هوية",
          "لاحكم عليه",
          "شهادة حرفية",
        ],
        category: "عقاري"),
    Service(
        mainImage:
            "https://contactcars.fra1.cdn.digitaloceanspaces.com/contactcars-production/Images/Small/News/8a4bcdd2-19c2-4b5a-b844-4533dcd374fb.jpg",
        required_papers: [
          "صورة شخصية",
          "صورة هوية",
          "لاحكم عليه",
          "شهادة حرفية",
        ],
        category: "تجاري"),
  ];
}
