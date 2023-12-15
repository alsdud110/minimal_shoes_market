- 이 프로젝트에서 외워야 할 것
1. bottomNavigationBar 
    - MyBottomNavBar 라는 위젯을 만든다.
    - Function(int?) onTabChange 변수 선언
    - Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: GNav(
            activeColor: Colors.grey.shade700,
            tabActiveBorder: Border.all(color: Colors.white),
            tabBackgroundColor: Colors.grey.shade100,
            mainAxisAlignment: MainAxisAlignment.center,
            tabBorderRadius: 16,
            gap: 8,
            onTabChange: onTabChange,
            tabs: const [
            GButton(
                icon: Icons.home,
                text: "Shop",
            ),
            GButton(
                icon: Icons.shopping_bag_rounded,
                text: "Cart",
            ),
            ],  
        ),
    );

    - bottomNavigationBar를 배치할 페이지에서
    - bottomNavigationBar: MyBottomNavBar(
        onTapChange: (index) => navigateBottomBar(index!),
        ),
      body: _pages[_selectedIndex],

    - int _selectedIndex = 0;

    - void navigateBottomBar(int index) {
        setState(() {
            _selectedIndex = index;
        });
    }

    - final List<Widget> _pages = [];


 2. appbar 에서 Drawer 사용하기    
    - appBar: AppBar(
        leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.menu,=),
                onPressed: () {
                    Scaffold.of(context).openDrawer();
                }
            ),
        )
    )

    - drawer: Drawer(
        child : Container(~~),
    )

    그럼 drawer에서 해놓은걸 appbar에서 적용된다.


 3. 상태관리 Provider 사용
    - pubspec.yaml 에 provider: 추가 (버전 없이)
    - main.dart에 MaterialApp을 ChangeNotifierProvier()로 감싼다.
        - 예:
            - return ChangeNotifierProvider(
                create: (context) => Cart(),    // 데이터 변동이 있을 Model class
                builder: (context, child) => MaterialApp(
                theme: ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
                debugShowCheckedModeBanner: false,
                home: const IntroScreen(),
            ),
        );
    
    - Model class 에 extends ChangeNotifier 를 받아준다.
        - 예:
            - class Model extends ChangeNotifier(

            )

    - Model class 에서 사용할 CRUD메서드 마다 마지막에 notifyListeners(); 를 넣어준다.

    - 상태관리를 받을 페이지들에서 위젯 전체를 Consumer<Model>(
        builder: (context, value, child) => Container or Column(~~)
    )

    - 그럼 그 페이지에서 CRUD메서드를 사용하려면 Provider.of<Model>(context, listen: false).메서드(Model 객체);

    - value.메서드도 가능!
