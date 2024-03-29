# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{meta_search}
  s.version = "1.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ernie Miller"]
  s.date = %q{2011-07-07 00:00:00.000000000Z}
  s.description = %q{
      Allows simple search forms to be created against an AR3 model
 \     and its associations, has useful view helpers for sort links
      and multiparameter fields as well.
    }
  s.email = %q{ernie@metautonomo.us}
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = [".document", ".gitmodules", "CHANGELOG", "LICENSE", "README.rdoc", "Rakefile", "VERSION", "lib/meta_search.rb", "lib/meta_search/builder.rb", "lib/meta_search/exceptions.rb", "lib/meta_search/helpers.rb", "lib/meta_search/helpers/form_builder.rb", "lib/meta_search/helpers/form_helper.rb", "lib/meta_search/helpers/url_helper.rb", "lib/meta_search/join_dependency.rb", "lib/meta_search/locale/en.yml", "lib/meta_search/method.rb", "lib/meta_search/model_compatibility.rb", "lib/meta_search/searches/active_record.rb", "lib/meta_search/utility.rb", "lib/meta_search/where.rb", "meta_search.gemspec", "test/fixtures/companies.yml", "test/fixtures/company.rb", "test/fixtures/data_type.rb", "test/fixtures/data_types.yml", "test/fixtures/developer.rb", "test/fixtures/developers.yml", "test/fixtures/developers_projects.yml", "test/fixtures/note.rb", "test/fixtures/notes.yml", "test/fixtures/project.rb", "test/fixtures/projects.yml", "test/fixtures/schema.rb", "test/helper.rb", "test/locales/es.yml", "test/locales/flanders.yml", "test/test_search.rb", "test/test_view_helpers.rb"]
  s.homepage = %q{http://metautonomo.us/projects/metasearch/}
  s.post_install_message = %q{
*** Thanks for installing MetaSearch! ***
Be sure to check out http://metautonomo.us/projects/metasearch/ for a
walkthrough of MetaSearch's features, and click the donate button if
you're feeling especially appreciative. It'd help me justify this
"open source" stuff to my lovely wife. :)

}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Object-based searching (and more) for simply creating search forms.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.0.2"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.0.2"])
      s.add_runtime_dependency(%q<actionpack>, ["~> 3.0.2"])
      s.add_runtime_dependency(%q<arel>, ["~> 2.0.2"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<activerecord>, ["~> 3.0.2"])
      s.add_dependency(%q<activesupport>, ["~> 3.0.2"])
      s.add_dependency(%q<actionpack>, ["~> 3.0.2"])
      s.add_dependency(%q<arel>, ["~> 2.0.2"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<activerecord>, ["~> 3.0.2"])
    s.add_dependency(%q<activesupport>, ["~> 3.0.2"])
    s.add_dependency(%q<actionpack>, ["~> 3.0.2"])
    s.add_dependency(%q<arel>, ["~> 2.0.2"])
  end
end
