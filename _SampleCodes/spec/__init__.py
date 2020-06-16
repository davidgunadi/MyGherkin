from importlib import import_module

SPECS = [
    'spec.common',
    'spec.curl',
    'spec.ftp',
    'spec.scenario',
    'spec.shell',
    'spec.sql',
    'spec.stopwatch',
    'spec.ui_browser',
    'spec.variables',
    'spec.internal',
]

SPEC_IMPLS = {
    'Common': 'spec.impl.common_impl.CommonImpl',
    'Http': 'spec.impl.curl_impl.HttpImpl',
    'Ftp': 'spec.impl.ftp_impl.FtpImpl',
    'Scenario': 'spec.impl.scenario_impl.ScenarioImpl',
    'Shell': 'spec.impl.shell_impl.ShellImpl',
    'Sql': 'spec.impl.sql_impl.SqlImpl',
    'Stopwatch': 'spec.impl.stopwatch_impl.StopwatchImpl',
    'UiBrowser': 'spec.impl.ui_browser_impl.UiBrowserImpl',
    'Variables': 'spec.impl.variables_impl.VariablesImpl',
    'Internal': 'spec.impl.internal_impl.InternalImpl',
}

SPEC_IMPL_CLASSES = None


def load_specs():
    specs = [import_module(it).spec for it in SPECS]

    # Load implementations to populate spec implementation status
    load_spec_impl_classes()
    return specs


def load_spec_impl_classes():
    global SPEC_IMPL_CLASSES
    if not SPEC_IMPL_CLASSES:
        SPEC_IMPL_CLASSES = {name: _import_class(cls_name) for name, cls_name in SPEC_IMPLS.items()}
    return SPEC_IMPL_CLASSES


def _import_class(name: str):
    components = name.rsplit('.', 1)
    module = import_module(components[0])
    return getattr(module, components[1])
