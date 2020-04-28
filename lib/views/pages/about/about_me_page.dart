import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwidgets/app/style/TolyIcon.dart';
import 'package:flutterwidgets/compoents/permanent/circle_image.dart';
import 'package:flutterwidgets/compoents/permanent/feedback_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 220,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    margin: EdgeInsets.only(bottom: 50),
                    child: Image.asset('assets/images/drawer_head.jpg',
                        fit: BoxFit.cover),
                  ),
                  _buildBar(context),
                  Positioned(
                      bottom: 0,
                      left: 50,
                      child: CircleImage(
                        size: 100,
                        shadowColor: Theme
                            .of(context)
                            .primaryColor,
                        image: AssetImage('assets/images/icon_head.png'),
                      )),
                ],
              ),
            ),
            Container(
              height: 80,
              margin: EdgeInsets.only(left: 24,top: 24,right: 24),
              child: Stack(
//              fit: StackFit.expand,
                //此参数用于决定没有定位的子widget如何去适应Stack的大小。StackFit.loose表示使用子widget的大小，StackFit.expand表示扩伸到Stack的大小。如果没有定位会根据当前子控件的最大值宽度
                children: <Widget>[
                  Positioned(
                    right: 10,
                    top: 0,
                    child: _buildLinkIcon(),
                  ),
                  Positioned(
                      left: 10,
                      top: 10,
                      child: Text(
                        '小官在江湖',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                  ),
                ],
              ),
            ),
            _buildInfo()
          ],
        ),
      )
    );
  }

  Widget _buildBar(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      margin: EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .padding
              .top), //我们通常取上边刘海高度和下边导航高度
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.arrow_back,
                  size: 30, color: Theme
                      .of(context)
                      .primaryColor),
            ),
          ),
          Spacer(),
          FeedbackWidget(
            onPressed: () {
              _launchURL("mailto:285324370@qq.com?subject=来自Flutter Unit");
            },
            child: Icon(
              TolyIcon.icon_email,
              size: 20,
              color: Theme
                  .of(context)
                  .primaryColor,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  Widget _buildLinkIcon() {
    return Wrap(
      spacing: 20,
      children: <Widget>[
        FeedbackWidget(
            onPressed: () =>
                _launchURL("https://juejin.im/user/5865a78ab123db005dd547c2"),
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Icon(
                  TolyIcon.icon_juejin,
                  size: 35,
                  color: Colors.blue,
                ),
                Text('掘金')
              ],
            )),
        FeedbackWidget(
            onPressed: () => _launchURL("https://github.com/sgyf1109/flutter_widgets"),
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Icon(
                  TolyIcon.icon_github,
                  size: 35,
                ),
                SizedBox(
                  height: 4,
                ),
                Text('Github')
              ],
            )),
      ],
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Divider(
          height: 18,
        ),
        Text(
          '微信群: 编程技术交流圣地-【Flutter群】\n'
              '愿青梅煮酒，与君天涯共话。',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 190,
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/wechat.jpg'),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
