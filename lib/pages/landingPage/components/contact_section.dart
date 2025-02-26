import 'package:flutter/material.dart';
import 'package:ischool/config/responsive.dart';
import 'package:ischool/config/size_config.dart';
import 'package:ischool/pages/landingPage/components/contact_form_field.dart';
import 'package:ischool/utils/app_styles.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController messageController = TextEditingController();
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: Responsive.isMobile(context)
          ? SizeConfig.screenHeight! * 1.3
          : SizeConfig.screenHeight! * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
        child: Responsive.isMobile(context)
            ? Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Send a message"),
                          const Text(
                            "Contact Form",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          ContactFormField(
                            controller: nameController,
                            labelText: 'Your Name',
                            prefixIcon: const Icon(Icons.person_2_outlined),
                          ),
                          const SizedBox(height: 10),
                          ContactFormField(
                            controller: emailController,
                            labelText: 'Email Address',
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.email_outlined),
                          ),
                          const SizedBox(height: 10),
                          ContactFormField(
                            controller: messageController,
                            labelText: 'Message Content',
                            maxLines: 5,
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(AppTheme.accent),
                              padding: const WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                              ),
                            ),
                            child: const Text(
                              "Send Message",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ]),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("We are Kingsly Academy"),
                          const Text(
                            "Contact Us",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const ListTile(
                            leading: Icon(
                              Icons.directions,
                            ),
                            title: Text(
                              "Off Likoni -Mtongwe roads - Mombasa, Kenya",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const ListTile(
                            leading: Icon(
                              Icons.email_outlined,
                            ),
                            title: Text(
                              "kinslybyrone17@gmail.com",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const ListTile(
                            leading: Icon(
                              Icons.call_outlined,
                            ),
                            title: Text(
                              "+254720041750",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook_outlined)),
                            const SizedBox(width: 5),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.discord_outlined)),
                            const SizedBox(width: 5),
                          ])
                        ]),
                  ),
                ],
              )
            : Row(children: [
                Expanded(
                  flex: 1,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Send a message"),
                        const Text(
                          "Contact Form",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        ContactFormField(
                          controller: nameController,
                          labelText: 'Your Name',
                          prefixIcon: const Icon(Icons.person_2_outlined),
                        ),
                        const SizedBox(height: 10),
                        ContactFormField(
                          controller: emailController,
                          labelText: 'Email Address',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                        const SizedBox(height: 10),
                        ContactFormField(
                          controller: messageController,
                          labelText: 'Message Content',
                          maxLines: 5,
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(AppTheme.accent),
                            padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                            ),
                          ),
                          child: const Text(
                            "Send Message",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ]),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("We are Kingsly Academy"),
                        const Text(
                          "Contact Us",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const ListTile(
                          leading: Icon(
                            Icons.directions,
                          ),
                          title: Text(
                            "Off Likoni -Mtongwe roads - Mombasa, Kenya",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.email_outlined,
                          ),
                          title: Text(
                            "kinslybyrone17@gmail.com",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.call_outlined,
                          ),
                          title: Text(
                            "+254720041750",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.facebook_outlined)),
                          const SizedBox(width: 5),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.discord_outlined)),
                          const SizedBox(width: 5),
                        ])
                      ]),
                ),
              ]),
      ),
    );
  }
}
