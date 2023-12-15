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
