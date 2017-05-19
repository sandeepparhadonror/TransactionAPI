require File.expand_path("../environment", __FILE__)
require "transaction"
require "transaction/web"
run Transaction::Web.server
