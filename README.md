# hacker_club
# implementation
An app written in dart,
A forum where people interested in hacking stuffs can join minds together and release a forum for people to read, blogs, docs and the likes


# disclaimer
 many features havent been uploaded yet,
but actively working to make it bere


# Initialization and /
# requirements
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  provider:
  firebase_auth: ^0.15.2
  cloud_firestore:
  google_sign_in:
  intl: ^0.17.0
  date_time_picker: ^2.0.0
  flutter_datetime_picker:
  ```
## Getting Started
# UI
```dart
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  void _signOut(BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.signOut();
    if (_returnString == "success") {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (
            context,
          ) =>
                  OurRoot()),
          (route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    CurrentGroup _currentGroup =
        Provider.of<CurrentGroup>(context, listen: false);
    _currentGroup.uppdateStateFromDatabase(_currentUser.getCurrentUser.groupId);
  }

  void _goToAddBook(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (
          context,
        ) =>
                OurAddBook(onGroupCreation: false,)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(21.0),
          child: OurContainer(
            child: Consumer<CurrentGroup>(
              builder: (BuildContext context, value, Widget child) {
                return Column(children: [
                  Text(
                    value.getCurrentBook.name ?? "loading..",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      children: [
                        Text(
                          "Must Finish In: ",
                          style: TextStyle(fontSize: 30, color: Colors.grey[500]),
                        ),
                        Expanded(
                          child: Text(
                            (value.getCurrentGroup.currentBookDue != null)
                                ? value.getCurrentGroup.currentBookDue.toDate()
                                    .toString()
                                : "New Task..",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  RaisedButton(
                    child: Text("Finished Material",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  )
                ]);
              },
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(21.0),
            child: OurContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next Topic in: ",
                        style: TextStyle(fontSize: 30, color: Colors.grey),
                      ),
                      Text(
                        "72 hours",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 22.0),
          child: RaisedButton(
              child: Text(
                "Hacker News ",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _goToAddBook(context)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: RaisedButton(
            child: Text("Sign Out "),
            onPressed: () => _signOut(context),
            color: Theme.of(context).canvasColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                    color: Theme.of(context).secondaryHeaderColor, width: 2)),
          ),
        )
      ],
    ));
  }
}
```









