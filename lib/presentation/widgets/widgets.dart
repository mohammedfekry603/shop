import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/presentation/screens/WebviewScreen.dart';

Widget buildArticleItem(articale,context) => InkWell(
  onTap: () {NavigatTO(context,WebViewScreen(url: articale['url'],));
    
  },
  child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                articale['urlToImage'] ?? 'https://via.placeholder.com/120',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.broken_image, size: 120);
                },
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articale['title'] ?? 'No title available',
                      style: Theme.of(context).textTheme.bodyMedium
                     , maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),SizedBox(height: 7,),
                    Text(
                      articale["publishedAt"] ?? 'Unknown date',
                      style: TextStyle(color: Colors.grey,fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
);
Widget buildArticleList(list,context)=>ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildArticleItem(list[index],context),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8),
            child: Divider(thickness: 2),
          ),
          itemCount: list.length, 
        );

Widget customTextFormField({
  required TextEditingController controller,
  required String hint,
  TextInputType? keyboardType,
 required IconData prefixIcon,
 Function(String)? onChanged,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style:TextStyle(color: Theme.of(context).textTheme.bodySmall?.color),
      decoration: InputDecoration(filled:true,fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        hintText: hint,
        hintStyle: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,  
        prefixIconColor:Theme.of(context).textTheme.bodySmall?.color ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    ),
  );
}

void NavigatTO( context, Widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
  );
}


ThemeData lightTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.black),
      color: Colors.white,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: HexColor('333739'),
    ),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: HexColor('333739'),
      actionsIconTheme: const IconThemeData(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
    ),
    scaffoldBackgroundColor: HexColor('333739'),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('333739'),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
