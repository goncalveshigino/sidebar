import 'package:flutter/material.dart';

final Color  backgroundColor = Color(0xFF4A4A58); 

class MenuDashboardPage  extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>  with SingleTickerProviderStateMixin{


bool isCollapsed = true;
double screenWidth, screenHeight;
 final duraction = const Duration(milliseconds: 500);

 AnimationController _controller;
 Animation<double> _scaleAnimation;
Animation<double> _menuScaleAnimation;
 Animation<Offset> _slidenAnimation;


@override
void initState() { 
  super.initState();
  _controller = AnimationController(vsync: this, duration: duraction);
  _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
  _menuScaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(_controller);
  _slidenAnimation = Tween<Offset>(begin: Offset(-1,0), end: Offset(0,0)).animate(_controller);
}

@override
void dispose() { 
  _controller.dispose();
  super.dispose();
}



  @override
  Widget build(BuildContext context) { 
    
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
         
          menu(context),
          dashboard(context)
        ],
      ),
    );
  } 

  Widget menu(context) {
    return SlideTransition(
      position: _slidenAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12 ,),
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Icon(
                         Icons.person, 
                         color: Colors.white, 
                         size: 50,
                       ), 
                       Text('Gonçalves Higino', style: TextStyle(color: Colors.white, fontSize: 20),), 
                      Text('goncalveshigino20@gmail.com', style: TextStyle(color: Colors.white54),)
                      ],
                    ),
                  ), 
                  Divider(),
                  SizedBox(height: 13,),
                   Text(
                    'dadadadad', 
                    style: TextStyle(color: Colors.white, fontSize: 20)
                  ), 
                     SizedBox(height: 13,),
                   Text(
                    'dadadadad', 
                    style: TextStyle(color: Colors.white, fontSize: 20)
                  ), 
                     SizedBox(height: 13,),
                   Text(
                    'dadadadad', 
                    style: TextStyle(color: Colors.white, fontSize: 20)
                  ), 
                     SizedBox(height: 13,),
                   Text(
                    'dadadadad', 
                    style: TextStyle(color: Colors.white, fontSize: 20)
                  ), 
                     SizedBox(height: 13,),
                   Text(
                    'dadadadad', 
                    style: TextStyle(color: Colors.white, fontSize: 20)
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


 Widget dashboard(context){
   return AnimatedPositioned(
     duration: duraction,
     top:    0,
     bottom: 0,
     left:   isCollapsed    ? 0 :0.6 * screenWidth,
     right:  isCollapsed    ? 0 : -0.4 * screenWidth,
     child: ScaleTransition(
       scale: _scaleAnimation,
       child: Material(
         animationDuration: duraction,
         borderRadius: isCollapsed ? BorderRadius.zero : BorderRadius.only( 
           topLeft: Radius.circular(40),  
           bottomLeft: Radius.circular(40)
           ),
         elevation: 8,
         color: backgroundColor, 
         child: Container(
           margin: EdgeInsets.only(top: 12),
           padding: EdgeInsets.only(left: 16, right: 16, top: 16),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      child: Icon( Icons.menu, color: Colors.white), 
                      onTap: (){
                        setState( (){
                          
                          if(isCollapsed)
                             _controller.forward();
                          else
                            _controller.reverse();

                          isCollapsed = !isCollapsed;
                        });
                      },
                    ), 
                    Text(
                      "my Cards", style: TextStyle( fontSize: 24, color: Colors.white)
                    ),
                     Icon( Icons.settings, color: Colors.white), 
                  ],
                ), 

               SizedBox(height: 20,),

                //Outros
                Container(
                  height: 200,
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    controller: PageController(viewportFraction: 0.8),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        color: Colors.redAccent,
                        width: 100,
                      ), 
                       Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        color: Colors.yellow,
                        width: 100,
                      ), 
                       Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        color: Colors.green,
                        width: 100,
                      ), 
                    ],
                  ),
                ),   
              ],
           ),
         ),
       ),
     ),
   );
}



}

