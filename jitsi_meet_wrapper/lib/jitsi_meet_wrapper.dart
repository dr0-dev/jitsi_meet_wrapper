import 'dart:async';

import 'package:jitsi_meet_wrapper_platform_interface/jitsi_meet_wrapper_platform_interface.dart';

export 'package:jitsi_meet_wrapper_platform_interface/jitsi_meet_wrapper_platform_interface.dart'
    show
        JitsiMeetingOptions,
        JitsiMeetingResponse,
        FeatureFlag,
        JitsiMeetingListener;

class JitsiMeetWrapper {
  /// Joins a meeting based on the JitsiMeetingOptions passed in.
  /// A JitsiMeetingListener can be attached to this meeting that will automatically
  /// be removed when the meeting has ended
  static Future<JitsiMeetingResponse> joinMeeting({
    required JitsiMeetingOptions options,
    JitsiMeetingListener? listener,
  }) async {
    assert(options.roomNameOrUrl.trim().isNotEmpty, "room is empty");

    if (options.serverUrl?.isNotEmpty ?? false) {
      assert(Uri.parse(options.serverUrl!).isAbsolute,
          "URL must be of the format <scheme>://<host>[/path], like https://someHost.com");
    }

    return await JitsiMeetWrapperPlatformInterface.instance
        .joinMeeting(options: options, listener: listener);
  }

  static Future<dynamic> setAudioEnabled({required bool enabled}) async {
    return await JitsiMeetWrapperPlatformInterface.instance
        .setAudioEnabled(enabled : enabled);
  }

  static Future<dynamic> hangup() async {
    return await JitsiMeetWrapperPlatformInterface.instance
        .hangup();
  }
}
