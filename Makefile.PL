use inc::Module::Install;
name 'Plack-Middleware-ValidateContentLength';
all_from 'lib/Plack/Middleware/ValidateContentLength.pm';

# requires '';


readme_markdown_from 'lib/Plack/Middleware/ValidateContentLength.pm';
tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests('xt');
# use_test_base;
auto_include;
WriteAll;
