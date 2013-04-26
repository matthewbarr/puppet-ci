# Class: Installs the plugins for jenkins.  must run after the jenknins
# package is installed, to make sure that user is created ok.
#
#
class puppetci::plugins {
  jenkins::plugin {'git':}
  jenkins::plugin {'git-client':}
  jenkins::plugin {'github': }
  jenkins::plugin {'github-api': }
  jenkins::plugin {'ghprb': }
  jenkins::plugin {'ruby': }
  jenkins::plugin {'ruby-runtime': }
  jenkins::plugin {'project-health-report': }
  jenkins::plugin {'saferestart': }
  jenkins::plugin {'copy-project-link':}
  jenkins::plugin {'rvm': }
  jenkins::plugin {'greenballs':}
  jenkins::plugin {'postbuild-task':}
  jenkins::plugin {'token-macro':}
  jenkins::plugin {'warnings':}
  jenkins::plugin {'analysis-core':}
  jenkins::plugin {'htmlpublisher':}
}
