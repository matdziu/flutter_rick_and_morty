import 'package:rick_and_morty/data/network/dtos/characters/characters_response_info.dart';

import '../../../../common_test/base_test_factory.dart';

class BasicCharactersResponseInfoFactory
    extends BaseTestFactory<CharactersResponseInfo> {
  static const count = 100;
  static const pages = 20;
  static const next = 'next/page/url';
  static const prev = 'prev/page/url';

  @override
  CharactersResponseInfo create() {
    return CharactersResponseInfo(
      count: count,
      pages: pages,
      next: next,
      prev: prev,
    );
  }
}
